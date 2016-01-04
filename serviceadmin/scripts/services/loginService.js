(function () {
    "use strict";

        function loginService($q, $http) {
            return {
                login: function (userData) {
                    var deffered = $q.defer();
                    $http.post(appConfig.urlLogin, userData)
                        .success(function (data, status, headers, config) {
                            deffered.resolve(data);
                            console.log("Login success!");
                        })
                     .error(function (data, status, headers, config) {
                         deffered.reject(data);
                         console.log("Unable to login!");
                     });
                    return deffered.promise;
                },

                logout: function () {
                    localStorage.removeItem("token");
                    localStorage.removeItem("profile");
                    sessionStorage.removeItem("token");
                    sessionStorage.removeItem("profile");

                    var deffered = $q.defer();
                    $http.delete(appConfig.urlLogout)
                        .success(function (data, status, headers, config) {
                            deffered.resolve(data);
                            console.log("Logout success!");
                        })
                     .error(function (data, status, headers, config) {
                         deffered.reject(status);
                         console.log("Unable to logout!");
                     });
                    return deffered.promise;
                },

                register: function (user1) {
                    var deffered = $q.defer();
                    $http.post(appConfig.baseUrlApi + "account/register", user1)
                        .success(function (data, status, headers, config) {
                            deffered.resolve(data);
                        })
                     .error(function (data, status, headers, config) {
                         deffered.reject(status);
                         console.log("Unable to register user!");
                     });
                    return deffered.promise;
                }
            }
        }

    managernoServices.service("loginService", loginService);
})();