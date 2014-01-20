jQuery("document").ready(function(){
	new TabsRouter();
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
	},
	fTemplateList: _.template(jQuery("#tableLeftTemplate").html()),
	renderList: function(oData){
		this.aTabs = oData;
		jQuery("#tableLeft").html();
		for(var n = 0; n < this.aTabs.length; n++){
			jQuery("#tableLeft").append(this.fTemplateList(this.aTabs[n]));
		}
	}
});