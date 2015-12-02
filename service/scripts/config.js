var appConfig = {};

if (document.location.hostname === "service.dev") {
    appConfig.baseUrl = "http://serviceapi.dev/";
    appConfig.baseUrlApi = appConfig.baseUrl + "api/";
} else {
    appConfig.baseUrl = "http://managerno.com/";
    appConfig.baseUrlApi = appConfig.baseUrl + "api/";
}

appConfig.urlLogin = appConfig.baseUrlApi + "access";
appConfig.urlLogout = appConfig.baseUrlApi + "access/logout";
appConfig.urlNoImage = appConfig.baseUrl + "content/images/realestates/NoImage_a.jpg";

appConfig.languageDefaul = "en";
