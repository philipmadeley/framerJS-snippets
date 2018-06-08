plugin.run = (contents, options) ->
	"""
#{contents}

setTime = () ->
	date = new Date
	minute = date.getMinutes()
	hour = date.getHours()
	day = date.getDate()
	month = date.getMonth()

	days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
	dayName = days[date.getDay()]

	months = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"]
	monthName = months[date.getMonth()]

	if hour < 10
		hour = '0' + hour

	if minute < 10
		minute = '0' + minute

	homeTime.text = "#{hour}:#{minute}"
	homeDate.text = "#{dayName}, #{day} #{monthName}"

	Utils.delay 30, ->
		setTime()

setTime()

	"""
