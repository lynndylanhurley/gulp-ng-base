'use strict';
// Generated on 2014-03-18 using generator-gulp-webapp 0.0.4

var gulp    = require('gulp');
var wiredep = require('wiredep').stream;
var sprite  = require('css-sprite').stream;
var config  = require('config');
var cached = require('gulp-cached');

// Load plugins
var $ = require('gulp-load-plugins')();

// Sass
gulp.task('sass', function () {
  return gulp.src('app/styles/deps.scss')
    .pipe(cached('sass'))
    .pipe($.rubySass({
      style: 'expanded',
      loadPath: ['app/bower_components']
    }))
    .pipe($.autoprefixer('last 1 version'))
    .pipe(wiredep({
      directory: 'app/bower_components',
      ignorePath: 'app/bower_components/'
    }))
    .pipe(gulp.dest('.tmp/styles'))
    .pipe($.size());
});


// JS
gulp.task('js', function () {
  return gulp.src('app/scripts/**/*.js')
    .pipe(cached('js'))
    .pipe($.jshint('.jshintrc'))
    .pipe($.jshint.reporter('default'))
    .pipe(gulp.dest('.tmp/scripts'))
    .pipe($.size());
});

// Bower
gulp.task('bowerjs', function() {
  return gulp.src('app/bower_components/**/*.js')
    .pipe(gulp.dest('.tmp/bower_components'))
    .pipe($.size());
});

gulp.task('bowercss', function() {
  return gulp.src('app/bower_components/**/*.css')
    .pipe(gulp.dest('.tmp/bower_components'))
    .pipe($.size());
});

// CoffeeScript
gulp.task('coffee', function() {
  return gulp.src('app/scripts/**/*.coffee')
    .pipe(cached('coffee'))
    .pipe($.changed('dist/scripts'))
    .pipe($.coffee({bare: true})
    .on('error', $.util.log))
    .pipe(gulp.dest('.tmp/scripts'))
    .pipe($.size());
});

// Jade to HTML
gulp.task('templates', function() {
  return gulp.src('app/*.jade')
    .pipe(cached('templates'))
    .pipe($.changed('.tmp'))
    .pipe($.jade({
      pretty: true
    }))
    .pipe(wiredep({
      directory: 'app/bower_components',
      ignorePath: 'app/'
    }))
    .pipe(gulp.dest('.tmp'))
    .pipe($.size());
});

// Jade to JS
gulp.task('jstemplates', function() {
  gulp.src('app/views/**/*.jade')
    .pipe(cached('jstemplates'))
    .pipe($.jade({
      client: true
    }))
    .pipe(gulp.dest('.tmp/views'));
});

// Images
gulp.task('images', function () {
  return gulp.src('app/images/**/*')
    .pipe($.cache($.imagemin({
      optimizationLevel: 3,
      progressive: true,
      interlaced: true
    })))
    .pipe(gulp.dest('.tmp/images'))
    .pipe($.size());
});

// Stylus
gulp.task('stylus', ['sprites'], function() {
  return gulp.src(['app/styles/**/*.styl'])
    .pipe(cached('stylus'))
    .pipe($.changed('.tmp/styles'))
    .pipe($.stylus({
      paths: ['app/styles', '.tmp/styles'],
      set: ['compress'],
      use: ['nib'],
      import: ['nib']
    }))
    .pipe(gulp.dest('.tmp/styles'))
    .pipe($.size());
});

// Sprites
gulp.task('sprites', function() {
  return gulp.src('app/images/sprites/**/*.png')
    .pipe(cached('sprites'))
    .pipe(sprite({
      name:      'sprite.png',
      style:     'sprite.styl',
      cssPath:   '/images',
      processor: 'stylus'
    }))
    .pipe($.if('*.png', gulp.dest('.tmp/images')))
    .pipe($.if('*.styl', gulp.dest('.tmp/styles')))
    .pipe($.size());
});

// useref
gulp.task('useref', ['transpile', 'images'], function () {
  $.util.log('running useref');
  var jsFilter = $.filter('.tmp/**/*.js');
  var cssFilter = $.filter('.tmp/**/*.css');

  return gulp.src('.tmp/*.html')
    .pipe($.useref.assets())
    .pipe(jsFilter)
    .pipe($.uglify())
    .pipe(jsFilter.restore())
    .pipe(cssFilter)
    .pipe($.minifyCss())
    .pipe(cssFilter.restore())
    .pipe($.useref.restore())
    .pipe($.useref())
    .pipe(gulp.dest('.tmp'))
    .pipe($.size());
});

// Version files
gulp.task('version', ['useref'], function() {
  return gulp.src([
    '.tmp/styles/**/*.css',
    '.tmp/scripts/**/*.js',
    '.tmp/images/**/*.*'
  ], {base: '.tmp'})
    .pipe($.rev())
    .pipe(gulp.dest('dist'))
    .pipe($.rev.manifest())
    .pipe(gulp.dest('dist'))
    .pipe($.size());
});

// Update file version refs
gulp.task('replace', ['version'], function() {
  var manifest = require('./dist/rev-manifest');

  var patterns = []
  for (var k in manifest) {
    patterns.push({
      match: k,
      replacement: manifest[k]
    });
  };

  return gulp.src([
    'dist/styles/**/*.css',
    'dist/*.html'
  ], {base: 'dist'})
    .pipe($.replaceTask({
      patterns: patterns,
      usePrefix: false
    }))
    .pipe(gulp.dest('dist'))
    .pipe($.size());
});


// Deployment
gulp.task('s3', function() {
  var envName = (process.env.NODE_ENV || 'development').toLowerCase();
  var publisher = $.awspublish.create({
    key:    config.AWS_KEY,
    secret: config.AWS_SECRET,
    bucket: 'defsynth-'+envName
  });

  return gulp.src('dist/**/*')
    .pipe($.awspublish.gzip({ext: '.gz'}))
    .pipe(publisher.publish())
    .pipe(publisher.cache())
    .pipe($.awspublish.reporter());
});

// Clean
gulp.task('clean', function () {
  return gulp.src(['dist/*', '.tmp/*'], {read: false}).pipe($.clean());
});

// Transpile
gulp.task('transpile', ['templates', 'sprites', 'sass', 'stylus', 'coffee', 'js', 'bowerjs', 'bowercss']);

// Build
gulp.task('build', ['replace']);

// Default task
gulp.task('default', ['clean'], function () {
  gulp.start('build');
});

// Connect
gulp.task('connect', $.connect.server({
  root: ['dist', '.tmp'],
  port: 9000,
  livereload: true
}));


// Tests (start with `karma start`)
gulp.task('karma', function() {
  // inject bower deps into karma config
  var deps = require('wiredep')({
    directory: 'app/bower_components',
    //ignorePath: '',
    src: 'karma.conf.js',
    fileTypes: {
      js: {
        block: /(([ \t]*)\/\/\s*bower:*(\S*))(\n|\r|.)*?(\/\/\s*endbower)/gi,
        detect: {
          js: /['"](.+)['"]/gi,
          css: /['"](.+)['"]/gi
        },
        replace: {
          js: '"{{filePath}}",',
          css: '"{{filePath}}",',
        }
      }
    }
  });
});


// Watch
gulp.task('dev', ['transpile', 'karma', 'connect'], function () {
  // Watch for changes in `app` folder
  gulp.watch([
    '.tmp/*.html',
    '.tmp/styles/**/*.css',
    '.tmp/scripts/**/*.js',
    '.tmp/images/**/*.*'
  ], function(event) {
    return gulp.src(event.path)
      .pipe($.connect.reload());
  });

  // Watch .scss files
  gulp.watch('app/styles/**/*.scss', ['sass']);

  // Watch .styl files
  gulp.watch(['app/styles/**/*.styl'], ['stylus']);

  // Watch sprites
  gulp.watch('app/images/sprites/**/*.png', ['sprites']);

  // Watch .js files
  gulp.watch('app/scripts/**/*.js', ['js']);

  // Watch .coffee files
  gulp.watch('app/scripts/**/*.coffee', ['coffee']);

  // Watch .jade files
  gulp.watch('app/*.jade', ['templates']);
  gulp.watch('app/views/**/*.jade', ['jstemplates']);

  // Watch image files
  //gulp.watch('app/images/**/*', ['images']);

  // Watch bower files
  gulp.watch('app/bower_components/*', ['bowerjs', 'bowercss']);
});

// TODO:
// [x] sprites
// [x] stylus
// [x] changed
// [x] cached
// [x] config files
// [x] minify
// [ ] add ref to cdn url in build
// [x] bust caches
// [x] s3
// [ ] deploy
// [ ] mocha
