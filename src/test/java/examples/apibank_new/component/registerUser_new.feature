Feature: Casos de prueba de registro de usuario

  Scenario: CP01-Registro de usuario Exitoso
    * def data =
    """
    {
        "email": "pepito@bankapi.com",
         "password": "password123",
         "fullName": "Pepito QA"
    }
    """
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/register"
    And request data
    When method post
    Then status 201
    And match response.data.user contains { "fullname": "Pepito QA" }

  Scenario: CP02-Usuario existente
    * def data =
    """
    {
        "email": "pepito@bankapi.com",
         "password": "password123",
         "fullName": "Pepito QA"
    }
    """
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/register"
    And request data
    When method post
    Then status 409




