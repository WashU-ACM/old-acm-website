# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Obfuscate address
window.acmAddr = ->
	username = "acm"
	hostname = "wustl.edu"
	addr = username + "\u0040" + hostname;
	atag = document.createElement "a"
	atag.setAttribute "href", "mailto\u003A" + addr
	atag.appendChild document.createTextNode addr
	return atag