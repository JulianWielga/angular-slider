exports.config =
# See docs at http://brunch.readthedocs.org/en/latest/config.html.
	conventions:
		assets: /^page[\/\\]assets/
		ignored: /^(bower_components[\/\\]bootstrap-less(-themes)?|page[\/\\]styles[\/\\]overrides|(.*?[\/\\])?[_]\w*)/
	modules:
		definition: false
		wrapper: false
	paths:
		public: ''
		watched: ['page', 'vendor']
	files:
		javascripts:
			joinTo:
				'js/app.js': /^page/
				'js/vendor.js': /^(bower_components|vendor)/
			order:
				before: [
					'bower_components/jquery/dist/jquery.js'
					'bower_components/underscore/underscore.js'
				]

		stylesheets:
			joinTo:
				'css/vendor.css': /^(vendor|bower_components)/
				'css/app.css': /^(page)/
			order:
				before: []
				after: []

		templates:
			joinTo:
				'js/templates.js': /^page.*[\/\\]templates[\/\\].*jade$/

	plugins:
		jadeNgtemplates:
			modules: [
				name: "app.templates"
				pattern: /^page.*[\/\\]templates[\/\\].*jade$/
				url: (path) ->
					path.replace /.*[\/\\](.*)\.jade$/, '/templates/$1.html'
			]
			jade:
				pretty: yes
				doctype: "xml"
				basedir: 'page'
			htmlmin: no

		jadePages:
			pattern: /^page[\/\\]index.jade$/
			destination: (path) ->
				path.replace /^page[\/\\](.*)\.jade$/, "$1.html"
			jade:
				pretty: yes
				doctype: "xml"
				basedir: 'page'
			htmlmin: no


	overrides:
		production:
			optimize: false #nie działa ta opcja na js - zawsze true
			sourceMaps: true


			files: # not merged with files
				javascripts:
					joinTo:
						'js/app.js': /^page/
						'js/vendor.js': /^(bower_components|vendor)/
						'js/config.js': /^conf[\/\\]prod/
					order:
						before: [
							'bower_components/jquery/dist/jquery.js'
							'bower_components/underscore/underscore.js'
						]

	server:
		port: 3334
		base: ''

# export server configuration to jade processor
process?.server = exports.config.server
