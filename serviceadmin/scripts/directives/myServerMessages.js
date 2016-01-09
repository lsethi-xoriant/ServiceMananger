(function(){
    function myServerMessages(){
        return {
            restrict:'A',
            require: '?ngModel',
            link:function(scope, element, attrs, ctrl){
                element.bind('change',function(){
                    scope.$apply(function(){
                        ctrl.$setValidity('server', true);
                    })
                })
            }

        }
    }

    managernoServices.directive("myServerMessages", myServerMessages);
}());