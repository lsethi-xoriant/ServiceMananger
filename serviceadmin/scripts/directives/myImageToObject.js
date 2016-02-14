(function () {
    "use strict";

    function myImageToObject() {
        return {
            restrict:'A',
            link: function (scope, element, attrs) {
                element.bind("change", function () {
                    scope.$apply(function () {
                        if (element[0].files) {
                            var currentObject = scope.$eval(attrs.currentObject);
                            var showImageInHtmlTagWithId = attrs.showImageIn;
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                document.getElementById(showImageInHtmlTagWithId).setAttribute("src", e.target.result);
                                currentObject.logoImageLink = e.target.result;
                            };

                            reader.readAsDataURL(element[0].files[0]);
                        }
                    });
                });
            }
        }
    }

    managernoServices.directive("myImageToObject", myImageToObject);
})();