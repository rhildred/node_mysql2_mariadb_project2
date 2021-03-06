var mysql = require('mysql2-openshift'), connection = mysql.createConnection({
	user : 'root',
	database : 'mytab'
});
module.exports.tabs = function(req, res, next, callback) {
	var sTerm = req.param('q') || '%';
	var sSQL = "SELECT * FROM combinedtab WHERE";
	sSQL += " title LIKE CONCAT('%' ? '%')";
	sSQL += " OR artist LIKE CONCAT('%' ? '%')";
	sSQL += " OR arranger LIKE CONCAT('%' ? '%')";
	sSQL += " OR issue LIKE CONCAT('%' ? '%')";
	sSQL += " OR magazine LIKE CONCAT('%' ? '%')";
	sSQL += " OR fakebook LIKE CONCAT('%' ? '%')";
	connection.query(sSQL, [sTerm, sTerm, sTerm, sTerm, sTerm, sTerm], function(err, rows) {
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