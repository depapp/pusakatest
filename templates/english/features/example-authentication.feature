Feature: Authentication on ADEQUATESHOP API

    API Automation with Authentication example

    Scenario: User Registration using Registered Data
        Given I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/registration"
        And I set body to
        """
        {
            "name": "PactumJS 01",
            "email": "pactumjs01@gmail.com",
            "password": 123456
        }
        """
        When I receive a response
        Then I expect response should have a status "200"
        And I expect response should have a json
        """
        {
            "code": 1,
            "message": "The email address you have entered is already registered",
            "data": null
        }
        """

    Scenario: User Registration using Invalid Data
        Given I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/registration"
        And I set body to
        """
        {
            "name": "PactumJS XXX",
            "email": "pactumjsxxx",
            "password": 123456
        }
        """
        When I receive a response
        Then I expect response should have a status "400"
        And I expect response should have a json at "ModelState"
        """
        {
            "User.email": [
                "Enter valid email address"
            ]
        }
        """

    Scenario: User Login using Valid Data
        Given I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/login"
        And I set body to
        """
        {
            "email": "pactumjs001@gmail.com",
            "password": 123456
        }
        """
        When I receive a response
        Then I expect response should have a status "200"
        And I expect response should have a json schema at "data"
        """
        {
            "type": "object",
            "properties": {
                "Id": {
                    "type": "integer"
                },
                "Name": {
                    "type": "string"
                },
                "Email": {
                    "type": "string"
                },
                "Token": {
                    "type": "string"
                }
            }
        }
        """

    Scenario: User Login using Invalid Data
        Given I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/login"
        And I set body to
        """
        {
            "email": "invalidaccount@email.com",
            "password": 111222333
        }
        """
        When I receive a response
        Then I expect response should have a status "200"
        And I expect response should have a json
        """
        {
            "code": 1,
            "message": "invalid username or password",
            "data": null
        }
        """