plugin.run = (contents, options) ->
	"""
#{contents}
Framer.Loop.delta = 1 / 300

    """
