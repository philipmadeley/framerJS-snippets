plugin.run = (contents, options) ->
	"""
#{contents}

cycler = Utils.cycle(-90, -180, -270, 0)

layer.onClick ->
	nextRotate = cycler()
	layer.rotationZ = if layer.rotationZ <= -270 then 360 + layer.rotationZ else layer.rotationZ
	layer.animate
		properties:
			rotationZ:nextRotate
		curve: "spring(300, 30)"

	"""
