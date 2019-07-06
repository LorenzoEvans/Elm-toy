const { task } = require('gulp')
const elm = require('gulp-elm')
const gutil = require('gulp-util')
const plumber = require('gulp-plumber')
const connect = require ('gulp-connect')

const paths = {
    dest: 'dist',
    elm: 'src/*.elm',
    static: 'src/.*{html,css}'
};

task('elm-init', elm.init);

task('default', gulp.parallel('elm-init'), function () {
    return task.src(paths.elm)
        .pipe(plumber())
        .pipe(elm())
        .pipe(gulp.dest(paths.dest))

});

task('static', function () {
    return task.src(paths.static)
        .pipe(plumber())
        .pipe(task.dest(paths.dest))
});

task('watch', function () {
    gulp.watch(paths.elm, ['elm']);
    gulp.watch(paths.static, ['static'])
});

gulp.task('connect', function () {
    connect.server({
        root: 'dest',
        port: 3000
    })
});

gulp.task('build', gulp.parallel('elm', 'static'));
gulp.task('default', ['connect', 'build', 'watch']);

