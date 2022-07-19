Fitur: Autentikasi pada ADEQUATESHOP API

    Contoh Automation API untuk fitur Autentikasi

    Skenario: Registrasi Pengguna Baru Menggunakan Data Yang Sah (Valid)
        Diasumsikan Saya melakukan metode "POST" request pada "/api/authaccount/registration"
        Dan Saya menggunakan data test acak
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
        Dan Saya mengharapkan response API nya memiliki schema json
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
        Diasumsikan Saya melakukan metode "POST" request pada "/api/authaccount/registration"
        Dan Saya set data untuk body menggunakan
        """
        {
            "name": "PactumJS 01",
            "email": "pactumjs01@gmail.com",
            "password": 123456
        }
        """
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
        Dan Saya mengharapkan response API nya memiliki json
        """
        {
            "code": 1,
            "message": "The email address you have entered is already registered",
            "data": null
        }
        """

    Skenario: Registrasi Pengguna Baru Menggunakan Data Yang Tidak Sah (Invalid)
        Diasumsikan Saya melakukan metode "POST" request pada "/api/authaccount/registration"
        Dan Saya set data untuk body menggunakan
        """
        {
            "name": "PactumJS XXX",
            "email": "pactumjsxxx",
            "password": 123456
        }
        """
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "400"
        Dan Saya mengharapkan response API nya memiliki json pada "ModelState"
        """
        {
            "User.email": [
                "Enter valid email address"
            ]
        }
        """

    Skenario: Pengguna Melakukan Login dengan Data Yang Sah (Valid)
        Diasumsikan Saya melakukan metode "POST" request pada "/api/authaccount/login"
        Dan Saya set data untuk body menggunakan
        """
        {
            "email": "pactumjs001@gmail.com",
            "password": 123456
        }
        """
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
        Dan Saya mengharapkan response API nya memiliki schema json pada "data"
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
        Diasumsikan Saya melakukan metode "POST" request pada "/api/authaccount/login"
        Dan Saya set data untuk body menggunakan
        """
        {
            "email": "invalidaccount@email.com",
            "password": 111222333
        }
        """
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
        Dan Saya mengharapkan response API nya memiliki json
        """
        {
            "code": 1,
            "message": "invalid username or password",
            "data": null
        }
        """
