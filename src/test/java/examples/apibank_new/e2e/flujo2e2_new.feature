Feature: Flujos e2e pruebas

  #Flujo e2e de transferencia de dinero entre cuentas
  #Paso 1: Iniciar sesión
  #Paso 2: Seleccionar cuenta
  #Paso 3: Verificar saldo SI saldo<10 : Agregar Saldo
  #Paso 4: Agregar cuenta destino manual
  #Paso 5: Ejecutar la transferencia -> configuracion de cuenta y monto

  Background:

  Background:
    * def apilogin = call read('../loginUser_new.feature@token')
    * def token = apilogin.token
    Given url "https://bankapi-n1t8.onrender.com"
    * def tokenAuth = 'Bearer ' + token

  Scenario: CPTR1 Flujo e2e transferencia exitosa
    * def apiAccount = call read('account_new.feature@account'){"tokenUser": #(tokenAuth)}
    * def fromAccount = apiAccount.accountId
    * def apiAccountbalance = call read('account_new.feature@balanceAccount'){"tokenUser": #(tokenAuth), "idAccount": #(fromAccount)}
    * def balanceAccount = apiAccountbalance.balance
    * if (balanceAccount < 3000) karate.call('deposit_new.feature@deposit', { "tokenUser": tokenAuth, "idAccount": fromAccount })
    * def toAccount = apiAccount.toAccountId
    * def apiTransfer = call read('transfer_new.feature@transfer'){"tokenUser": #(tokenAuth), "fromAccountId": #(fromAccount), "toAccountId": #(toAccount), "amount": 100, "description": "Test transfer", "transferType": "internal"}

