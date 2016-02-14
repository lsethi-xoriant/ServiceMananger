﻿(function () {
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
        $scope.spinnerStatus = constants.spinnerStatus;
        $scope.savingCompanyStatus = $scope.spinnerStatus.start;


        companyService.getCompanies().then(
            function (data) {
                $scope.companies = data;
            },
            function () {

            });

        $scope.addCompanyFromForm = function () {
            $scope.resetAddCompanyForm();
            $("#addCompanyForm").slideDown();
            $("#topMenu").slideUp();
        };

        $scope.closeAddCompanyFromForm = function () {
            $("#addCompanyForm").slideUp();
            $("#topMenu").slideDown();
            $scope.resetAddCompanyForm();
        };

        $scope.saveCompanyFromForm = function (formValid) {
            if (formValid) {
                alert('our form is amazing');
            }

            if ($scope.company.id === undefined) {
                $scope.saveCompany();
            } else {
                $scope.updateCompany();
            }
        };

        $scope.saveCompany = function () {
            $scope.savingCompanyStatus = $scope.spinnerStatus.saving;
            companyService.saveCompany($scope.company).then(
                function () {
                    $scope.savingCompanyStatus = $scope.spinnerStatus.success;
                    setTimeout(function(){
                        $("#addCompanyForm").slideUp();
                        $("#topMenu").slideDown();
                        $scope.resetAddCompanyForm();
                    }, 1000)
                },
                function () {
                    $scope.savingCompanyStatus = $scope.spinnerStatus.error;
                });
        };

        $scope.updateCompany = function () {

        };

        $scope.resetAddCompanyForm = function () {
            $scope.company = {};
            $scope.company.logoImageLink = "";
            $("#companyLogoImagePreview").attr("src", "");
            $scope.savingCompanyStatus = $scope.spinnerStatus.start;
        };
    }

    managernoControllers.controller("companyController", companyController);
})();
