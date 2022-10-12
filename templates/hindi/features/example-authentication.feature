रूप लेख: प्रमाणीकरण चालू ADEQUATESHOP API

    प्रमाणीकरण उदाहरण के साथ एपीआई ऑटोमेशन

    परिदृश्य: पंजीकृत डेटा का उपयोग कर उपयोगकर्ता पंजीकरण
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/registration"
        और मैंने शरीर को पर सेट किया है
        """
        {
            "name": "PactumJS 01",
            "email": "pactumjs01@gmail.com",
            "password": 123456
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब मुझे उम्मीद है कि प्रतिक्रिया की स्थिति होनी चाहिए "200"
        और I expect response should have a json
        """
        {
            "code": 1,
            "message": "The email address you have entered is already registered",
            "data": null
        }
        """

    परिदृश्य: अमान्य डेटा का उपयोग कर उपयोगकर्ता पंजीकरण
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/registration"
        और मैंने शरीर को पर सेट किया है
        """
        {
            "name": "PactumJS XXX",
            "email": "pactumjsxxx",
            "password": 123456
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब मुझे उम्मीद है कि प्रतिक्रिया की स्थिति होनी चाहिए "400"
        और I expect response should have a json at "ModelState"
        """
        {
            "User.email": [
                "Enter valid email address"
            ]
        }
        """

    परिदृश्य: वैध डेटा का उपयोग करके उपयोगकर्ता लॉगिन
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/login"
        और मैंने शरीर को पर सेट किया है
        """
        {
            "email": "pactumjs001@gmail.com",
            "password": 123456
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब मुझे उम्मीद है कि प्रतिक्रिया की स्थिति होनी चाहिए "200"
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

    परिदृश्य: अमान्य डेटा का उपयोग करके उपयोगकर्ता लॉगिन
        अगर I make a "POST" request to "http://restapi.adequateshop.com/api/authaccount/login"
        और मैंने शरीर को पर सेट किया है
        """
        {
            "email": "invalidaccount@email.com",
            "password": 111222333
        }
        """
        जब मुझे एक प्रतिक्रिया मिलती है
        तब मुझे उम्मीद है कि प्रतिक्रिया की स्थिति होनी चाहिए "200"
        और I expect response should have a json
        """
        {
            "code": 1,
            "message": "invalid username or password",
            "data": null
        }
        """