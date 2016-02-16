var appConfig = {};

switch(document.location.hostname){
    case "serviceadmin.dev":
        appConfig.baseUrl = "http://serviceapi.dev/";
        break;
    case "managerno.com":
        appConfig.baseUrl = "http://managerno.com/";
        break;
    case "localhost":
        appConfig.baseUrl = "http://127.0.0.1:3000/";
        break;
}

appConfig.baseUrlApi = appConfig.baseUrl + "api/";

appConfig.urlLogin = appConfig.baseUrlApi + "access/";
appConfig.urlLogout = appConfig.baseUrlApi + "access/logout/";
appConfig.logoLink = appConfig.baseUrl + "folder/";
appConfig.urlNoImage = appConfig.baseUrl + "content/images/realestates/NoImage_a.jpg";

appConfig.url = {};
appConfig.url.companies = "/#/companies/";
appConfig.url.stores = "/stores/";

//Validator Url
appConfig.urlValidator = {};
appConfig.urlValidator.companyName = appConfig.baseUrlApi + "validation/company/name/";

appConfig.languageDefaul = "en";