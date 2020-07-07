const path = require("path");
const fs = require("fs");
const solc = require('solc');

// Get the full path for inbox.sol
const inboxPath = path.resolve(__dirname, 'contracts', 'Inbox.sol');
// Get source code from indox path
const source = fs.readFileSync(inboxPath, 'utf8');

// Compile the .sol path and export it
module.exports = solc.compile(source, 1).contracts[':Inbox'];