const express =require('express');
const app = express();
const http = require('http');
const server=http.createServer(app);


const port = process.env.PORT || 3000;
app.set('port',port);