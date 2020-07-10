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

let lottery;
let accounts;

beforeEach(async () => {
    accounts = await web3.eth.getAccounts();

    lottery = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({ data: bytecode })
        .send({ from: accounts[0], gas: '1000000' })
});

describe("Lottery description", () => {
    it('deploys a contract', () => {
        assert.ok(lottery.options.address);
    })

    it('allows one account to enter', async () => {
        await lottery.methods.enter().send({
            from: accounts[0],
            value: web3.utils.toWei('0.02', 'ether') //Transform ether to wei
        });

        const players = await lottery.methods.getPlayers().call({
            from: accounts[0]
        });

        assert.equal(accounts[0], players[0]);
        assert.equal(1, players.length);
    });

    it('allows multiple accounts to enter', async () => {
        await lottery.methods.enter().send({
            from: accounts[0],
            value: web3.utils.toWei('0.02', 'ether') //Transform ether to wei
        });

        await lottery.methods.enter().send({
            from: accounts[1],
            value: web3.utils.toWei('0.02', 'ether') //Transform ether to wei
        });

        await lottery.methods.enter().send({
            from: accounts[2],
            value: web3.utils.toWei('0.02', 'ether') //Transform ether to wei
        });

        const players = await lottery.methods.getPlayers().call({
            from: accounts[0]
        });

        assert.equal(accounts[0], players[0]);
        assert.equal(accounts[1], players[1]);
        assert.equal(accounts[2], players[2]);
        assert.equal(3, players.length);
    })

    it('requries a min amount of ether to enter', async () => {
        // Ensure that an error occurs when it is < 0.01 ether
        try {
            await lottery.methods.enter().send({
                from: accounts[0],
                value: 40
            })
            assert(false);
        } catch (err) {
            // Ensure that there is an error present
            assert(err);
        }
    })

    it('Only manager can call pickWinner', async () => {
        try {
            await lottery.methods.pickWinner().send({
                from: accounts[1]
            });
            assert(false);
        } catch (err) {
            assert(err);
        }
    })
})

