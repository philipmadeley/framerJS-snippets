plugin.run = (contents, options) ->
	"""
#{contents}
setActive = (button) ->
	button.style =
		"color": "#FFF"
		"backgroundColor": "#35bcc2"

setInactive = (button) ->
	button.style =
		"color": "#666"
		"backgroundColor": "#CCC"

# Listen For Clicks
active = null
listenForClicks = (button) ->
	button.onClick ->
		# If button is not active make active
		# And make previous active button inactive
		if active != button
			setActive(button)
			if active
				setInactive(active)

			active = button
		# Allow to unset an active button
		else if active == button
			setInactive(button)

			active = null

# Create buttons
for i in [0..2]
	button = new Layer
		height: 100
		width: 300
		x: Align.center
		y: Align.center(-110+i*110)
		backgroundColor: "#CCC"
		borderRadius: 6
		shadowBlur: 10
		shadowColor: "rgba(0,0,0,0.03)"
		shadowY: 4
		html: "<h6 style='text-align: center; line-height: 100px; font-weight: 300;'>Index \#{i}</h6>"
		style:
			"color": "#666"
			"fontFamily": "Roboto, Helvetica Neue"

	listenForClicks(button)

    """
