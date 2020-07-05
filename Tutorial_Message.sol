// Specific version of solidity to use
pragma solidity ^0.4.17;

// Simple smart contract that we can set and retrieve message
// Make a new contract definition (Similar to writing a class)
contract Inbox {
    // Declaring of storage variable -> function getter will be created for you without creating a getMessage() function
    string public message;
    
    // constructor
    function Inbox(string initialMessage) public {
        message = initialMessage;
    }
    
    // Function setter
    function setMessage(string newMessage) public {
        message = newMessage;
    }
}}