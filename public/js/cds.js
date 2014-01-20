jQuery("document").ready(function(){
	new CdsRouter();
});



var CdsRouter = Backbone.Router.extend({
	aCds: [{
		name: "Cardboard Castles",
		artist:"George Watsky",
		genre: "Hip Hop"
	},
	{
		name: "2112",
		artist: "Rush",
		genre: "Metal"
	}],
	fTemplateList: _.template(jQuery("#albumListTemplate").html()),
	initialize: function(){
		jQuery("#albumList").html("");
		for(var i = 0; i < this.aCds.length; i++){
			var oCd = this.aCds[i];
			oCd.id = i;
			jQuery("#albumList").append(this.fTemplateList(oCd));
		}
		Backbone.history.start();
	},
	routes: {
		"(:i)":"showDetails"
	},
	fTemplateDetails: _.template(jQuery("#artistDetailsTemplate").html()),
	showDetails: function(i){
		if(i == null) i = 0;
		jQuery("#artistDetails").html(this.fTemplateDetails(this.aCds[i]));		
	}
});