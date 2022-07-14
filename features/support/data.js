const { faker } = require('@faker-js/faker')

const randomData = {
    name: faker.name.findName(),
    email: faker.internet.email(),
    password: faker.internet.password()
}

module.exports = {
    randomData
}