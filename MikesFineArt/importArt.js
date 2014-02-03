var fs = require ('fs');
var jQuery = require ('js-toolbox')._jQuery;

var mysql = require('mysql2-openshift'), connection = mysql.createConnection({
	user : 'root',
	database : 'mikesfineart'
});

var insertImages = function(sFolder, nArtistID){
	var sImageFolder = './public/images/fineartdatabase/' + sFolder;
	var aWorks = [];
	try {
		aWorks = fs.readdirSync(sImageFolder);
	} catch(e){}
	for(var n = 0; n < aWorks.length; n++){
		var sFileName = aWorks[n];
		if(sFileName.charAt(0) == '.')continue;
		if(sFileName.indexOf('.jpg') == -1) continue;
		console.log(sFileName);
		connection.query(sFindImages, [sFileName], jQuery.proxy(function(err, oResults){
			console.log(oResults);
			if(oResults.length > 0){
				connection.query(sSQLUpdateImage, [this.fileName, oResults.idWorks]);
			}else{
				console.log("id is " + this.artist + " filename is " + this.fileName);
				connection.query(sSQLInsertImage, [this.artist, this.fileName]);
			}
		}, {fileName: sFileName, artist: nArtistID}));
	}	
}
var sSQLInsertArtist = "INSERT INTO artists(folder) VALUES(?)";
var sSQLUpdateArtist = "UPDATE artists SET folder = ? WHERE idArtists = ?";
var sFindArtist = "SELECT * FROM artists WHERE folder like CONCAT(?, '%')";
var sFindImages = "SELECT * FROM works WHERE imageName = ?";
var sSQLInsertImage = "INSERT INTO works(idArtists, imagename) VALUES(?,?)"; 
var sSQLUpdateImage = "UPDATE works SET imageName = ? WHERE idWorks = ?";
var aArtists = fs.readdirSync('./public/images/fineartdatabase/');
for(var n = 0; n < aArtists.length; n++){
	var sFolder = aArtists[n];
	if(sFolder.charAt(0) == '.')continue;
	var sName = sFolder;
	var sFirstName = sFolder.split(/[\s,\-_]+/)[0];
	var oFolder = {folder: sFolder,firstname: sFirstName};
	connection.query(sFindArtist, [sFirstName], jQuery.proxy(function(err, oResults){
		if(err){
			console.log(sFindArtist);
			console.log(err);
		}	
		if (err && callback)
			callback(err);
		// now we want the rows
		console.log(this.firstname);
		console.log(oResults);
		if(oResults.length > 0){
			var nArtistID = oResults[0].idArtists;
			console.log("updated artist id " + nArtistID );
			insertImages(this.folder, nArtistID);
			connection.query(sSQLUpdateArtist, [this.folder, nArtistID]);
		}else{
			connection.query(sSQLInsertArtist, [this.folder], jQuery.proxy(function(err, oResults){
				if(err){
					console.log(sSQLInsertArtist);
					console.log(err);
				}	
				// now we want the rows
				var nArtistID = oResults.insertId;
				console.log("inserted artist id " + nArtistID );
				insertImages(this.folder, nArtistID);
			}, {folder:this.folder}));
		}
	}, oFolder));
}
