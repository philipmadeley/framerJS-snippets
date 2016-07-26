plugin.run = (contents, options) ->
	"""
#{contents}

screen1 = new Layer
	width: Screen.width, height: Screen.height
	backgroundColor: "#ccc"

screen2 = new Layer
	width: Screen.width, height: Screen.height
	backgroundColor: "#d23d43"

button = new Layer
	width: 300, height: 100

button.center()

switchLayer = (current,next) ->
    next.animate
        properties:
            x: 0
        curve: "ease-out"
        time: 0.15
    animationHideScreen = new Animation
        layer: current
        properties:
            opacity: 0
        time: 0.4
        curve:"ease-in"
    animationOrigin = new Animation
        layer: current
        properties:
            x: Screen.width
            opacity: 1
        time:0.0
    animationHideScreen.on(Events.AnimationEnd,animationOrigin.start)
    animationHideScreen.start()

#example
button.on Events.Click, ->
    switchLayer(screen2, screen1)


    """
