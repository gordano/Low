angular.module("receta").directive "angularAutoFocusq", ->
  console.log("directive on")
  {
    restrict: 'A'
    scope:
      showApp: '@'
      ngxOnshow: '&'
    link: (scope, element, attrs) ->
      console.log("directive on")
      #element.focus()
      #return

  }

