var express = require('express');
var port = process.env.PORT || 3000;
var distDir = '/dist';
var app = express();

if (process.env.NODE_ENV) {
  distDir += '-'+process.env.NODE_ENV.toLowerCase();
}

app.use(express.static(__dirname + distDir));
app.listen(port);
