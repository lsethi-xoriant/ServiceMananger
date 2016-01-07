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
        $scope.company = {};
        $scope.company.logoImageLink = "";
        $scope.company.name = "osman";

        companyService.getCompanies().then(
            function (data) {
                $scope.companies = data;
            },
            function () {

            });

        $scope.addCompanyFromForm = function () {
            $("#addCompanyForm").slideDown();
            $("#topMenu").slideUp();
        };

        $scope.closeAddCompanyFromForm = function () {
            $("#addCompanyForm").slideUp();
            $("#topMenu").slideDown();
        };

        $scope.saveCompanyFromForm = function (formValid) {
            if ($scope.company.id === undefined) {
                $scope.saveCompany();
            } else {
                $scope.updateCompany();
            }
        };

        $scope.saveCompany = function () {
            companyService.saveCompany($scope.company).then(
                function (data) {

                },
                function () {

                });
        };

        $scope.updateCompany = function () {

        };
    }

    managernoControllers.controller("companyController", companyController);
})();
