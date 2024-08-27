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

Given(/I set body to/, function (body) {
  try {
    spec.withJson(JSON.parse(body))
  } catch(error) {
    spec.withBody(body)
  }
})

Given('I use random test data to create an account', function () {
  console.log(fakerData)
  spec.withJson(fakerData)
})

Given(/^I upload file at "(.*)"$/, function (filePath) {
  spec.withFile(filePath)
})

Given(/^I set multi-part form param "(.*)" to "(.*)"$/, function (key, value) {
  spec.withMultiPartFormData(key, value)
})

When('I receive a response', async function () {
  await spec.toss()
})

Then('I expect response should have a status "{int}"', function (code) {
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

Then('I expect response should have "{string}"', function (handler) {
  spec.response().should.have._(handler)
})

Then(/^I store response at "(.*)" as "(.*)"$/, function (path, name) {
  spec.stores(name, path)
})

Then(/^I expect response should contain a json$/, function (json) {
  spec.response().should.have.jsonLike(JSON.parse(json))
})

Then('I log the response body', async function () {
  const response = await spec.toss().then((res) => res.json);
  console.log(response);
  this.attach(JSON.stringify(response, null, 2), 'application/json');
});

After(() => {
  spec.end()
})
