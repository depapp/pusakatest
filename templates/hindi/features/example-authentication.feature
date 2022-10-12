रूप लेख: Authentication on ADEQUATESHOP API

    API Automation with Authentication example

    परिदृश्य: User Registration using Registered Data
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/registration"
        और I set body to
        """
        {
            "name": "PactumJS 01",
            "email": "pactumjs01@gmail.com",
            "password": 123456
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब I expect response should have a status "200"
        और I expect response should have a json
        """
        {
            "code": 1,
            "message": "The email address you have entered is already registered",
            "data": null
        }
        """

    परिदृश्य: User Registration using Invalid Data
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/registration"
        और I set body to
        """
        {
            "name": "PactumJS XXX",
            "email": "pactumjsxxx",
            "password": 123456
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब I expect response should have a status "400"
        और I expect response should have a json at "ModelState"
        """
        {
            "User.email": [
                "Enter valid email address"
            ]
        }
        """

    परिदृश्य: User Login using Valid Data
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/login"
        और I set body to
        """
        {
            "email": "pactumjs001@gmail.com",
            "password": 123456
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब I expect response should have a status "200"
        और I expect response should have a json schema at "data"
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

    परिदृश्य: User Login using Invalid Data
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/login"
        और I set body to
        """
        {
            "email": "invalidaccount@email.com",
            "password": 111222333
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब I expect response should have a status "200"
        और I expect response should have a json
        """
        {
            "code": 1,
            "message": "invalid username or password",
            "data": null
        }
        """