Feature: Gestión de cuentas bancarias

  Background:
    * def apilogin = call read('../loginUser_new.feature@token')
    * def token = apilogin.token
    Given url "https://bankapi-n1t8.onrender.com"


  Scenario: CP01-Listar cuentas OK
    Given header Authorization = 'Bearer ' + token
    And path "/api/accounts"
    When method get
    Then status 200

