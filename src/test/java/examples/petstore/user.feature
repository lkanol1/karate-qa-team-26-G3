Feature: Casos de prueba de el modulo user

  Scenario: CP-01 creacion de usuario exitoso
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request
    """
    {
  "id": 0,
  "username": "JOSE",
  "firstName": "abc",
  "lastName": "perez",
  "email": "abc",
  "password": "11111",
  "phone": "21233333",
  "userStatus": 0
  }
    """
    When method post
    Then status 200