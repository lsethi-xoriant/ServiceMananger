var appConfig = {};

if (document.location.hostname === "localhost") {
    appConfig.baseUrl = "http://localhost:23593/";
    appConfig.baseUrlApi = appConfig.baseUrl + "api/";
} else {
    appConfig.baseUrl = "http://managerno.com/";
    appConfig.baseUrlApi = appConfig.baseUrl + "api/";
}

appConfig.baseUrlLogin = appConfig.baseUrl + "Token";
appConfig.imagesRealEstates = appConfig.baseUrl + "content/images/realestates/";
appConfig.imagesTourism = appConfig.baseUrl + "content/images/tourism/";
appConfig.noImage = appConfig.baseUrl + "content/images/realestates/NoImage_a.jpg";
appConfig.defaultAdminPage = "/adminrealestates";
