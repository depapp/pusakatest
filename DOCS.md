
## Dokumentasi

### Keywords

| English | Bahasa Indonesia |
| :----- | :----- |
| Feature | Fitur |
| Scenario | Skenario |
| Given | Dengan |
| And | Dan |
| When | Ketika |
| Then | Maka |

contoh:
```gherkin
Fitur: xxxxx

    Skenario: xxxxx
        Dengan xxxxx
        Dan xxxxx
        Ketika xxxxx
        Maka xxxxx
```

### HTTP methods

```gherkin
  Saya melakukan metode "x" request pada "xx"
```

| Parameter | Contoh Inputan     | Deskripsi                |
| :----- | :----- | :----- |
| `x` | `GET/POST/PUT/DEL` | **Wajib**. Metode Request yang akan dilakukan. |
| `xx` | `https://reqres.in/api/users` | **Wajib**. Endpoint yang akan kita hit

contoh:
```gherkin
  Saya melakukan metode "GET" request pada "https://reqres.in/api/users"
```