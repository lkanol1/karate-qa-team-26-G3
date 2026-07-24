Feature: Pruebas  de depósito

  @deposit
  Scenario:  CP01-Agregar saldo a cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    And path "/api/deposits"
    And header Authorization = tokenUser
    And request
    """
    {
      "accountId": "#(idAccount)",
      "amount": 50,
      "depositType": "bank_transfer",
      "reference": "Salary deposit"
    }
    """
    When method post
    Then status 201