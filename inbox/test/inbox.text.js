// Assert is built-in on nodejs for assertion
const assert = require('assert');
// Ganache-cli that we installed
const ganache = require('ganache-cli');
// Web3 that we installed
const Web3 = require('web3'); // Constructor of web3
// Instance of web3
const web3 = new Web3(ganache.provider());
// Get the interface (ABI) and bytecode from the compile.js
const { interface, bytecode } = require('../compile.js');

let accounts;
let inbox;

beforeEach(async () => {
    // Get a list of all accounts 
    // Web3 allows us access to multiple cryptocurrency, for our case, we are using ethereum
    accounts = await web3.eth.getAccounts();

    // Use one of those accounts to deploy the contract
    inbox = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({ data: bytecode, arguments: ['Hi there!'] }) // In inbox.sol, the constructor requires 1 string arguements, hence that is what we put there
        .send({ from: accounts[0], gas: '1000000' }) // from is the person that deploys the contract
})

describe('Inbox', () => {
    it('deploys a contract', () => {
        // Assert.ok checks if the value is a valid value (Non-null)
        assert.ok(inbox.options.address); // Address of the contract (Ensures that a contract was created)
    })

    it("has a default message", async () => {
        // inbox.methods returns all the methods availabe (Eg. message and setmessage)
        const message = await inbox.methods.message().call();
        assert.equal(message, 'Hi there!')
    })
})