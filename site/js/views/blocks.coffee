app = app || {}

app.BlocksView = Backbone.View.extend({
	el: '#BlocksDiv',

	initialize: (initialBlocks) ->
		this.collection = new app.Blocks()
		this.collection.fetch({reset:true})
		this.render()

		this.listenTo(this.collection, 'add', this.renderBlock)
		this.listenTo(this.collection,'reset', this.render)

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