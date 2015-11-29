(function () {
    "use strict";

    function currentUserServices() {
        return {
            setProfile: function (user, remember) {
                if (remember) {
                    localStorage.setItem("token", user.auth_token);
                    localStorage.setItem("profile", JSON.stringify(user));
                }

                sessionStorage.setItem("token", user.auth_token);
                sessionStorage.setItem("profile", JSON.stringify(user));
            },

            getProfile: function () {
                var profile = JSON.parse(sessionStorage.getItem("profile"));
                return profile;
            },

            loggedIn: function () {
                localStorage.setItem("lastVisitedUrl", document.location.hash);

                var token = sessionStorage.getItem("token");
                var profile = null;

                if (sessionStorage.getItem("token") == null) {
                    profile = JSON.parse(localStorage.getItem("profile"));
                } else {
                    profile = JSON.parse(sessionStorage.getItem("profile"));
                }

                if (token != null) {
                    if (typeof profile === "undefined") return false;
                    if (profile === null) return false;
                    if (profile === "") return false;
                    return true;
                } else {
                    return false;
                }
            }
        }
    }

    managernoServices.factory("currentUserServices", currentUserServices);
})();