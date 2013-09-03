# module dependencies
application_root = __dirname
express = require('express')
path = require('path')
mongoose = require('mongoose')

# Create server
app = express()

# Configure server
app.configure(()->
	# parse request body and populates request.body
	app.use(express.bodyParser())

	# checks request.body for HTTP method overrides
	app.use(express.methodOverride())

	# perform route lookup based on URL and HTTP method
	app.use(app.router)

	# where to serve static content
	app.use(express.static(path.join(application_root, 'site')))

	# show all errors in development
	app.use(express.errorHandler({dumpExceptions:true, showStack:true}))

	)

# Connect to database
# Make sure you start MongoDB using administrator by
# executing "C:\mongodb\bin\mongod.exe"
# MongoDB should create database in C:\data\db directory.
mongoose.connect('mongodb://localhost/SteWebSiteDB')

# Schemas
blocks = new mongoose.Schema({
	title: String,
	description: String,
	image: String
	})

# Models
BlockModel = mongoose.model('Block', blocks)

# Router
# Get all blocks
app.get('/api/blocks', (request, response)->
	return BlockModel.find((err, blocks)->
		if not err
			return response.send(blocks)
		else
			return console.l(err)
		)
	)


# Get a single block by id
app.get('/api/blocks/:id', (request, response)->
	return BlockModel.findById(request.params.id, (err, block)->
		if not err
			return response.send(block)
		else
			return console.log(err)
		)
	)

# Update a block
app.put('/api/blocks/:id', (request,response)->
	console.log('Updating block ' + request.body.title)
	return BlockModel.findById(request.params.id, (err, block)->
		block.title = request.body.title
		block.description = request.body.description
		block.image = request.body.image

		return block.save((err)->
			if not err
				return console.log('block updated.')
			else
				return console.log(err)

			return response.send(block)
			)
		)
	)

# Delete a block
app.delete('/api/blocks/:id', (request, response)->
	console.log('Deleting book with id: ' + request.body.id)
	return BlockModel.findById(request.params.id, (err, block)->
		return block.remove((err)->
			if not err
				console.log('Book removed')
				return response.send('')
			else
				console.log(err)
			)
		)
	)

# Insert a new book
app.post('/api/blocks', (request, response)->
	block = new BlockModel({
		title: request.body.title,
		description: request.body.description,
		image: request.body.image
		})

	block.save((err) ->
		if not err
			return console.log('created')
		else
			return console.log(err)
		)

	return response.send(block);
	)

# Start server
port = 4711
app.listen(port, ()->
	console.log('Express server listening on port %d in %s mode',
		port, app.settings.env)
	)