Feature: Pruebas de el modulo de transferencia

  @transfer
  Scenario: CP01-Transferencia exitosa
    Given url "https://bankapi-n1t8.onrender.com"
    And path "/api/transfers"
    And header Authorization = 'Bearer ' + token
    And request
    """
    {
      "fromAccountId": "#(fromAccountId)",
      "toAccountId": "#(toAccountId)",
      "amount": "#(amount)",
      "description": "Test transfer",
      "transferType": "internal"
    }
    """
    When method post
    Then status 201
