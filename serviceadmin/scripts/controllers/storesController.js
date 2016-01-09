(function(){
    "use strict";

    function storesController($scope,$location,currentUserServices,storesService,$routeParams){
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.stores);
        $scope.userData = currentUserServices.getProfile();
        $scope.savingStatus = constants.spinnerStatus.start;
        $scope.url = appConfig.url;
        $scope.company = [];
        $scope.store = {};
        $scope.serverErrors = {};


        storesService.getStores($routeParams.id).then(
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

        $scope.closeAddStoreFromForm = function () {
            $("#addStoreForm").slideUp();
            $("#topMenu").slideDown();
            $scope.storeForm.$setPristine();
            $scope.store={};
        };

        $scope.saveStoreFromForm = function (formValid) {
            $scope.savingStatus = constants.spinnerStatus.saving;
            if(formValid){
                saveStore();
            }
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
                function (reason) {
                    angular.forEach(reason,function(errors, field){
                        $scope.storeForm[field].$setValidity('server', false);
                        $scope.serverErrors[field] = errors.join(', ');
                    });
                    $scope.savingStatus = constants.spinnerStatus.error;
                }
            );
        }


    }

    managernoControllers.controller('storesController',storesController)
})();