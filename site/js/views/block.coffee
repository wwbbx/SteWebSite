app = app || {}

app.BlockView = Backbone.View.extend({
	tagName: 'div',
	className: 'pure-u-1-3',
	template: _.template($('#SingleBlockTemplate').html()),

	render: () ->
		this.$el.html(this.template(this.model.toJSON()))
		return this
	})