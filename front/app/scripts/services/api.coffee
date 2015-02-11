angular.module('frontApp')
  .factory 'Api', ($http) ->
    host = 'http://127.0.0.1:3000'
    getIllustrators: (screen_name) -> $http.get "#{host}/twitter_accounts/#{screen_name}/illustrators.json"
