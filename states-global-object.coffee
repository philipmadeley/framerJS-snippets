plugin.run = (contents, options) ->
	"""
#{contents}
states = {}

states.show =
	show:
		properties:
			visible: true

pulseHead = () ->
	headsArr.forEach (layer) ->
		Object.assign layer.states, states.pulse, layer.show

    """
