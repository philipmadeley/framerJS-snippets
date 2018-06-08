plugin.run = (contents, options) ->
	"""
#{contents}

arrayOfLayers = []

[0..4].forEach (num, i) ->
	arrayOfLayers[i] = new Layer
		x: i * 220
		y: Align.center

	arrayOfLayers[i].isOn = false

	arrayOfLayers[i].turnOn = -> @isOn = true
	arrayOfLayers[i].turnOff = -> @isOn = false

	arrayOfLayers[i].states =
		on: {backgroundColor: 'yellow', scale: 1, animationOptions: {time: .3}}
		off: {backgroundColor: 'green', scale: .9,  animationOptions: {time: 0}}

	arrayOfLayers[i].showOn = -> @animate 'on'
	arrayOfLayers[i].showOff = -> @animate 'off'

	arrayOfLayers[i].flipSwitch = ->
		if @isOn is false then @turnOn()
		else if @isOn is true then @turnOff()

		arrayOfLayers.forEach (layer) ->
			if layer isnt arrayOfLayers[i] and layer.isOn is true
				layer.turnOff() #add dot. for layer
			#layer.label = "#{layer.isOn}"

	arrayOfLayers[i].onClick ->
		@flipSwitch()
		updateLayers()

updateLayers = ->
	arrayOfLayers.forEach (layer) ->
		if layer.isOn is true then layer.showOn()
		else if layer.isOn is false then layer.showOff()

updateLayers()

	"""
