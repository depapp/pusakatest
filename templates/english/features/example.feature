Feature: DummyJSON API

    API Automation with DummyJSON API

    Scenario: User Login using Valid Credentials
        Given I make a "POST" request to "https://dummyjson.com/auth/login"
        And I set body to
        """
        {
            "username": "emilys",
            "password": "emilyspass"
        }
        """
        When I receive a response
        Then I expect response should have a status "200"
        And I expect response should contain a json
        """
        {
            "id": 1,
            "email": "emily.johnson@x.dummyjson.com",
            "username": "emilys",
            "firstName": "Emily",
            "lastName": "Johnson",
            "gender": "female"
        }
        """

    Scenario: User Login using Invalid Credentials
        Given I make a "POST" request to "https://dummyjson.com/auth/login"
        And I set body to
        """
        {
            "username": "notfounduser",
            "password": "invalidpassword"
        }
        """
        When I receive a response
        Then I expect response should have a status "400"
        And I expect response should have a json
        """
        {
            "message": "Invalid credentials"
        }
        """

    Scenario: Add New User using Valid Data
        Given I make a "POST" request to "https://dummyjson.com/users/add"
        And I set body to
        """
        {
            "firstName": "Ujang",
            "lastName": "Tea",
            "maidenName": "Jajang",
            "age": 17,
            "gender": "male",
            "email": "ujang.jajang@x.dummyjson.com",
            "phone": "+62 812-1234-1234",
            "username": "ujangjajang",
            "password": "123123123"
        }
        """
        When I receive a response
        Then I expect response should have a status "201"
        And I log the response body

    Scenario: Get Valid Single User Data
        Given I make a "GET" request to "https://dummyjson.com/users/1"
        When I receive a response
        Then I expect response should have a status "200"
        And I log the response body

    Scenario: Get Invalid Single User Data
        Given I make a "GET" request to "https://dummyjson.com/users/99999"
        When I receive a response
        Then I expect response should have a status "404"
        And I expect response should have a json
        """
        {
            "message": "User with id '99999' not found"
        }
        """