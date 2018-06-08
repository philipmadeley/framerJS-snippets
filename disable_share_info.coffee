plugin.run = (contents, options) ->
	"""
#{contents}

Framer.Extras.ShareInfo.disable()

	"""
