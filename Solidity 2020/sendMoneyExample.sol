pragma solidity ^0.5.13;

contract sendMoneyExample {
    
    uint public balanceReceived;
    
    // Payable allows the function to receive money
    function receiveMoney() public payable {
        // Msg.value is the amount that is send to this function
        balanceReceived += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        // Need to cast this to be an address to access the balance of it
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        address payable to = msg.sender;
        balanceReceived = 0;
        to.transfer(this.getBalance());
    }
    
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}