/*!
 * bootstrap-card-extender v1.0.0 (http://javatmp.com)
 * Extending bootstrap card by adding option buttons
 * that help make Bootstrap Card more responsive and interactive
 *
 * Copyright 2018 JavaTMP
 * Licensed under MIT (https://github.com/JavaTMP/bootstrap-card-extender/blob/master/LICENSE)
 */

var gulp = require('gulp');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var del = require('del');
var eslint = require('gulp-eslint');

var sass = require('gulp-sass');
var rename = require('gulp-rename');
var cleanCSS = require('gulp-clean-css');
var autoprefixer = require('gulp-autoprefixer');
var header = require('gulp-header');
var pkg = require('./package.json');

var banner = ['/*!',
    ' * <%= pkg.name %> (http://javatmp.com)',
    ' * <%= pkg.description %>',
    ' *',
    ' * @version <%= pkg.version %>',
    ' * @link <%= pkg.homepage %>',
    ' * @copyright 2018 JavaTMP',
    ' * @license <%= pkg.license %>',
    ' */',
    ''].join('\n');


gulp.task('clean', function () {
    return del(['./dist']);
});

gulp.task('sass', ["clean"], function () {
    return gulp.src([
        './sass/bootstrap-card-extender.scss'
    ])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: ['last 2 versions'],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(header(banner, {pkg: pkg}))
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./dist/'));
});

gulp.task('js', ["clean"], function (cb) {
    return gulp.src('./js/bootstrap-card-extender.js')
            .pipe(eslint({
                "env": {"browser": true, "node": true, "jquery": true},
                "rules": {
                    "semi": 2,
                    "eqeqeq": 1,
                    "quotes": 0,
                    "no-trailing-spaces": 1,
                    "eol-last": 1,
                    "no-unused-vars": 0,
                    "no-underscore-dangle": 1,
                    "no-alert": 1,
                    "no-lone-blocks": 1
                },
                "globals": ["jQuery", "$"]
            }))
            .pipe(eslint.format())
            .pipe(uglify({output: {comments: /^!/}}))
            .pipe(header(banner, {pkg: pkg}))
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./dist/'));
});

gulp.task('default', ["sass", "js"], function () {
    // place code for your default task here
});
