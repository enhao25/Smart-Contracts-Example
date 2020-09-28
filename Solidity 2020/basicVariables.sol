pragma solidity ^0.5.11;

contract WorkingwithVariable{
    uint256 public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    bool public myBool;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUint8;
    
    function incrementUint() public {
        myUint8++;
    }
    
    // Unsigned interger does not support negative number. Hence when uint8 = 0, -- decreases the bit of the value to become 255.
    function decrementUint() public {
        myUint8--;
    }
    
    address public myAddress;
    
    function setAddress(address _Address) public {
        myAddress = _Address;
    }
    
    // View function can return something
    function getBalanceOfAddress() public view returns(uint) {
        // All address has the attribute balance to retrieve the balance
        return myAddress.balance;
    }
    
    string public myString = "Hello World";
    
    // When using string or any other reference type, we will need to include the memory keywords
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}