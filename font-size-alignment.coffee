plugin.run = (contents, options) ->
	"""
#{contents}

text.size = Utils.textSize text.html,
	font: text.style.font

text.center()

	"""
