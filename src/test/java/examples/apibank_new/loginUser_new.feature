Feature: Inicio de sesion de usuario

  Scenario: CP01 -inicio de sesion exitoso
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/login"
    And request { "email": "pepito@bankapi.com", "password": "password123" }
    When method post
    Then status 200
    And match response.data.user contains { "email": "pepito@bankapi.com" }


  Scenario: CP02 - Credenciales invalidas
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/login"
    And request { "email": "pepito123@bankapi.com", "password": "wrongpassword" }
    When method post
    Then status 401
    And match response.error contains { "code":"INVALID_CREDENTIALS" }

  @token
  Scenario: CP03 - Capturando Token
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/login"
    And request { "email": "pepito@bankapi.com", "password": "password123" }
    When method post
    Then status 200
    And match response.data.user contains { "email": "pepito@bankapi.com" }
    * def token = response.data.accessToken
    * print token
