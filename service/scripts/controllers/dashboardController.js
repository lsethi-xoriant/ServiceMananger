(function () {
    "use strict";

    function dashboardController($scope, $http, $location, currentUserServices) {
        if (!currentUserServices.loggedIn())
            $location.path("/login");

        $scope.breadcrumb = constants.breadcrumb.dashboard;
    }

    managernoControllers.controller("dashboardController", dashboardController);
})();
