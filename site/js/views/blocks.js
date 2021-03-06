// Generated by CoffeeScript 1.6.3
var app;

app = app || {};

app.BlocksView = Backbone.View.extend({
  el: '#BlocksDiv',
  initialize: function(initialBlocks) {
    this.collection = new app.Blocks();
    this.collection.fetch({
      reset: true
    });
    this.render();
    this.listenTo(this.collection, 'add', this.renderBlock);
    return this.listenTo(this.collection, 'reset', this.render);
  },
  render: function() {
    return this.collection.each(function(item) {
      return this.renderBlock(item);
    }, this);
  },
  renderBlock: function(item) {
    var blockView;
    blockView = new app.BlockView({
      model: item
    });
    return this.$el.append(blockView.render().el);
  }
});
