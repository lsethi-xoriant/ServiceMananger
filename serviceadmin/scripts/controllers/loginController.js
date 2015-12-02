(function () {
    "use strict";

    function loginController($scope, $http, $location, currentUserServices, loginService) {
        $scope.userData = {};
        $scope.userData.remember = false;
        $scope.constants = constants;
        $scope.loginStatus = constants.spinnerStatus.start;
        $scope.loginMessage = "";

        $scope.loginFromForm = function (formValid) {
            $scope.loginStatus = constants.spinnerStatus.saving;
            if (formValid) {
                loginService.login($scope.userData).then(
                    function (data) {
                        currentUserServices.setProfile(data, $scope.userData.remember);
                        $scope.loginStatus = constants.spinnerStatus.success;

                        if (localStorage.getItem("lastVisitedUrl") != null) {
                            $location.path(localStorage.getItem("lastVisitedUrl"));
                        } else {
                            $location.path("/");
                        }
                    },
                    function (status) {
                        $scope.loginStatus = constants.spinnerStatus.error;
                        $scope.loginMessage = status.message;
                    }
                );
            }
        }
    }

    managernoControllers.controller("loginController", loginController);
})();