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
                var profile = JSON.parse(sessionStorage.getItem("profile"));

                if (typeof token === "undefined") return false;
                if (token === null) return false;
                if (token === "") return false;
                if (typeof profile === "undefined") return false;
                if (profile === null) return false;
                if (profile === "") return false;

                return true;
            },

            getLanguage: function () {
                var profile = JSON.parse(sessionStorage.getItem("profile"));
                var lang = appConfig.languageDefaul;

                if (typeof profile === "undefined") return lang;
                if (profile === null) return lang;
                if (profile === "") return lang;

                return profile.language;
            },

            getBreadcrumb: function (breadcrumbList) {
                var lang = this.getLanguage();
                for (var i = 0; i < breadcrumbList.length; i++) {
                    if (lang === breadcrumbList[i].lang) {
                        return breadcrumbList[i].value;
                    }
                }
                return breadcrumbList[0].value;
            }
        }
    }

    managernoServices.factory("currentUserServices", currentUserServices);
})();