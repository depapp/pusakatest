const pactum = require('pactum')
const { Given, When, Then, Before, After } = require('@cucumber/cucumber')
const { randomData } = require('./data')

let spec = pactum.spec()
let fakerData = {
  "name": randomData.name,
  "email": randomData.email,
  "password": randomData.password
}

Before(() => {
  spec = pactum.spec()
})

Given(/^Saya melakukan metode "(.*)" request pada "(.*)"$/, function (method, endpoint) {
  spec[method.toLowerCase()](endpoint)
})

Given(/Saya set data untuk body menggunakan/, function (body) {
  try {
    spec.withJson(JSON.parse(body))
  } catch(error) {
    spec.withBody(body)
  }
})

Given('Saya menggunakan data test acak', function () {
  console.log(fakerData)
  spec.withJson(fakerData)
})

When('Saya menerima sebuah response API', async function () {
  await spec.toss()
})

Then('Saya mengharapkan status code response API nya "{int}"', function (code) {
  spec.response().should.have.status(code)
})

Then(/^Saya mengharapkan response API nya memiliki schema json$/, function (json) {
  spec.response().should.have.jsonSchema(JSON.parse(json))
})

Then(/^Saya mengharapkan response API nya memiliki schema json pada "(.*)"$/, function (path, value) {
  spec.response().should.have.jsonSchema(path, JSON.parse(value))
})

Then(/^Saya mengharapkan response API nya memiliki json$/, function (json) {
  spec.response().should.have.json(JSON.parse(json))
})

Then(/^Saya mengharapkan response API nya memiliki json pada "(.*)"$/, function (path, value) {
  spec.response().should.have.json(path, JSON.parse(value))
})

After(() => {
  spec.end()
})