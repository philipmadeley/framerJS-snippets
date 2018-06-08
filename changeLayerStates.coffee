plugin.run = (contents, options) ->
	"""
#{contents}
# FUNCTIONS
changeLayerStates = (state, target) ->
	delay = if state is 'delayed' then 0.03 else 0
	(layer.animate state, delay: i * delay) for layer, i in target

    """
