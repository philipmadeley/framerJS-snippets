plugin.run = (contents, options) ->
	"""
#{contents}

shakeIntensity = 10

Layer::wiggle = (time) ->
	moveR = this.animate
		properties: {x: this.x + shakeIntensity}
		time: time

	moveL = this.animate
		properties: {x: this.x - shakeIntensity}
		time: time

	this.on Events.TouchStart,->

		moveR.start()
		moveL.start()

		moveR.on Events.AnimationEnd, -> moveL.start()
		moveL.on Events.AnimationEnd, -> moveR.start()

		# Option 1: Stop after n amount of seconds
		Utils.delay 1, ->
			moveR.stop()
			moveL.stop()

layer.wiggle(0.1)

	"""
