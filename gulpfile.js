'use strict';
// Generated on 2014-03-18 using generator-gulp-webapp 0.0.4

var gulp    = require('gulp');
var wiredep = require('wiredep').stream;
var sprite  = require('css-sprite').stream;
var config  = require('config');
var cached  = require('gulp-cached');
var es      = require('event-stream');

// for deployment
var env             = (process.env.NODE_ENV || 'development').toLowerCase();
var tag             = env + '-' + new Date().getTime();
var DIST_DIR        = 'dist';
var LIVERELOAD_PORT = 35729;

if (process.env.NODE_ENV) {
  DIST_DIR += '-'+process.env.NODE_ENV.toLowerCase();
}

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

// TODO: what a mess. maybe move all fonts into one dir?
gulp.task('bower-fonts', function() {
  return gulp.src('app/bower_components/bootstrap-sass/vendor/assets/fonts/bootstrap/*.*')
    .pipe(gulp.dest('.tmp/bower_components/bootstrap-sass/vendor/assets/fonts/bootstrap'))
    .pipe($.size());
})

// CoffeeScript
gulp.task('coffee', function() {
  return gulp.src('app/scripts/**/*.coffee')
    .pipe(cached('coffee'))
    .pipe($.changed('dist/scripts'))
    .pipe($.coffee({bare: true}))
    .on('error', function(e) {
      $.util.log(e.toString());
      this.emit('end');
    })
    .pipe(gulp.dest('.tmp/scripts'))
    .pipe($.size());
});

// Jade to HTML
gulp.task('templates', function() {
  return gulp.src('app/**/*.jade')
    .pipe(cached('templates'))
    .pipe($.changed('.tmp'))
    .pipe($.jade({
      pretty: true
    }))
    .on('error', function(e) {
      $.util.log(e.toString());
      this.emit('end');
    })
    .pipe($.inject(
      $.bowerFiles({read: false}), {
        ignorePath: ['app'],
        starttag: '<!-- bower:{{ext}}-->',
        endtag: '<!-- endbower-->'
      }
    ))
    .pipe($.inject(
      gulp.src(
        [
          '.tmp/views/**/*.js',
          '.tmp/scripts/**/*.js',
          '.tmp/styles/**/*.css'
        ],
        {read: false}
      ), {
        ignorePath: ['.tmp'],
        starttag: '<!-- inject:{{ext}}-->',
        endtag: '<!-- endinject-->'
      }
    ))
    .pipe(gulp.dest('.tmp'))
    .pipe($.size());
});

// Jade to JS
gulp.task('jstemplates', function() {
  return gulp.src('.tmp/views/**/*.html')
    .pipe(cached('jstemplates'))
    .pipe($.ngHtml2js({
      moduleName: 'defsynthPartials'
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
  return gulp.src(['app/styles/*.styl'])
    //.pipe(cached('stylus'))
    //.pipe($.changed('.tmp/styles'))
    .pipe($.stylus({
      paths: ['app/styles', '.tmp/styles'],
      //set: ['compress'],
      use: ['nib'],
      import: ['nib', 'sprite', 'pages/**/*.styl']
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
    .pipe(gulp.dest('.tmp'))
    .pipe($.rev())
    .pipe(gulp.dest('dist'))
    .pipe($.rev.manifest())
    .pipe(gulp.dest('.tmp'))
    .pipe($.size());
});

gulp.task('copy', ['version'], function() {
  return gulp.src(['.tmp/*.html'])
    .pipe(gulp.dest('dist'))
    .pipe($.size());
})

// Update file version refs
gulp.task('replace', ['copy'], function() {
  var manifest = require('./.tmp/rev-manifest');

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

// CDNize
gulp.task('cdnize', ['replace'], function() {
  return gulp.src([
    'dist/*.html',
    'dist/styles/**/*.css'
  ], {base: 'dist'})
    .pipe($.cdnizer({
      defaultCDNBase: config.STATIC_URL,
      allowRev: true,
      allowMin: true,
      files: ['**/*.*']
    }))
    .pipe(gulp.dest('dist'))
    .pipe($.size());
});


// Deployment
gulp.task('s3', function() {
  var envName = (process.env.NODE_ENV || 'development').toLowerCase();
  var headers = {
    'Cache-Control': 'max-age=315360000, no-transform, public'
  };
  var publisher = $.awspublish.create({
    key:    config.AWS_KEY,
    secret: config.AWS_SECRET,
    bucket: 'defsynth-'+envName
  });

  return gulp.src('dist/**/*')
    .pipe($.awspublish.gzip())
    .pipe(publisher.publish(headers))
    .pipe(publisher.sync())
    //.pipe(publisher.cache())
    .pipe($.awspublish.reporter());
});

// Push to heroku
gulp.task('push', ['s3'], $.shell.task([
  'git checkout -b '+tag,
  'cp -R dist '+DIST_DIR,
  'git add -u .',
  'git add .',
  'git commit -am "commit for '+tag+' push"',
  'git push -f '+env+' '+tag+':master',
  'git checkout master',
  'git branch -D '+tag,
  'rm -rf '+DIST_DIR
]));

// Clean
gulp.task('clean', function () {
  return gulp.src(['dist/*', '.tmp/*'], {read: false}).pipe($.clean());
});

// Transpile
gulp.task('transpile', ['sprites', 'sass', 'stylus', 'coffee', 'js', 'bowerjs', 'bowercss', 'bower-fonts']);

// Inject
gulp.task('inject', ['transpile'], function() {
  gulp.start('templates');
});

gulp.task('html2js', ['inject'], function() {
  gulp.start('jstemplates')
});

// Build
gulp.task('build', ['cdnize']);

// Deploy
gulp.task('deploy', ['build'], function() {
  gulp.start('push');
})

// Default task
gulp.task('default', ['clean'], function () {
  gulp.start('build');
});


// E2E Protractor tests
gulp.task('protractor', function() {
  require('coffee-script/register');
  return gulp.src('test/e2e/**/*.coffee')
    .pipe($.protractor.protractor({
      configFile: 'protractor.conf.js'
    }))
    .on('error', function(e) {
      $.util.log(e.toString());
      this.emit('end');
    });
});

gulp.task('test:e2e', ['protractor'], function() {
  gulp.watch('test/e2e/**/*.coffee', ['protractor']);
});


// Watch
gulp.task('dev', ['html2js'], function () {
  var lr      = require('tiny-lr')();
  var nodemon = require('gulp-nodemon');

  // start node server
  $.nodemon({
    script: 'app.js',
    ext: 'html js',
    ignore: []
  })
    .on('restart', function() {
      console.log('restarted');
    });

  // start livereload server
  lr.listen(LIVERELOAD_PORT);

  // Watch for changes in .tmp folder
  gulp.watch([
    '.tmp/*.html',
    '.tmp/styles/**/*.css',
    '.tmp/scripts/**/*.js',
    '.tmp/views/**/*.js',
    '.tmp/images/**/*.*'
  ], function(event) {
    gulp.src(event.path, {read: false})
      .pipe($.livereload(lr));
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
  gulp.watch('app/**/*.jade', ['templates']);
  gulp.watch('.tmp/views/**/*.html', ['jstemplates']);

  // Watch image files
  //gulp.watch('app/images/**/*', ['images']);

  // Watch bower files
  gulp.watch('app/bower_components/*', ['bowerjs', 'bowercss']);
});



// TODO:
// project/workflow
// [x] sprites
// [x] stylus
// [x] changed
// [x] cached
// [x] config files
// [x] minify
// [x] add ref to cdn url in build
// [x] bust caches
// [x] s3
// [x] deploy
// [x] mocha
// [x] automatic dependency injection
// [x] add support server scripts (nodemon?)

// angular
// [x] routes + root ui-view
// [ ] main controller

// css
// [x] sticky footer
// [ ] style guide
