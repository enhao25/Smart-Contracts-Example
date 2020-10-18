pragma solidity ^0.5.13;

contract FunctionExample {
    
    mapping(address => uint) public balanceReceived;
    
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    // Only readable and not writable for view function
    function getOwner() public view returns(address) {
        return owner;
    }
    
    // Pure function is a function that is not interacting with any storage vairables / class variables
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not allowed to destroy the smart contract");
        selfdestruct(owner);
    }
    
    // Send money to the smart contract
    function receiveMoney() public payable {
        // Only send the amount that the sender has put in
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        // Require the sender to have enough funds before we allow them to withdraw the specificed amount
        require(balanceReceived[msg.sender] >= _amount, "Not enought funds");
        // Prevent overflow
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    // Fallback function
    function () external payable {
        receiveMoney();
    }
    
}