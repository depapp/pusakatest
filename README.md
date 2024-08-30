
# pusakatest

[comment]: [![asciicast](https://asciinema.org/a/511165.svg)](https://asciinema.org/a/511165)

| ![pusakatest-1](https://github.com/user-attachments/assets/11d8c57b-a0b7-434d-86b1-16bbc4b19199) | ![pusakatest-2](https://github.com/user-attachments/assets/d8d4ddaa-f41d-46ab-8583-4a43e3a0d433) |
| --- | --- |

## :construction_worker: status
[![pusakatest-ci](https://github.com/depapp/pusakatest/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/depapp/pusakatest/actions/workflows/ci.yml)

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
  - If you don't have a package.json in your file directory, it will be copied from one of the templates available at [pusakatest](https://github.com/depapp/pusakatest/blob/644409e90fe29f9cdab3b0da3ab9bf497150da79/templates/english/package.json#L20) when you run below command
  - If you already have a package.json file, add all the dependencies mentioned in [pusakatest](https://github.com/depapp/pusakatest/blob/644409e90fe29f9cdab3b0da3ab9bf497150da79/templates/english/package.json#L20) to your package.json (below command will not override or replace your package.json file)
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

## :fire: contributors
<a href="https://github.com/depapp/pusakatest/graphs/contributors"><img src="https://contrib.rocks/image?repo=depapp/pusakatest" alt="All of amazing contributors"></a>

## :muscle: support me
<div align="center">
  
| <a href="https://www.nihbuatjajan.com/depapp" target="_blank"><img src="https://d4xyvrfd64gfm.cloudfront.net/buttons/default-cta.png" alt="Nih buat jajan" style="height: 51px !important;" ></a> | [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/O4O5120T1U) | <a href="https://www.paypal.me/depapp" target="_blank"><img src="https://www.paypalobjects.com/digitalassets/c/website/marketing/apac/C2/logos-buttons/optimize/44_Yellow_PayPal_Pill_Button.png"></a> |
| ------------ | ----- | ------ |

<a href="https://saweria.co/depapp" target="_blank"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/6134774/278801090-c4efd5c9-c0a7-43dc-9ea1-c21bc1a55203.png" width="20%" height="20%"></a>

</div>

## :bookmark: credits
- [pactum-cucumber-boilerplate](https://github.com/pactumjs/pactum-cucumber-boilerplate)
- [Dominik Kundel](https://www.twilio.com/blog/how-to-build-a-cli-with-node-js)
- [old-README](https://github.com/depapp/pusakatest/tree/0af4d1c0a0ce712fd2380f8de50b1562134468e4#readme)
