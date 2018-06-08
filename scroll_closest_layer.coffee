plugin.run = (contents, options) ->
	"""
#{contents}

scroll.on Events.Move, (event) ->
	# Always make positive w/ math abs
	if Math.abs(scroll.velocity.y) < 0.2
		scroll.scrollToClosestLayer(0, 0)

	"""
