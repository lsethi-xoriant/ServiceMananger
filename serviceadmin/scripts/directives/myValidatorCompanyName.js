(function () {
    "use strict";

    function myValidatorCompanyName($http, $q) {
        return {
            restrict:'A',
            require:'ngModel',
            link: function(scope, element, attrs, ngModel) {
                ngModel.$asyncValidators.companyName = function(modelValue, viewValue) {
                    return $http.get(appConfig.urlValidator.companyName + viewValue).then(
                        function(response) {
                            if (response.data) {
                                return true;
                            }
                            return $q.reject(response.data);
                        }
                    );
                };
            }
        }
    }

    managernoServices.directive("myValidatorCompanyName", myValidatorCompanyName);
})();