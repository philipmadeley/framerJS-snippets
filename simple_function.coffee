plugin.run = (contents, options) ->
	"""
#{contents}
Layer::slideInUp = ->
	this.animate
		properties:
			y: 0
			x: 0
		curve: 'spring(400, 30)'
		time: 0.3

	"""
