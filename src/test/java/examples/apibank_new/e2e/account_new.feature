Feature: Gestión de cuentas bancarias

  @account
  Scenario: CP01-Listar cuentas OK
    Given url "https://bankapi-n1t8.onrender.com"
    Given header Authorization = tokenUser
    And path "/api/accounts"
    When method get
    Then status 200
    #de aqui sale la cuenta la cual va transferir y debitar
    * def accountId = response.data[0].id
    * def toAccountId = response.data[1].id


  @balanceAccount
  Scenario: CP02-Obtener saldo de cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    Given header Authorization = tokenUser
    And path "/api/accounts/" + idAccount + "/balance"
    When method get
    Then status 200
    * def balance = response.data.balance

