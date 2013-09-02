app = app || {}

$(()->
	blocks = [
		{title: "CFMS", description:"CFMS Web Site", image:"img/PlaceHolderImage.jpg"},
		{title: "ACTIVITY", description:"STE ACTIVITY Statistic", image:"img/PlaceHolderImage.jpg"}
	]

	new app.BlocksView(blocks)
	)