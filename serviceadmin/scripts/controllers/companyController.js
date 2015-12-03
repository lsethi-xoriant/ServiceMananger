(function () {
    "use strict";

    function companyController($scope, $http, $location, currentUserServices, companyService) {
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.company);
        $scope.userData = currentUserServices.getProfile();
        $scope.url = appConfig.url;
        $scope.companies = [];

        companyService.getCompanies().then(
            function (data) {
                $scope.companies = data;
            },
            function () {
            
            });
    }

    managernoControllers.controller("companyController", companyController);
})();
