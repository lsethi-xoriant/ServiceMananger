var constants = {};

constants.spinnerStatus = {
    start: 0,
    saving: 1,
    success: 2,
    error: 3,
    loading: 4
}

constants.breadcrumb = {};

constants.breadcrumb.dashboard = {
    subject: "Dashboard",
    message: "Welcome to Managerno",
    links: [{
        href: "#/",
        name: "Dashboard"
    }]
};

constants.breadcrumb.company = {
    subject: "Company",
    message: "Manage your company",
    links: [{
        href: "#/",
        name: "Dashboard"
    }, {
        href: "#/company",
        name: "Company"
    }]
};