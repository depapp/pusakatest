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

Given(/^I make a "(.*)" request to "(.*)"$/, function (method, endpoint) {
  spec[method.toLowerCase()](endpoint)
})

Given(/^I set path param "(.*)" to "(.*)"$/, function (key, value) {
  spec.withPathParams(key, value)
})

Given(/^I set query param "(.*)" to "(.*)"$/, function (key, value) {
  spec.withQueryParams(key, value)
})

Given(/^I set basic authentication credentials "(.*)" and "(.*)"$/, function (username, password) {
  spec.withAuth(username, password)
})

Given(/^I set header "(.*)" to "(.*)"$/, function (key, value) {
  spec.withHeaders(key, value)
})

Given(/मैंने शरीर को पर सेट किया है/, function (body) {
  try {
    spec.withJson(JSON.parse(body))
  } catch(error) {
    spec.withBody(body)
  }
})

Given('मैं खाता बनाने के लिए यादृच्छिक परीक्षण डेटा का उपयोग करता हूं', function () {
  console.log(fakerData)
  spec.withJson(fakerData)
})

Given(/^मैं यहाँ पर फ़ाइल अपलोड करता हूँ "(.*)"$/, function (filePath) {
  spec.withFile(filePath)
})

Given(/^मैंने बहु-भाग प्रपत्र परम सेट किया है "(.*)" to "(.*)"$/, function (key, value) {
  spec.withMultiPartFormData(key, value)
})

When('मुझे एक प्रतिक्रिया मिलती है', async function () {
  await spec.toss()
})

Then('मुझे उम्मीद है कि प्रतिक्रिया की स्थिति होनी चाहिए "{int}"', function (code) {
  spec.response().should.have.status(code)
})

Then(/^I expect response header "(.*)" should be "(.*)"$/, function (key, value) {
  spec.response().should.have.header(key, value)
})

Then(/^I expect response header "(.*)" should have "(.*)"$/, function (key, value) {
  spec.response().should.have.headerContains(key, value)
})

Then(/^I expect response should have a json$/, function (json) {
  spec.response().should.have.json(JSON.parse(json))
})

Then(/^I expect response should have a json at "(.*)"$/, function (path, value) {
  spec.response().should.have.json(path, JSON.parse(value))
})

Then(/^I expect response should have a json like$/, function (json) {
  spec.response().should.have.jsonLike(JSON.parse(json))
})

Then(/^I expect response should have a json like at "(.*)"$/, function (path, value) {
  spec.response().should.have.jsonLike(path, JSON.parse(value))
})

Then(/^I expect response should have a json schema$/, function (json) {
  spec.response().should.have.jsonSchema(JSON.parse(json))
})

Then(/^I expect response should have a json schema at "(.*)"$/, function (path, value) {
  spec.response().should.have.jsonSchema(path, JSON.parse(value))
})

Then(/^I expect response should have a body$/, function (body) {
  spec.response().should.have.body(body)
})

Then('मुझे उम्मीद है कि प्रतिक्रिया होनी चाहिए "{string}"', function (handler) {
  spec.response().should.have._(handler)
})

Then(/^I store response at "(.*)" as "(.*)"$/, function (path, name) {
  spec.stores(name, path)
})

After(() => {
  spec.end()
})