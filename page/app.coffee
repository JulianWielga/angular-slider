'use strict'

angular.module 'app', [
	# angular dependencies
	'ngCookies'
	'ngAnimate'
	'ngResource'
	'ngSanitize'
	'ngRoute'

	# angular external dependencies
	'angular-underscore'
	'ui.bootstrap'

	# app modules

	# jade / html templates and templates
	'app.templates'
]

.config [
	'$routeProvider'
	'$locationProvider'

	($routeProvider, $locationProvider) ->
		# Without server side support html5 must be disabled.
		$locationProvider.html5Mode false
]