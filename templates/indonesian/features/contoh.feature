Fitur: DummyJSON API

    Otomasi API dengan DummyJSON API

    Skenario: Login pengguna menggunakan Kredensial yang Sah
        Ketika Saya melakukan metode "POST" request pada "https://dummyjson.com/auth/login"
        Dan Saya set data untuk body menggunakan
        """
        {
            "username": "emilys",
            "password": "emilyspass"
        }
        """
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
        Dan Saya mengharapkan response API nya berisi json
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

    Skenario: Login pengguna menggunakan Kredensial Tidak Sah
        Ketika Saya melakukan metode "POST" request pada "https://dummyjson.com/auth/login"
        Dan Saya set data untuk body menggunakan
        """
        {
            "username": "notfounduser",
            "password": "invalidpassword"
        }
        """
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "400"
        Dan Saya mengharapkan response API nya berisi json
        """
        {
            "message": "Invalid credentials"
        }
        """

    Skenario: Tambah Pengguna Baru menggunakan Data yang Sah
        Ketika Saya melakukan metode "POST" request pada "https://dummyjson.com/users/add"
        Dan Saya set data untuk body menggunakan
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
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "201"
        Dan Saya mencatat isi response body nya

    Skenario: Mendapatkan Data Pengguna Tunggal yang Sah
        Ketika Saya melakukan metode "GET" request pada "https://dummyjson.com/users/1"
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
        Dan Saya mencatat isi response body nya

    Skenario: Mendapatkan Data Pengguna Tunggal yang Tidak Sah
        Ketika Saya melakukan metode "GET" request pada "https://dummyjson.com/users/99999"
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "404"
        Dan Saya mengharapkan response API nya berisi json
        """
        {
            "message": "User with id '99999' not found"
        }
        """