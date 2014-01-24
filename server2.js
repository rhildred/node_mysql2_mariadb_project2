var renderAsync = require('render-async'),
digitaldelivery = require('./client/js/digitaldelivery.js');

//now we need a server for this so that we can test include
var app= renderAsync.express({welcomeFile: "index.js.html"});

app.set('views', __dirname + '/client/public');

// route for image data
app.get("/customerimages/:owner_id", function(req, res){digitaldelivery.digitaldelivery(req, res);});

// want to serve up special per client subdirectories
app.get("/:customer/", function(req, res){
	renderAsync.__express(__dirname + '/client/public/public.js.html', 
			{customer: req.params.customer}, function(err, html){
		if(err){
			console.log(err);
		}
		res.end(html);
		});
});

// add route for js.html
app.get("*.js.html", renderAsync.renderAsync);

//server everything index.html welcome file
app.use(renderAsync.webServer);


//set ipaddress from openshift, to command line or to localhost:8080
var ipaddr = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1";
var port = process.env.OPENSHIFT_NODEJS_PORT || parseInt(process.argv.pop()) || 8080;
app.set('port', port);
//start the server listening for requests
app.listen(port, ipaddr);
