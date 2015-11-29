(function () {
    "use strict";

    function dashboardController($scope, $http, $location, currentUserServices) {
        if (!currentUserServices.loggedIn())
            $location.path("/login");
    }

    managernoControllers.controller("dashboardController", dashboardController);
})();
