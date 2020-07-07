// // Assert is built-in on nodejs for assertion
// const assert = require('assert');
// // Ganache-cli that we installed
// const ganache = require('ganache-cli');
// // Web3 that we installed
// const Web3 = require('web3'); // Constructor of web3
// // Instance of web3
// const web3 = new Web3(ganache.provider());

// class Car {
//     park() {
//         return 'stopped';
//     }
//     drive() {
//         return 'vroom';
//     }
// }

// let car;

// beforeEach(()=> {
//     // Initalize before the it function runs
//     car = new Car();
// })

// describe('Car:', () => {
//     it('can park', () => {
//         // Assert that car.park == 'stopped'
//         assert.equal(car.park(), 'stopped');
//     })

//     it('can drive', () => {
//         // Assert that car.drive == 'vroom'
//         assert.equal(car.drive(), 'vroom');
//     })
// })