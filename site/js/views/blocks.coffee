app = app || {}

app.BlocksView = Backbone.View.extend({
	el: '#BlocksDiv',

	initialize: (initialBlocks) ->
		this.collection = new app.Blocks(initialBlocks)
		this.render()

	render: ()->
		this.collection.each((item)->
			this.renderBlock(item)
		this)

	renderBlock: (item)->
		blockView = new app.BlockView({
			model: item
			})
		this.$el.append(blockView.render().el)


	})