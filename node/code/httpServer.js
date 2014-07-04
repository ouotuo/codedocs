//simple http
var http = require('http');
var fs = require('fs');
var index = fs.readFileSync('index.html');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(index);
}).listen(9615);

//simple
var http = require('http');
var url=require("url");
http.createServer(function (req, res) {
    var queryObject = url.parse(req.url,true).query;
    callback=queryObject.callback;
    console.log(queryObject);
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end("hello world");
}).listen(9615);
