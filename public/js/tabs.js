jQuery("document").ready(function(){
	new TabsRouter();
	Backbone.history.start();
});

var TabsRouter = Backbone.Router.extend({
	aTabs: [],
	initialize: function(){
		jQuery.ajax({
			url: "tabs",
			dataType: "json"
		})
		.done(jQuery.proxy(this.renderList, this))
		.fail(function(err){
			console.log(err);
		});
		jQuery("#searchForm").submit(jQuery.proxy(this.doSearch, this));
	},
	fTemplateList: _.template(jQuery("#tableLeftTemplate").html()),
	renderList: function(oData){
		this.aTabs = oData;
		jQuery("#tableLeft").html("");
		for(var n = 0; n < this.aTabs.length; n++){
			var oTab = this.aTabs[n];
			oTab.idRow = n;
			jQuery("#tableLeft").append(this.fTemplateList(oTab));
		}
		this.showDetails(0);
	},
	doSearch: function(){
		var oData = jQuery("#searchForm").serialize();
		jQuery.ajax({url: "tabs", dataType: "json", data: oData})
		.done(jQuery.proxy(this.renderList, this))
		.fail(function(err){
			console.log(err);
		});
		return false;
	},
	routes: {
		"(:n)": "showDetails"
	},
	fTemplateDetails: _.template(jQuery("#tableRightTemplate").html()),
	showDetails: function(n){
		if(n == null) n = 0;
		if(n > this.aTabs.length - 1) return;
		var oTab = this.aTabs[n];
		jQuery("#tableRight").html(this.fTemplateDetails(oTab));
	}
});