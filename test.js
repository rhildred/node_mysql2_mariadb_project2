var assert = require('assert'),
TestRunner = require('assert-runner'),
tabdb = require('./js/tabdb.js');


var tests = {
    "tabs table": function (done){ 	
    	var oReq = new TestRunner.TestRequest();
    	var oRes = new TestRunner.TestResponse();
    	tabdb.tabs(oReq, oRes, null, function(err){
    		assert(err == null);
    		console.log(oRes.sBody);
    		done();
    	});
    }
};

var oTestRunner = new TestRunner(tests);
oTestRunner.again(0);