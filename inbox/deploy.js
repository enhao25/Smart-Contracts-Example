const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
    // Insert mneomonic,
    'https://rinkeby.infura.io/v3/39c513ed58d6483ca3323b789152bbfa'
);

const web3 = new Web3(provider);

const deploy = async () => {
    // The mnenonic generates all the accounts.
    const accounts = await web3.eth.getAccounts();
    console.log("Attempting to deploy from account", accounts[0]);
    
    const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({ data: '0x' + bytecode, arguments: ['Hi there!'] })
        .send({ from: accounts[0] })
    
    console.log('Contract deployed to: ', result.options.address);
}

deploy();
