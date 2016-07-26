plugin.run = (contents, options) ->
	"""
#{contents}

array1 = [a, b]
array2 = [c, d]

groups = [array1, array2]

for group in groups
	for layer in group
		layer.states.add
			"inactive":
				scale: 0.75
				opacity: 0.5


toggleLayers = ->
	for group in groups
		for layer in group
			layer.states.next()

button.onClick ->
	toggleLayers()

	"""
