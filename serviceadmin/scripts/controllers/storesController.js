(function(){
    "use strict";

    function storesController($scope, $http, $location, currentUserServices,storesService,$routeParams){
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.stores);
        $scope.userData = currentUserServices.getProfile();
        $scope.company = [];
        $scope.url = appConfig.url;
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

        $scope.closeAddStoreFromForm = function () {
            $("#addStoreForm").slideUp();
            $("#topMenu").slideDown();
        };
    }

    managernoControllers.controller('storesController',storesController)
})();