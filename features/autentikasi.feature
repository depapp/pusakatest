Fitur: Autentikasi pada ADEQUATESHOP API

    Contoh Automation API untuk fitur Autentikasi

    Skenario: Registrasi Pengguna Baru Menggunakan Data Yang Sah (Valid)
        Diasumsikan I make a "POST" request to "/api/authaccount/registration"
        Dan I use random test data to create an account
        Ketika I receive a response
        Maka I expect response should have a status "200"
        Dan I expect response should have a json schema
        """
        {
            "type": "object",
            "properties": {
                "code": {
                    "type": "integer"
                },
                "message": {
                    "type": "string"
                },
                "data": {
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
            }
        }
        """

    Skenario: Registrasi Pengguna Baru Menggunakan Data Yang Sudah Ada
        Diasumsikan I make a "POST" request to "/api/authaccount/registration"
        Dan I set body to
        """
        {
            "name": "PactumJS 01",
            "email": "pactumjs01@gmail.com",
            "password": 123456
        }
        """
        Ketika I receive a response
        Maka I expect response should have a status "200"
        Dan I expect response should have a json
        """
        {
            "code": 1,
            "message": "The email address you have entered is already registered",
            "data": null
        }
        """

    Skenario: Registrasi Pengguna Baru Menggunakan Data Yang Tidak Sah (Invalid)
        Diasumsikan I make a "POST" request to "/api/authaccount/registration"
        Dan I set body to
        """
        {
            "name": "PactumJS XXX",
            "email": "pactumjsxxx",
            "password": 123456
        }
        """
        Ketika I receive a response
        Maka I expect response should have a status "400"
        Dan I expect response should have a json at "ModelState"
        """
        {
            "User.email": [
                "Enter valid email address"
            ]
        }
        """

    Skenario: Pengguna Melakukan Login dengan Data Yang Sah (Valid)
        Diasumsikan I make a "POST" request to "/api/authaccount/login"
        Dan I set body to
        """
        {
            "email": "pactumjs001@gmail.com",
            "password": 123456
        }
        """
        Ketika I receive a response
        Maka I expect response should have a status "200"
        Dan I expect response should have a json schema at "data"
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

    Skenario: Pengguna Melakukan Login dengan Data Yang Tidak Sah (Invalid)
        Diasumsikan I make a "POST" request to "/api/authaccount/login"
        Dan I set body to
        """
        {
            "email": "invalidaccount@email.com",
            "password": 111222333
        }
        """
        Ketika I receive a response
        Maka I expect response should have a status "200"
        Dan I expect response should have a json
        """
        {
            "code": 1,
            "message": "invalid username or password",
            "data": null
        }
        """
