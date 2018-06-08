plugin.run = (contents, options) ->
	"""
#{contents}

box = new Layer
	width: 200
	height: 300

box.center()

dotCount = 6

for i in [0...dotCount]
	dot = new Layer
		parent: box
		width: 20
		height: 20
		backgroundColor: Color.random()
		x: (box.width/dotCount - 1) * i
		y: (box.height/dotCount - 1) * i

lastDotX = box.children[dotCount-1].maxX
lastDotY = box.children[dotCount-1].maxY
spaceRemainingX = box.width - lastDotX
spaceRemainingY = box.height - lastDotY
dotOffsetX = spaceRemainingX/2
dotOffsetY = spaceRemainingY/2

for dot in box.children
	dot.x += dotOffsetX
	dot.y += dotOffsetY

	"""
