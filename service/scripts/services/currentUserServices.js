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

            getLanguage: function () {
                var profile = JSON.parse(sessionStorage.getItem("profile"));
                return profile.language;
            },

            loggedIn: function () {
                localStorage.setItem("lastVisitedUrl", document.location.hash);

                var token = sessionStorage.getItem("token");
                var profile = JSON.parse(sessionStorage.getItem("profile"));
                
                if (typeof token === "undefined") return false;
                if (token === null) return false;
                if (token === "") return false;
                if (typeof profile === "undefined") return false;
                if (profile === null) return false;
                if (profile === "") return false;

                return true;
            }
        }
    }

    managernoServices.factory("currentUserServices", currentUserServices);
})();