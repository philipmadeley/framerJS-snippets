plugin.run = (contents, options) ->
	"""
#{contents}

Layer::fade = (opacity=0, time=2) ->
	@.states.add
		fade:
			opacity: opacity
	@.states.animationOptions = {curve: 'ease-in-out', time: time}
	@.states.next()
	Utils.interval time, =>
		@.states.next()

myLayer.fade()

myButton.onTouchStart ->
	myLayer.fade(1,2)  # stops the animation after fade-out, myLayer     visible
	#myLayer.fade(1,0) # stops the animation instantly,      myLayer     visible
	#myLayer.fade(0,2) # stops the animation after fade-out, myLayer not visible
	#myLayer.fade(0,0) # stops the animation instantly,      myLayer not visible

	"""
