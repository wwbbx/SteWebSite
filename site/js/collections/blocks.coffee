app = app || {}

app.Blocks = Backbone.Collection.extend({
	model: app.Block
	url:'/api/blocks'
	})