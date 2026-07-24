Feature: Pruebas de el modulo de transferencia

  Background:
    * def apilogin = call read('../loginUser_new.feature@token')
    * def token = apilogin.token
    Given url "https://bankapi-n1t8.onrender.com"

  Scenario Outline: CP01-Transferencia exitosa
    Given path "/api/transfers"
    And header Authorization = 'Bearer ' + token
    And request
    """
    {
      "fromAccountId": "<fromAccountId>",
      "toAccountId": "<toAccountId>",
      "amount": "<amount>",
      "description": "<description>",
      "transferType": "<transferType>"
    }
    """
    When method post
    Then status 201

    Examples:
      | fromAccountId                          | toAccountId                            | amount | description    | transferType |
      | 0dfaa081-4b8d-4ebd-9e02-aab6fdc83a1b | 429cfe5d-3720-4b72-a24e-094a1df7161c | 100    | Test transfer | internal   |
