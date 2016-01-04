(function () {
    "use strict";

    function myImageToObject() {
        return {
            link: function (scope, element, attrs, ngModel) {
                element.bind("change", function () {
                    scope.$apply(function () {
                        if (element[0].files) {
                            var currentObject = scope.$eval(attrs.currentObject);
                            //currentObject.logoImage = currentObject.name.replace(/\s/g, "") + "-" + attrs.currentObject + "Logo.jpg";
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                $('#my-image-to-object')
                                    .attr('src', e.target.result)
                                    .width(300);

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