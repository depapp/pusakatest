
# pusakatest

[![pusakatest-ci](https://github.com/depapp/pusakatest/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/depapp/pusakatest/actions/workflows/ci.yml)
![image](https://user-images.githubusercontent.com/6134774/180157241-726742b6-f3fa-44f0-ade1-88b27b4a02a8.png)
_**pusakatest**_ merupakan sebuah alat untuk mempermudah otomatisasi pengujian pada [API](https://id.wikipedia.org/wiki/Antarmuka_pemrograman_aplikasi) dengan menggunakan [CucumberJS](https://github.com/cucumber/cucumber-js) dan [PactumJS](https://pactumjs.github.io/).

terinspirasi dari [pactum-cucumber-boilerplate](https://github.com/pactumjs/pactum-cucumber-boilerplate), _**pusakatest**_ dibuat bertujuan untuk mempermudah orang-orang yang ingin mencoba mempelajari automation pada `API` dengan menggunakan gaya [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development) yang menggunakan Bahasa kebanggaan kita, **Bahasa Indonesia**.

contoh penggunaan:
```gherkin
Fitur: Autentikasi pada ADEQUATESHOP API

    Contoh Automation API untuk fitur Autentikasi

    Skenario: Pengguna Melakukan Login dengan Data Yang Tidak Sah (Invalid)
        Dengan Saya melakukan metode "POST" request pada "http://restapi.adequateshop.com/api/authaccount/login"
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

nama _**pusakatest (pusaka & test)**_ terinspirasi dari [pusakata](https://www.instagram.com/pusakata), seorang musisi Indonesia.

## :gear: cara penggunaan

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

## :bulb: cara penulisan skrip

untuk menambahkan `test-case` pada proyek ini, bisa dengan cara membuat file baru pada folder `/features` dengan format `nama_file.feature`

setelah itu, kita bisa menuliskan dengan format

```gherkin
Fitur: API REQRES.IN

    Skenario: Menampilkan daftar user pada API REQRES.IN
        Dengan Saya melakukan metode "GET" request pada "https://reqres.in/api/users"
        Ketika Saya menerima sebuah response API
        Maka Saya mengharapkan status code response API nya "200"
```
untuk mengetahui daftar syntax yang bisa digunakan, bisa dilihat di [DOCS.md](https://github.com/depapp/pusakatest/blob/main/DOCS.md)

## :books: test report

proyek ini dilengkapi dengan `test report` yang berbentuk `.html`. ketika program dijalankan, maka akan otomatis melakukan generate `test report`.

selain itu juga, `test report` dapat langsung otomatis ter-publish di web [Cucumber Reports](https://reports.cucumber.io) dengan menggunakan `command`
```bash
npm run test-publish
```
hasil dari command di atas akan menampilkan link untuk `test report` nya
```bash
┌──────────────────────────────────────────────────────────────────────────┐
│ View your Cucumber Report at:                                            │
│ https://reports.cucumber.io/reports/a8c9eab0-d818-4143-941f-da6fb74fdae8 │
│                                                                          │
│ This report will self-destruct in 24h.                                   │
│ Keep reports forever: https://reports.cucumber.io/profile                │
└──────────────────────────────────────────────────────────────────────────┘
```
![image](https://user-images.githubusercontent.com/6134774/180352363-27a1e2e8-bb6f-474a-9e6b-5363a3c5dcda.png)
