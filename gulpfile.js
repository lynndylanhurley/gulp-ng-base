'use strict';
// Generated on 2014-03-18 using generator-gulp-webapp 0.0.4

var gulp    = require('gulp');
var wiredep = require('wiredep').stream;
var sprite  = require('css-sprite').stream;

// Load plugins
var $ = require('gulp-load-plugins')();

// Styles
gulp.task('styles', function () {
  return gulp.src('app/styles/deps.scss')
    .pipe($.rubySass({
      style: 'expanded',
      loadPath: ['app/bower_components']
    }))
    .pipe($.autoprefixer('last 1 version'))
    .pipe(wiredep({
      directory: 'app/bower_components',
      ignorePath: 'app/bower_components/'
    }))
    .pipe(gulp.dest('dist/styles'))
    .pipe($.size());
});

gulp.task('stylus', function() {
  return gulp.src(['app/styles/**/*.styl'])
    .pipe($.changed('dist/styles'))
    .pipe($.stylus({
      set: ['compress'],
      use: ['nib'],
      import: ['nib']
    }))
    .pipe(gulp.dest('dist/styles'))
    .pipe($.size());
})

// JS
gulp.task('js', function () {
  return gulp.src('app/scripts/**/*.js')
    .pipe($.jshint('.jshintrc'))
    .pipe($.jshint.reporter('default'))
    .pipe($.size());
});

// Coffeescript
gulp.task('coffee', function() {
  return gulp.src('app/scripts/**/*.coffee')
    .pipe($.changed('dist/scripts'))
    .pipe($.coffee({bare: true})
    .on('error', $.util.log))
    .pipe(gulp.dest('dist/scripts'))
    .pipe($.size());
});

// HTML
gulp.task('html', function () {
  return gulp.src('app/*.html')
    .pipe($.useref())
    .pipe(gulp.dest('dist'))
    .pipe($.size());
});

// Jade to HTML
gulp.task('templates', function() {
  var LOCALS = {};

  return gulp.src('./app/*.jade')
    .pipe($.changed('dist'))
    .pipe($.jade({
      locals: LOCALS
    }))
    .pipe(wiredep({
      directory: 'app/bower_components',
      ignorePath: 'app/'
    }))
    .pipe(gulp.dest('dist'))
    .pipe($.size());
});

// Jade to JS
gulp.task('jstemplates', function() {
  gulp.src('app/views/**/*.jade')
    .pipe($.jade({
      client: true
    }))
    .pipe(gulp.dest('dist/views'));
});

// Images
gulp.task('images', function () {
  return gulp.src('app/images/**/*')
    .pipe($.cache($.imagemin({
      optimizationLevel: 3,
      progressive: true,
      interlaced: true
    })))
    .pipe(gulp.dest('dist/images'))
    .pipe($.size());
});

// Sprites
gulp.task('sprites', function() {
  return gulp.src('app/images/sprites/**/*.png')
    .pipe(sprite({
      name:      'sprite.png',
      style:     'sprite.styl',
      cssPath:   '/images',
      processor: 'stylus'
    }))
    .pipe($.if('*.png', gulp.dest('dist/images')))
    .pipe($.if('*.styl', gulp.dest('app/styles')))
    .pipe($.size());
});

// Clean
gulp.task('clean', function () {
  return gulp.src(['dist/styles', 'dist/scripts', 'dist/images', 'dist/*.*'], {read: false}).pipe($.clean());
});

// Bundle
gulp.task('bundle', ['templates', 'sprites', 'styles', 'stylus', 'coffee', 'js'], $.bundle('./app/*.html'));

// Build
gulp.task('build', ['html', 'bundle', 'images']);

// Default task
gulp.task('default', ['clean'], function () {
  gulp.start('build');
});

// Connect
gulp.task('connect', $.connect.server({
  root: ['dist', 'app'],
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
gulp.task('watch', ['bundle', 'karma', 'connect'], function () {
  // Watch for changes in `app` folder
  gulp.watch([
    'dist/*.html',
    'dist/styles/**/*.css',
    'dist/scripts/**/*.js',
    'dist/images/**/*'
  ], function(event) {
    return gulp.src(event.path)
      .pipe($.connect.reload());
  });

  // Watch .scss files
  gulp.watch('app/styles/**/*.scss', ['styles']);

  // Watch .styl files
  gulp.watch('app/styles/**/*.styl', ['stylus']);

  // Watch sprites
  gulp.watch('app/images/sprites/**/*.png', ['sprites', 'stylus']);

  // Watch .js files
  gulp.watch('app/scripts/**/*.js', ['js']);

  // Watch .coffee files
  gulp.watch('app/scripts/**/*.coffee', ['coffee']);

  // Watch .jade files
  gulp.watch('app/*.jade', ['templates']);
  gulp.watch('app/views/**/*.jade', ['jstemplates']);

  // Watch image files
  gulp.watch('app/images/**/*', ['images']);

  // Watch bower files
  gulp.watch('app/bower_components/*', ['karma', 'templates', 'styles']);
});

// TODO:
// [x] sprites
// [x] stylus
// [x] changed
// [x] cached
// [ ] s3
// [ ] deploy
