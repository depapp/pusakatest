Fitur: DummyJSON API

    Otomasi API karo DummyJSON API

    Skenario: Login pangguna nggunakake Kredensial sing Sah
        Nalika Kula nggawe panjalukan "POST" menyang "https://dummyjson.com/auth/login"
        Lan Kula nyetel body dadi
        """
        {
            "username": "emilys",
            "password": "emilyspass"
        }
        """
        Menawa Kula nampa response
        Njuk Kula ngarepake response kudu duwe status "200"
        Lan Kula ngarepake response kudu ngemot json
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

    Skenario: Login pangguna nggunakake Kredensial Ora Sah
        Nalika Kula nggawe panjalukan "POST" menyang "https://dummyjson.com/auth/login"
        Lan Kula nyetel body dadi
        """
        {
            "username": "notfounduser",
            "password": "invalidpassword"
        }
        """
        Menawa Kula nampa response
        Njuk Kula ngarepake response kudu duwe status "400"
        Lan Kula ngarepake response kudu duwe json
        """
        {
            "message": "Invalid credentials"
        }
        """

    Skenario: Tambah Panganggo Anyar nggunakake Data sing Sah
        Nalika Kula nggawe panjalukan "POST" menyang "https://dummyjson.com/users/add"
        Lan Kula nyetel body dadi
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
        Menawa Kula nampa response
        Njuk Kula ngarepake response kudu duwe status "201"
        Lan Kula cathet response body

    Skenario: Entuk Data Panganggo Tunggal sing Sah
        Nalika Kula nggawe panjalukan "GET" menyang "https://dummyjson.com/users/1"
        Menawa Kula nampa response
        Njuk Kula ngarepake response kudu duwe status "200"
        Lan Kula cathet response body

    Skenario: Entuk Data Panganggo Tunggal sing Ora Sah
        Nalika Kula nggawe panjalukan "GET" menyang "https://dummyjson.com/users/99999"
        Menawa Kula nampa response
        Njuk Kula ngarepake response kudu duwe status "404"
        Lan Kula ngarepake response kudu duwe json
        """
        {
            "message": "User with id '99999' not found"
        }
        """