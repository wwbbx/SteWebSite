app = app || {}

app.Block = Backbone.Model.extend({
	default: {
		title: "Default Title",
		description: "Default description",
		image: "img/PlaceHolderImage.jpg"
	}
	})