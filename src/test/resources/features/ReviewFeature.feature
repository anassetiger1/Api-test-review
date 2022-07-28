@EndToEnd
Feature: EndToEnd

  Scenario: Review feature
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    And header Authorization = "Bearer " + generatedToken
    * def generator = Java.type('tigers.api.review.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getfirstName()
    * def lastName = generator.getlastName()
    * def dob = generator.getDob()
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
      "email": "#(email)",
      "title": "Mr.",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "gender": "MALE",
      "martialStatus": "MARRIED",
      "employmentStatus": "student",
      "dateOfBirth": "#(dob)"
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then print response
    Then status 201
    * def generator = Java.type('tigers.api.review.DataGenerator')
    * def addressType  = generator.addressType ()
    * def addressCity  = generator.getCity()
    * def addressCountryCode = generator.getCountryCode()
    * def addressZipCode = generator.getZip()
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      
      "addressType": "addressType",
      "addressLine1": "12th st",
      "city": "addressCity",
      "state": "Virginia",
      "postalCode": "12345",
      "countryCode": "addressCountryCode",
      "current": true
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = response.id
    And request {"make": "Toyota","model": "Camry","year": "2022","licensePlate": "wrt1234"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    * def generator = Java.type('tigers.api.review.DataGenerator')
    * def phoneNumber = generator.getphoneNumber()
    * def phoneExtention = generator.phoneExtension()
    And path "/api/accounts/add-account-phone"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      
      {
      
      
      
      "phoneNumber": "phoneNumber",
      
      "phoneExtension": "phoneExtention",
      
      "phoneTime": "Morning",
      
      "phoneType": "Home"
      
      }

      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
