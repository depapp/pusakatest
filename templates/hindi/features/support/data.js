const { faker } = require('@faker-js/faker')

const randomData = {
    name: faker.name.fullName(),
    email: faker.internet.email(),
    password: faker.internet.password()
}

module.exports = {
    randomData
}