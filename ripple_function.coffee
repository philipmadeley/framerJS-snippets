plugin.run = (contents, options) ->
	"""
#{contents}

# Create a ripple effect for the layer taking into account pointer position and button style
rippleEffect = (ev, layer) ->

	# Detect whether the device is mobile or desktop. ev.offsetY/Y captures the cursor position on desktop whereas layer.draggable.layerCursorOffset.x/y captures the touch position on mobile
	cursorX = if Utils.isMobile() then layer.draggable.layerCursorOffset.x else ev.offsetX
	cursorY = if Utils.isMobile() then layer.draggable.layerCursorOffset.y else ev.offsetY

	ripple = new Layer
		borderRadius: "50%"
		scale: 0
		opacity: .5
		superLayer: layer
		backgroundColor: layer.backgroundColor
		brightness: 200
		midX: cursorX
		midY: cursorY
		force2d: true
		index: 0

	rippleAnimation = ripple.animate
		properties:
			scale: layer.width / 50
			clip: true
			opacity: 0
		curve: "ease-out"
		time: .4

	# Destroy the ripple effect after click
	rippleAnimation.on "end", -> ripple.destroy()

myLayer.on Events.Click, -> rippleEffect(event, myLayer)

myLayer.clip = true

	"""
