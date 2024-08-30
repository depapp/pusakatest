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

Given(/^Kula nggawe panjalukan "(.*)" menyang "(.*)"$/, function (method, endpoint) {
  spec[method.toLowerCase()](endpoint)
})

Given(/^Kula nyetel path param "(.*)" dadi "(.*)"$/, function (key, value) {
  spec.withPathParams(key, value)
})

Given(/^Kula nyetel query param "(.*)" dadi "(.*)"$/, function (key, value) {
  spec.withQueryParams(key, value)
})

Given(/^Kula nyetel kredensial otentikasi dhasar "(.*)" lan "(.*)"$/, function (username, password) {
  spec.withAuth(username, password)
})

Given(/^Kula nyetel header "(.*)" dadi "(.*)"$/, function (key, value) {
  spec.withHeaders(key, value)
})

Given(/Kula nyetel body dadi/, function (body) {
  try {
    spec.withJson(JSON.parse(body))
  } catch(error) {
    spec.withBody(body)
  }
})

Given('Kula nggunakake data tes acak kanggo nggawe Kulan', function () {
  console.log(fakerData)
  spec.withJson(fakerData)
})

Given(/^Kula ngunggah file ing "(.*)"$/, function (filePath) {
  spec.withFile(filePath)
})

Given(/^Kula nyetel param formulir multi-bagian "(.*)" dadi "(.*)"$/, function (key, value) {
  spec.withMultiPartFormData(key, value)
})

When('Kula nampa response', async function () {
  await spec.toss()
})

Then('Kula ngarepake response kudu duwe status "{int}"', function (code) {
  spec.response().should.have.status(code)
})

Then(/^Kula ngarepake header response "(.*)" kudu "(.*)"$/, function (key, value) {
  spec.response().should.have.header(key, value)
})

Then(/^Kula ngarepake header response "(.*)" kudu duwe "(.*)"$/, function (key, value) {
  spec.response().should.have.headerContains(key, value)
})

Then(/^Kula ngarepake response kudu duwe json$/, function (json) {
  spec.response().should.have.json(JSON.parse(json))
})

Then(/^Kula ngarepake response kudu duwe json ing "(.*)"$/, function (path, value) {
  spec.response().should.have.json(path, JSON.parse(value))
})

Then(/^Kula ngarepake response kudu duwe json kaya$/, function (json) {
  spec.response().should.have.jsonLike(JSON.parse(json))
})

Then(/^Kula ngarepake response kudu duwe json kaya ing "(.*)"$/, function (path, value) {
  spec.response().should.have.jsonLike(path, JSON.parse(value))
})

Then(/^Kula ngarepake response kudu duwe skema json$/, function (json) {
  spec.response().should.have.jsonSchema(JSON.parse(json))
})

Then(/^Kula ngarepake response kudu duwe skema json ing "(.*)"$/, function (path, value) {
  spec.response().should.have.jsonSchema(path, JSON.parse(value))
})

Then(/^Kula ngarepake response kudu duwe body$/, function (body) {
  spec.response().should.have.body(body)
})

Then('Kula ngarepake response kudu duwe "{string}"', function (handler) {
  spec.response().should.have._(handler)
})

Then(/^Kula nyimpen response ing "(.*)" minangka "(.*)"$/, function (path, name) {
  spec.stores(name, path)
})

Then(/^Kula ngarepake response kudu ngemot json$/, function (json) {
  spec.response().should.have.jsonLike(JSON.parse(json))
})

Then('Kula cathet response body', async function () {
  const response = await spec.toss().then((res) => res.json);
  this.attach(JSON.stringify(response, null, 2), 'application/json');
});

After(() => {
  spec.end()
})
