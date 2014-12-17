'use strict'

angular.module 'app.main', []

.controller 'MainCtrl', [
	'$scope'
	class MainCtrl
		constructor: (@scope) ->
			@scopes = []
			@value = 5
			@values =
				low: 5
				high: 7

		scale: (value) -> Math.pow value, 3

		inverseScale: (value) ->
			sign = if value is 0 then 1 else (value / Math.abs(value))
			sign * Math.pow(Math.abs(value), 1 / 3)

		addScope: =>
			@scopes.push
				values:
					low : 4
					high: 7
				value : 5

		translate: (value) -> "$#{value}"

		translateCombined: (low, high) =>
			@translate(low.toFixed(@precision)) + " *** " + @translate(high.toFixed(@precision))

		translateRange: (low, high) =>
			@translate (high - low).toFixed(@precision)

		fireResizeEvent: =>
			@scope.$broadcast 'refreshSlider'
]
