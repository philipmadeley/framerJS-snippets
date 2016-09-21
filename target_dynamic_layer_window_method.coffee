plugin.run = (contents, options) ->
	"""
#{contents}
for i in [1..10]
	window["layer\#{i}"] = new Layer
		name:"layer\#{i}"
		x: i * 40
		width: 30
		height: 30

	window["layer\#{i}"].onClick ->
		print @

layer2.onClick ->
	print "hello"

	"""
