var renderAsync = require('render-async'),
jQuery = require('js-toolbox')._jQuery,
renderFile = renderAsync.__express,
GoogleLogin = require('google-login'),
tabdb = require('./js/tabdb.js');

//now we need a server for this so that we can test include
var app= renderAsync.express();

app.set('views', __dirname + '/public');

// add a route to login and another one to see the logged in user (if there is no logged in user then redirect)

var oGoogleLogin = new GoogleLogin();
app.get('/login', jQuery.proxy(oGoogleLogin.login, oGoogleLogin));
//don't need to proxy this because the currentUser is in the session 
app.get('/logout', oGoogleLogin.logout);
app.get('/currentUser', oGoogleLogin.currentUser);

// this is the route to get my tabs
app.get('/tabs', function(req, res){tabdb.tabs(req, res);});

//server everything index.html welcome file
app.use(renderAsync.webServer);


//set ipaddress from openshift, to command line or to localhost:8080
var ipaddr = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1";
var port = process.env.OPENSHIFT_NODEJS_PORT || parseInt(process.argv.pop()) || 8080;
app.set('port', port);
//start the server listening for requests
app.listen(port, ipaddr);
