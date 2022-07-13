const { request, settings } = require('pactum')
const { Before } = require('@cucumber/cucumber')

Before(() => {
  request.setBaseUrl('http://restapi.adequateshop.com')
  settings.setReporterAutoRun(false)
})
