'use strict';
angular.module('app', ['ngCookies', 'ngAnimate', 'ngResource', 'ngSanitize', 'ngRoute', 'angular-underscore', 'ui.bootstrap', 'app.templates']).config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    return $locationProvider.html5Mode(false);
  }
]);
;
//# sourceMappingURL=app.js.map