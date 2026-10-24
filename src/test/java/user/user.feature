Feature: Ciclo de vida de un usuario en PetStore

  Background:
    * url 'https://petstore.swagger.io/v2'
    * configure retry = { count: 3, interval: 1000 }
    * def timestamp = java.lang.System.currentTimeMillis()
    * def username = 'alejandro_' + timestamp
    * def userBody =
    """
    {
      "id": 0,
      "username": "#(username)",
      "firstName": "Alejandro",
      "lastName": "Castro",
      "email": "alejandro@test.com",
      "password": "Test1234",
      "phone": "3000000000",
      "userStatus": 1
    }
    """

  Scenario: Crear, buscar, actualizar y eliminar usuario
    # 1) Crear usuario
    Given path 'user'
    And request userBody
    When method post
    Then status 200
    And match response.code == 200

    # 2) Buscar el usuario creado y guardar su id
    Given path 'user', username
    And retry until responseStatus == 200
    When method get
    Then status 200
    And match response.username == username
    And match response.email == 'alejandro@test.com'
    * def userId = response.id

    # 3) Actualizar nombre y correo 
    * set userBody.id = userId
    * set userBody.firstName = 'Jose Alejandro'
    * set userBody.email = 'nuevo@test.com'
    Given path 'user', username
    And request userBody
    When method put
    Then status 200

    # 4) Buscar el usuario actualizado
    Given path 'user', username
    And retry until response.email == 'nuevo@test.com'
    When method get
    Then status 200
    And match response.firstName == 'Jose Alejandro'
    And match response.email == 'nuevo@test.com'

    # 5) Eliminar usuario
    Given path 'user', username
    When method delete
    Then status 200

    # 6) Verificar que ya no existe
    Given path 'user', username
    When method get
    Then status 404