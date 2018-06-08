plugin.run = (contents, options) ->
	"""
#{contents}

#---------------------------------- Layers
circle1 = new Layer
	backgroundColor: "salmon"
	borderRadius: "100%"
	opacity: 0.5
circle1.center()

circle2 = new Layer
	backgroundColor: "##FE9A2E"
	borderRadius: "100%"

circle2.draggable.enabled= true
circle2.draggable.momentum= false

#-------------------------------- Circle Collision Detection
circle2.onDrag ->
	dx = circle1.midX - circle2.midX;
	dy = circle1.midY - circle2.midY;
	distance = Math.sqrt(dx * dx + dy * dy);

	if distance < circle1.width/2 + circle2.width/2
		circle1.opacity = 1
	else
		circle1.opacity = 0.5

	"""
