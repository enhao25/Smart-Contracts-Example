pragma solidity ^0.5.13;

contract StartStopUpdateExample {
    address owner;
    
    bool public paused;
    
    constructor() public {
        // Called once and only once during the contract deployment
        owner = msg.sender;
        paused = false;
    }
    
    function sendMoney() public payable {
        
    }
    
    function setPause(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        // Assertion for the msg.sender to be the owner or there will be an error
        require(msg.sender == owner, "You are not the owner");
        require(paused == false, "Contract is paused");
        _to.transfer(address(this).balance);
    }
    
    function destorySmartContract(address payable _to) public {
        // The address will receive the rest of the funds
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}