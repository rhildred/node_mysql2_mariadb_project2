jQuery("document").ready(function(){
	new TabsRouter();
	Backbone.history.start();
});

var TabsRouter = Backbone.Router.extend({
	aTabs: [],
	initialize: function(){
		// this gets the list of tabs
		jQuery.ajax({
			url: "tabs",
			dataType: "json"
		})
		.done(jQuery.proxy(this.renderList, this))
		.fail(function(err){
			console.log(err);
		});
		
		// handles submit of search
		jQuery("#searchForm").submit(jQuery.proxy(this.doSearch, this));
		
		// this gets the current user
		jQuery.ajax({
			url: "currentUser",
			dataType: "json"
		})
		.done(jQuery.proxy(this.renderButtons, this))
		.fail(function(err){console.log(err);});
		
		//handles button clicks
		jQuery("#loginadd").click(jQuery.proxy(this.loginAdd, this));
		jQuery("#edit").click(jQuery.proxy(this.editTab, this));
		
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
	oCurrentUser: null,
	renderButtons: function(oUser){
		if(this.oCurrentUser != null || oUser[0] != null){
			this.oCurrentUser = oUser[0];
			jQuery("#edit").show();
			jQuery("#loginadd").html("Add");
		}
	},
	loginAdd: function(){
		if(this.oCurrentUser != null){
			//adding tab
			alert("add clicked");			
		}else{
			//logging in
			alert("login clicked");						
		}
	},
	editTab: function(){
		alert("edit tab clicked");
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