const { request, settings } = require('pactum');
const { Before } = require('@cucumber/cucumber');

Before(() => {
  settings.setReporterAutoRun(false);
});