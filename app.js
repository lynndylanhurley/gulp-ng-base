var express = require('express');
var port    = process.env.PORT || 9000;
var distDir = '/.tmp';
var app     = express();

if (process.env.NODE_ENV) {
  distDir = 'dist-'+process.env.NODE_ENV.toLowerCase();
} else {
  app.use(require('connect-livereload')());
}

app.use(express.static(__dirname + distDir));
app.listen(port);
