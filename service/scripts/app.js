"use strict";

var serMan = angular.module("serMan", [
    "ngRoute",
    "ui.bootstrap",
    "serManControllers",
    "serManServices",
    "serManDirectives",
    "serManFilters"
]);

var serManControllers = angular.module("serManControllers", []);
var serManServices = angular.module("serManServices", []);
var serManDirectives = angular.module("serManDirectives", []);
var serManFilters = angular.module("serManFilters", []);

serMan.config(function ($routeProvider, $httpProvider) {
    $routeProvider
        .when("/dashboard", {
            templateUrl: "views/dashboard.html",
            controller: "dashboardController"
        })
        .when("/login", {
            templateUrl: "views/login.html",
            controller: "loginController"
        })
        .when("/logout", {
            templateUrl: "views/admin/logout.html",
            controller: "LogoutController"
        })
        .when("/error", {
            templateUrl: "views/admin/error.html"
        })
        .otherwise({ redirectTo: "/dashboard" });

    $httpProvider.interceptors.push("httpInterceptor");
});

serMan.factory("httpInterceptor", ["$q", "$location", function ($q, $location) {
    return {
        'request': function (config) {
            if (config.url !== appConfig.baseUrlLogin) {
                config.headers["Authorization"] = "Bearer " + sessionStorage.getItem("Token");
            } else {
                config.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=UTF-8";
            }
            return config;
        },
        'requestError': function (rejection) {
        },
        'response': function (response) {
            if (response.status === 401) {
                console.log("Response 401");
            }
            return response || $q.when(response);
        },
        'responseError': function (rejection) {
            if (rejection.status === 401) {
                console.log("Response Error 401", rejection);
                $location.path("/login").search("returnTo", "/home");
            }
            return $q.reject(rejection);
        }
    }
}]);
