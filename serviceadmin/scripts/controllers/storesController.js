(function(){
    "use strict";

    function storesController($scope, $http, $location, currentUserServices,storesService){
        if (!currentUserServices.loggedIn()) {
            $location.path("/login");
            return;
        }

        $scope.breadcrumb = currentUserServices.getBreadcrumb(breadcrumbConst.stores);
        $scope.userData = currentUserServices.getProfile();
        $scope.stores = [];
        $scope.url = appConfig.url;

        storesService.getStores().then(
            function(data){
                $scope.stores = data;
            },
            function(data){}
        )
    }

    managernoControllers.controller('storesController',storesController)
})();