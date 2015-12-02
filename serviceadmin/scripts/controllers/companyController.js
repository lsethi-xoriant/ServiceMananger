(function () {
    "use strict";

    function companyController($scope, $http, $location, currentUserServices) {
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.company);
        $scope.userData = currentUserServices.getProfile();
    }

    managernoControllers.controller("companyController", companyController);
})();
