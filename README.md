
# pusakatest

[![pusakatest-ci](https://github.com/depapp/pusakatest/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/depapp/pusakatest/actions/workflows/ci.yml)

**pusakatest** merupakan sebuah alat untuk mempermudah otomatisasi pengujian pada [API](https://id.wikipedia.org/wiki/Antarmuka_pemrograman_aplikasi) dengan menggunakan [CucumberJS](https://github.com/cucumber/cucumber-js) dan [PactumJS](https://pactumjs.github.io/).

terinspirasi dari [pactum-cucumber-boilerplate](https://github.com/pactumjs/pactum-cucumber-boilerplate), **pusakatest** dibuat bertujuan untuk mempermudah orang-orang yang ingin mencoba mempelajari automation pada `API` dengan menggunakan gaya [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development) yang menggunakan Bahasa kebanggaan kita, **Bahasa Indonesia**.

contoh penggunaan:
```gherkin
Fitur: Autentikasi pada ADEQUATESHOP API

    Contoh Automation API untuk fitur Autentikasi

    Skenario: Pengguna Melakukan Login dengan Data Yang Tidak Sah (Invalid)
        Diasumsikan Saya melakukan metode "POST" request pada "http://restapi.adequateshop.com/api/authaccount/login"
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
```

nama **pusakatest (pusaka & test)** terinspirasi dari [pusakata](https://www.instagram.com/pusakata), seorang musisi Indonesia.

## cara penggunaan

- pastikan Anda sudah memiliki `nodejs` & `npm`. untuk mengecek apakah `nodejs` & `npm` sudah ter-install atau belum, bisa menggunakan `command` berikut ini:
```bash
node -v
```
```bash
npm -v
```
- setelah itu bisa lanjut melakukan `clone` pada repository ini dengan `command`
```bash
git clone https://github.com/depapp/pusakatest.git
```
- berpindah ke folder `pusakatest` 
```bash
cd pusakatest
```
- meng-install semua dependencies dengan `command` berikut
```bash
npm install
```
- setelah semua dependencies ter-install, bisa langsung menjalankan automation nya dengan cara
```bash
npm run test
```
- jika semuanya berjalan dengan benar, maka `terminal` atau `cmd` Anda akan mengeluarkan tampilan seperti berikut ini
```bash
> pusakapicu@1.0.0 test
> cucumber-js --config config/cucumber.json

5 scenarios (5 passed)
25 steps (25 passed)
0m02.506s (executing steps: 0m02.485s)
```