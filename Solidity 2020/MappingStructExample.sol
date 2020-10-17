pragma solidity ^0.5.13;

contract MappingStructExample {
    
    mapping(address => uint) public balanceReceived;
    
    // Return the balance of this smart contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    // Send money to the smart contract
    function sendMoney() public payable {
        // Only send the amount that the sender has put in
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        // Require the sender to have enough funds before we allow them to withdraw the specificed amount
        require(balanceReceived[msg.sender] >= _amount, "Not enought funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    // Withdraw all the money to the _to person
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        // Everything else need to be updated first before sending the money out
        _to.transfer(balanceToSend);
    }
}