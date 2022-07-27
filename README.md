
# pusakatest

[![asciicast](https://asciinema.org/a/511165.svg)](https://asciinema.org/a/511165)

## :gear: setup
- make sure `nodejs` and `npm` is already installed. you can verify it using these commands
```bash
node -v
```
```bash
npm -v
```
- you can create new folder/directory to setup `pusakatest` and don't forget to change the folder/directory location. for example
```bash
mkdir hello-pusakatest && cd hello-pusakatest
```
- to setup `pusakatest`, you can simply run this command (and follow the instructions)
```bash
npx pusakatest
```
- nothing else after that, just run it!
```bash
npm run test
```
- if you want to publish the file report to [Cucumber Reports](https://reports.cucumber.io), just use
```bash
npm run test-publish
```

## :bulb: writing feature script
- to create new feature script, just add `.feature` file under `/features` folder/directory
- after that, just re-run it
```bash
npm run test
```
- example:
```gherkin
Feature: API REQRES.IN

    Scenario: Get all users list on REQRES.IN API
        Given I make a "POST" request to "https://reqres.in/api/users"
        When I receive a response
        Then I expect response should have a status "200"
```

## :bookmark: credits
- [pactum-cucumber-boilerplate](https://github.com/pactumjs/pactum-cucumber-boilerplate)
- [Dominik Kundel](https://www.twilio.com/blog/how-to-build-a-cli-with-node-js)
- [old-README](https://github.com/depapp/pusakatest/tree/0af4d1c0a0ce712fd2380f8de50b1562134468e4#readme)