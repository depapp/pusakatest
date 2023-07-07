const { faker } = require('@faker-js/faker')

const randomData = {
    name: faker.person.fullName(),
    email: faker.internet.email(),
    password: faker.internet.password()
}

module.exports = {
    randomData
}