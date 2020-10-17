pragma solidity ^0.5.13;

contract MappingStructExamplewStruct {
    
    struct Payment {
        uint amount;
        uint timestamps;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayment;
        mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceReceived;
    
    // Return the balance of this smart contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    // Send money to the smart contract
    function sendMoney() public payable {
        // Only send the amount that the sender has put in
        balanceReceived[msg.sender].totalBalance += msg.value;
        
        // Because it is a referenced type need to specific memory
        // Now is the current time stamp
        Payment memory payment = Payment(msg.value, now);
        
        // Put the data accordingly to the payment struct and store it in balance
        // numPayment acts as the key for this
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayment] = payment;
        balanceReceived[msg.sender].numPayment++;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        // Require the sender to have enough funds before we allow them to withdraw the specificed amount
        require(balanceReceived[msg.sender].totalBalance >= _amount, "Not enought funds");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
    
    // Withdraw all the money to the _to person
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        // Everything else need to be updated first before sending the money out
        _to.transfer(balanceToSend);
    }
}