(function () {
    "use strict";

    function dashboardController($scope, $http, $location, currentUserServices) {
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.dashboard);
        $scope.userData = currentUserServices.getProfile();
    }

    managernoControllers.controller("dashboardController", dashboardController);
})();
