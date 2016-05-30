plugin.run = (contents, options) ->
	"""
#{contents}

#–––––––– Move to module file
class exports.Button extends Layer
	constructor: (options={}) ->
		#these are the basic properties
		#there's a default for everything, you can see them after the || (or) operator
		@type = options.type || "single"
		@baseColor = options.baseColor || "#666"
		@hoverColor = options.hoverColor || "#226699"
		@clickColor = options.clickColor || "#222"
		@default_height = 100
		@default_width = 200
		@textSize = options.textSize || "28px"

		# maybe it could be a default function -> print "Action not defined"
		# but to make it shorter, I added directly here
		# you can always replace it with btn.action = functionName
		# or just ""

		@action = options.action || -> print "This was Clicked"

		@label = options.label || "button"

		#Layer properties
		options.x = options.x || 0
		options.y = options.y || 0
		options.width = options.width || @default_width
		options.height = options.height || @default_height
		options.backgroundColor = options.backgroundColor || @baseColor
		options.superLayer = options.superLayer || ""


		# this is the important thing in framer: Most of the times, your classes will extend Layer or other classes
		# so you need to make sure you're calling the Parent's class ( superClass constructor):
		super options

		# after the Layer is created, I can now use the Utils.Label to write the text to it
		# There's of course more elegants way of doing it without having to wait for it to be created
		window.Utils.labelLayer(@, @label)

		## styling the button, with a toolbar - like capability
		## this was created just to give it "toolbar feelings" so using left / right / middle
		# gives the button diff properties that make them fit together
		# you can extend it to have a options.baseStyle and apply that to the button
		# you can also create a class called ToolBar that uses Buttons and set itself together automatically!

		if @type is "left"
			@style =
				"border":"2px solid white"
				"border-top-left-radius":"20px"
				"border-bottom-left-radius":"20px"
				"fontSize":@textSize

		else if @type is "right"
			@style =
				"border":"2px solid white"
				"border-top-right-radius":"20px"
				"border-bottom-right-radius":"20px"
				"fontSize":@textSize

		else if @type is "middle"
			@style =
				"border":"2px solid white"
				"fontSize":@textSize

		else if @type is "single"
			@style =
				"border":"2px solid white"
				"border-top-left-radius":"20px"
				"border-bottom-left-radius":"20px"
				"border-top-right-radius":"20px"
				"border-bottom-right-radius":"20px"
				"fontSize":@textSize



		#basic events all buttons have
		@on Events.MouseOver, ->
			@style =
				backgroundColor:@hoverColor
				"border-color":"1px solid #ccc"


		@.on Events.Click, ->
			#simple bounce
			#call action for click

			@action()


		@.on Events.MouseOut, ->
			@style =
				backgroundColor:@baseColor

		#simple "reduce it" effect
		@.on Events.TouchStart, ->
			@scale = 0.95
			@style =
				backgroundColor:@clickColor

		@.on Events.TouchEnd, ->
			@scale = 1
			@style =
				backgroundColor:@baseColor

		#if states are used:
		@states.add
			hover:{}
			normal:{}
			pressed:{}

#–––––––– Place at top of file
{Button} = require "btnClassModule"

#–––––––– Class
button = new Button
	y:300, x: 16, label: "press"

	"""
