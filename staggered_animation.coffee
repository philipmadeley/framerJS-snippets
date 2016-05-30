plugin.run = (contents, options) ->
	"""
#{contents}
layers = []
for i in [0...4]
	layer = layers[i] = new Layer
		name: "layer" + i
	springCurve = 'spring(50, 30, 30)'
	staggeredAnimation = ->
		    for i in [0 .. layers.length-1]
		        layers[i].animate
		            delay: i * 0.1
		            properties:
		                x: 100
		            curve: springCurve

staggeredAnimation()

    """
