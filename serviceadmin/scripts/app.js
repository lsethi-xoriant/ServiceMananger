"use strict";

var Managerno = angular.module("Managerno", [
    "ngRoute",
    "pascalprecht.translate",
    "ui.bootstrap",
    "managernoControllers",
    "managernoServices",
    "managernoDirectives",
    "managernoFilters"
]);

var managernoControllers = angular.module("managernoControllers", []);
var managernoServices = angular.module("managernoServices", []);
var managernoDirectives = angular.module("managernoDirectives", []);
var managernoFilters = angular.module("managernoFilters", []);

Managerno.config(function ($routeProvider, $httpProvider, $translateProvider) {
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
            templateUrl: "views/logout.html",
            controller: "logoutController"
        })
        .when("/error", {
            templateUrl: "views/admin/error.html"
        })
        .otherwise({ redirectTo: "/dashboard" });

    $httpProvider.interceptors.push("httpInterceptor");

    $translateProvider
        .translations("en", langEn)
        .translations("bs", langBs);
    //.translations("de", langDe);

    $translateProvider.determinePreferredLanguage(function () {
        var savedProfile = JSON.parse(sessionStorage.getItem("profile"));

        if (savedProfile == undefined)
            savedProfile = JSON.parse(localStorage.getItem("profile"));

        if (savedProfile == undefined || savedProfile.language == undefined)
            savedProfile = { language: "en" }

        return savedProfile.language;
    });

});

Managerno.factory("httpInterceptor", ["$q", "$location", function ($q, $location) {
    return {
        'request': function (config) {
            config.headers["Accept"] = "application/json";
            config.headers["Authorization"] = "";
            if (sessionStorage.getItem("token") != null) {
                config.headers["Authorization"] = "Token token=" + sessionStorage.getItem("token");
            } else {
                if (localStorage.getItem("token") != null) {
                    sessionStorage.setItem("token", localStorage.getItem("token"));
                    config.headers["Authorization"] = "Token token=" + sessionStorage.getItem("token");
                }
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
            if (rejection.status === 401 && rejection.config.url !== appConfig.urlLogin) {
                $location.path("/login");
            }
            return $q.reject(rejection);
        }
    }
}]);
