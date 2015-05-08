angular.module('app', ['ui.bootstrap','br.fullpage'])
.controller('Home', ['$scope','$http', function($scope, $http){
    $.material.init()

    $scope.model = {};
    $scope.model.schedules = [];
    $scope.model.employees = [];
    $scope.model.people = []
    $scope.model.reservations = [];

    $http.get('/employees').success(function(data){
        $scope.model.employees = data;
    });

    $http.get('/people').success(function(data){
        $scope.model.people = data;
    });

    $scope.model.getSchedules = function(employee){
        $http.get('/schedules/' + employee.id).success(function(data){
                $scope.model.schedules = data;
            });
    }

    $scope.model.getReservations = function(person){
        $http.get('/reservations/' + person.id).success(function(data){
                $scope.model.reservations = data;
            });
    }


    // start CALENDER
    $scope.today = function() {
        $scope.dt = new Date();
    };
    $scope.today();

    $scope.clear = function () {
        $scope.dt = null;
    };

    // Disable weekend selection
    $scope.disabled = function(date, mode) {
        return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
    };

    $scope.toggleMin = function() {
        $scope.minDate = $scope.minDate ? null : new Date();
    };
    $scope.toggleMin();

    $scope.open = function($event) {
        $event.preventDefault();
    $event.stopPropagation();

    $scope.opened = true;
    };

    $scope.dateOptions = {
        formatYear: 'yy',
        startingDay: 1
    };

    $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
    $scope.format = $scope.formats[0];
    // end CALANDER
}]);