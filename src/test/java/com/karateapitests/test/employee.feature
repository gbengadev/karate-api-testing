Feature: Test employee API

  Background:
    * url 'https://dummy.restapiexample.com/api/v1'


  Scenario: Get all employee data
    Given path '/employees'
    When method GET
    Then status 200


  Scenario: Create new record in database
    * def faker = Java.type("com.karateapitests.util.UtilMethods")
    * def name = faker.generateFullName()
    * def age = faker.generateAge()
    * def salary = faker.generateSalary()
    Given path '/create'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request {name: '#(name)',salary: '#(salary)',age: '#(age)'}
    When method POST
    Then status 200
    And match $ contains {name:"1234",salary: '#(salary)',age: '#(age)', id:'#notnull'}
    And def id=response.data.id



  Scenario: Get a single employee data
    * call read('employee.feature')
    Given path '/employee', id
    When method GET
    Then status 200

  Scenario: Update an employee record
    * call read('employee.feature')
    Given path '/update',id
    And request {name: 'John Keith',salary: '2000',age: '30'}
    When method PUT
    Then status 200
    And match $ contains {name:'John Keith',salary: '2000',age: '30', message:'#notnull'}


  Scenario: Delete an employee record
    * call read('employee.feature')
    Given path '/delete', id
    When method DELETE
    Then status 200
    And match $ contains {data:'#notnull',status: '#notnull', message: '#notnull'}




