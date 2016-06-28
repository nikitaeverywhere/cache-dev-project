var gulp = require("gulp"),
    rimraf = require("gulp-rimraf"),
    rename = require("gulp-rename"),
    preprocess = require("gulp-preprocess"),
    pkg = require("./package.json");

var sourceDir = __dirname + "/source",
    buildDir = __dirname + "/build",
    context = { package: pkg };

gulp.task("clean", function () {
    return gulp.src(buildDir, { read: false })
        .pipe(rimraf());
});

gulp.task("cls", ["clean"], function () {
    return gulp.src(sourceDir + "/cls/**/*.cls")
        .pipe(rename(function (f) {
            f.basename = (f.dirname === "." ? "" : f.dirname) + "." + f.basename;
            f.dirname = ".";
        }))
        .pipe(preprocess(context))
        .pipe(gulp.dest(buildDir + "/cls"));
});

gulp.task("default", ["cls"]);