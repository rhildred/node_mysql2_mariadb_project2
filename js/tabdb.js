var mysql = require('mysql2-openshift'), connection = mysql.createConnection({
	user : 'root',
	database : 'mytab'
});
module.exports.tabs = function(req, res, next, callback) {
	var sName = req.param('q') || '%';
	var sSQL = "SELECT * FROM combinedtab";
	console.log(sSQL);
	connection.query(sSQL, [sName], function(err, rows) {
		if (err && callback)
			callback(err);
		// now we want the rows
		res.setHeader("Content-Type", "application/json");
		res.end(JSON.stringify(rows));
		if (callback)
			callback(null);
	});

};