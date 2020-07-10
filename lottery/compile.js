const path = require("path");
const fs = require("fs");
const solc = require('solc');

// Get the full path for Lottery.sol
const lotteryPath = path.resolve(__dirname, 'contracts', 'Lottery.sol');
// Get source code from indox path
const source = fs.readFileSync(lotteryPath, 'utf8');

// Compile the .sol path and export it
module.exports = solc.compile(source, 1).contracts[':Lottery'];