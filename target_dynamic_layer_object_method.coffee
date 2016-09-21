plugin.run = (contents, options) ->
	"""
#{contents}
layerObj = {}
for id in [1..10]
	layerObj["layer\#{id}"] = new Layer
		name:"layer\#{id}"
		x: id * 40
		width: 30
		height: 30

	layerObj["layer\#{id}"].onClick ->
		print this

layerObj.layer2.onClick ->
	print "hello"

	"""
