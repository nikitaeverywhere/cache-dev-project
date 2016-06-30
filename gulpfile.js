var gulp = require("gulp"),
    rimraf = require("gulp-rimraf"),
    preprocess = require("gulp-preprocess"),
    uglify = require("gulp-uglify"),
    cssMin = require("gulp-cssmin"),
    pkg = require("./package.json");

var sourceDir = __dirname + "/source",
    buildDir = __dirname + "/build",
    context = { context: {
        package: pkg
    }};

gulp.task("clean", function () {
    return gulp.src(buildDir, { read: false })
        .pipe(rimraf());
});

gulp.task("cls", ["clean"], function () {
    return gulp.src(sourceDir + "/cls/**/*.cls")
        .pipe(preprocess(context))
        .pipe(gulp.dest(buildDir + "/cls"));
});

gulp.task("html", ["clean"], function () {
    return gulp.src(sourceDir + "/static/**/*.html")
        .pipe(preprocess(context))
        .pipe(gulp.dest(buildDir + "/static"));
});

gulp.task("js", ["clean"], function () {
    return gulp.src(sourceDir + "/static/**/*.js")
        .pipe(preprocess(context))
        .pipe(uglify())
        .pipe(gulp.dest(buildDir + "/static"));
});

gulp.task("css", ["clean"], function () {
    return gulp.src(sourceDir + "/static/**/*.css")
        .pipe(preprocess(context))
        .pipe(cssMin())
        .pipe(gulp.dest(buildDir + "/static"));
});

gulp.task("default", ["cls", "html", "js", "css"]);