(function(){
    "use strict";

    function storesController($scope, $http, $location, currentUserServices,storesService,$routeParams){
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.stores);
        $scope.userData = currentUserServices.getProfile();
        $scope.savingStatus = constants.spinnerStatus.start;
        $scope.url = appConfig.url;
        $scope.company = [];
        $scope.store={};
        var id = $routeParams.id;

        storesService.getStores(id).then(
            function(data){
                $scope.company = data;
            },
            function(data){

            }
        );

        $scope.addStoreFromForm = function(){
            $("#addStoreForm").slideDown();
            $("#topMenu").slideUp();
        };

        $scope.closeAddStoreFromForm = function (formModel) {
            $("#addStoreForm").slideUp();
            $("#topMenu").slideDown();
            $scope.storeForm.$setPristine();
            $scope.store={};

        };

        $scope.saveStoreFromForm = function (formValid) {
            $scope.savingStatus = constants.spinnerStatus.saving;
            if(formValid){
                if ($scope.store.id === undefined) {
                    saveStore();
                } else {
                    $scope.updateCompany();
                }
            };
        };

        function saveStore () {
            $scope.store.company_id = $scope.company.id;
            storesService.saveStore($scope.store).then(
                function (data) {
                    $scope.company.stores.push(data);
                    $scope.savingStatus = constants.spinnerStatus.success;
                    $("#addStoreForm").slideUp();
                    $("#topMenu").slideDown();
                },
                function () {
                    $scope.savingStatus = constants.spinnerStatus.error;
                }
            );
        }


    }

    managernoControllers.controller('storesController',storesController)
})();