var mysql = require('mysql2-openshift'), connection = mysql.createConnection({
	user : 'root',
	database : 'digitaldelivery'
});
module.exports.digitaldelivery = function(req, res, next, callback) {
	var sOwner = req.param('owner_id');
	var sSQL = "SELECT * FROM media WHERE owner_id = ?";
	connection.query(sSQL, [sOwner], function(err, rows) {
		if(err){
			console.log(sSQL);
			console.log(err);			
		}
		if (err && callback)
			callback(err);
		// now we want the rows
		res.setHeader("Content-Type", "application/json");
		res.end(JSON.stringify(rows));
		if (callback)
			callback(null);
	});

};