(function () {
    "use strict";

    function companyService($q, $http) {
        return {
            getCompanies: function () {
                var deffered = $q.defer();
                $http.get(appConfig.baseUrlApi + "companies")
                    .success(function (data, status, headers, config) {
                        deffered.resolve(data);
                    })
                    .error(function (data, status, headers, config) {
                        deffered.reject(data);
                    });
                return deffered.promise;
            },
            saveCompany: function (company) {
                var deffered = $q.defer();
                $http.post(appConfig.baseUrlApi + "companies", company)
                    .success(function (data, status, headers, config) {
                        deffered.resolve(data);
                    })
                    .error(function (data, status, headers, config) {
                        deffered.reject(data);
                    });
                return deffered.promise;
            }
        }
    }

    managernoServices.service("companyService", companyService);
})();