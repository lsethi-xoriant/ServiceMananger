(function () {
    "use strict";

    function logoutController($scope, $http, $location, currentUserServices, loginService) {
        loginService.logout();
        $location.path("/login");
    }

    managernoControllers.controller("logoutController", logoutController);
})();