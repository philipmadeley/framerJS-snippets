plugin.run = (contents, options) ->
	"""
#{contents}

preloaderImage = new Layer
	width:  32
	height:  32
	image: "images/preloaderImage.png"
	parent: videoDocCapture
	opacity: 0

preloaderImage.center()

rotatePreloaderImage = new Animation preloaderImage,
	rotation: 360
	options:
		curve: "linear"
		time: 1
		repeat: Infinity

	"""
