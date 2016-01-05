(function(){
    "use strict";

    function storesService($q, $http){
        return {
            getStores: function(){
                var deffered = $q.defer();
                $http.get(appConfig.baseUrlApi + 'stores')
                    .success(function(data, status, headers, config){
                        deffered.resolve(data)
                    })
                    .error(function(){
                        deffered.reject(data)
                    });
                return deffered.promise;
            }
        }

    }

    managernoServices.service('storesService',storesService);
})();