plugin.run = (contents, options) ->
	"""
#{contents}
layers = []
for i in [0..9]
   layer = new Layer
   layers.push(layer)
# The two lines above are the same as layer = layers[i] = new Layer

# OR for non-limited
for layer, i in layers
   layer.opacity = i / layers.length   # result: 0.0 to 0.9

    """
