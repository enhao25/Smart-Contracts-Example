pragma solidity ^0.6.0;

contract simpleMappingExample {
    // Similar to a hashmap
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    
    // Set the index you specific to true
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
    
    function setMyAddressToTrue() public {
        // Set the user that call this function to true in the mapping
        myAddressMapping[msg.sender] = true;
    }
}