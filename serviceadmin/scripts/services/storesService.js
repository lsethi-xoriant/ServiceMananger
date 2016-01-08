(function(){
    "use strict";

    function storesService($q, $http){
        return {
            getStores: function(id){
                var deffered = $q.defer();
                $http.get(appConfig.baseUrlApi + 'companies/' + id )
                    .success(function(data, status, headers, config){
                        deffered.resolve(data)
                    })
                    .error(function(data){
                        deffered.reject(data)
                    });
                return deffered.promise;
            },
            saveStore: function(store){
                var deffered = $q.defer();
                $http.post(appConfig.baseUrlApi + 'stores',{store:store})
                    .success(function(data, status, headers, config){
                        deffered.resolve(data)
                    })
                    .error(function(data){
                        deffered.reject(data)
                    });
                return deffered.promise;
            }
        }

    }

    managernoServices.service('storesService',storesService);
})();