// // Assert is built-in on nodejs for assertion
// const assert = require('assert');
// // Ganache-cli that we installed
// const ganache = require('ganache-cli');
// // Web3 that we installed
// const Web3 = require('web3'); // Constructor of web3
// // Instance of web3
// const web3 = new Web3(ganache.provider());

// beforeEach(() => {
//     // Get a list of all accounts 
//     // Web3 allows us access to multiple cryptocurrency, for our case, we are using ethereum
//     web3.eth.getAccounts()
//         .then(fetchedAccounts => {
//             // Returns a list of pre-generated account that are usable
//             console.log(fetchedAccounts);
//         });

//     // Use one of those accounts to deploy the contract
    
// })

// describe('Inbox', () => {
//     it('deploys a contract', () => {})
// })