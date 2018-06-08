plugin.run = (contents, options) ->
	"""
#{contents}

box = new Layer
	width: 200
	height: 300
	style:
		display: 'flex'
		justifyContent: 'space-between'
		alignItems: 'center'
		padding: '20px'

box.center()

dotCount = 6

for i in [0...dotCount]
	dot = new Layer
		parent: box
		width: 20
		height: 20
		backgroundColor: Color.random()
		style:
			position: 'relative'

	"""
