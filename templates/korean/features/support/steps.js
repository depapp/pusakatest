const pactum = require('pactum')
const { Given, When, Then, Before, After } = require('@cucumber/cucumber')

let spec = pactum.spec()

Before(() => {
  spec = pactum.spec()
})

Given(/^나는 만든다 "(.*)" 요청하다 "(.*)"$/, function (method, endpoint) {
  spec[method.toLowerCase()](endpoint)
})

When('나는 응답을 받는다', async function () {
  await spec.toss()
})

Then('응답에 상태가 있어야 합니다. "{int}"', function (code) {
  spec.response().should.have.status(code)
})

After(() => {
  spec.end()
})
