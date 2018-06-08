plugin.run = (contents, options) ->
	"""
#{contents}

# IMPORTS
Utils.insertCSS('https://fonts.googleapis.com/css?family=Roboto|Roboto+Condensed')

# DEFAULTS
Framer.Extras.Hints.disable()
Framer.Extras.Preloader.enable()
Framer.Defaults.Animations =
	curve: Bezier(0.4, 0.0, 1, 1)
	time: 0.3

# VARS
sw = Screen.width
sh = Screen.height
ss = Screen.size

# TRANSITION VARS
transIn = Bezier(0.0, 0.0, 0.2, 1)
transOut = Bezier(0.4, 0.0, 1, 1)
transOutReturn = Bezier(0.4, 0.0, 0.6, 1)
transWithin = Bezier(0.4, 0.0, 0.2, 1)

	"""
