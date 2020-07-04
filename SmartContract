pragma solidity ^0.5.1;

// Starting
contract MyContract {
    // Can be used like this if we dont want it to be a contrustor
    string public value = "myValue";
    string public constant stringVal = "constant";
    bool public myBool = true;
    
    enum State { Waiting, Ready, Active }
    State public state;
    
    constructor() public {
        state = State.Waiting;
    }
    
    function activate() public {
        state = State.Active;
    }
    
    function isActive() public view returns(bool) {
        return state == State.Active;
    }
    
    function set(string memory _value) public {
        value = _value;
    }
}


// Array
contract MyContract {
    // Array of unkown size (Auto added id)
    Person[] public people;
    
    uint256 public peopleCount;
    
    struct Person {
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        peopleCount += 1;
    } 
    
}

// Mapping and require
contract MyContract {
    // Similar to hashmap (id => record)
    mapping(uint => Person) public people;
    
    uint256 public peopleCount = 0;
    
    address owner;
    
    // msg.sender = account / address that calls the function
    // require whatever itself to do true
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    struct Person {
        uint id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner{
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        incrementCount();
    } 
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
}

// Time
contract MyContract {
    // Similar to hashmap (id => record)
    mapping(uint => Person) public people;
    
    uint256 public peopleCount = 0;
    
    uint256 openingTime = 1589980905;
    
    modifier onlyWhileOpen() {
        require(block.timestamp > openingTime);
        _;
    }
    
    struct Person {
        uint id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileOpen{
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        incrementCount();
    } 
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
}

// Ether wallet
contract MyContract {
    
    mapping(address => uint256) public balances;
    address payable wallet;
    
    event Purchase(address indexed _buyer, uint256 _amount);
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    // Can only be called outside
    function() external payable {
        buyToken();
    }
    
    // Payable allows the function to accept ether
    function buyToken() public payable {
        // Buy a token 
        balances[msg.sender] += 1;
        // Send ether to the wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
    
}

// Multiple contracts
contract ERC20token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
        
    }
}

contract MyContract {
    
    mapping(address => uint256) public balances;
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    // Can only be called outside
    function() external payable {
        buyToken();
    }
    
    // Payable allows the function to accept ether
    function buyToken() public payable {
        ERC20token _token = ERC20token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
    
}

//OOP
contract ERC20token {
    string public name;
    mapping(address => uint256) public balances;
    
    constructor(string memory _name) public {
        name = _name;
    }
    
    function mint() public {
        balances[tx.origin] ++;
    }
}

// Iheritance
contract MyToken is ERC20token {
    
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    
    constructor(string memory _name, string memory _symbol) ERC20token(_name) public {
        symbol = _symbol;
    }
    
    function mint() public {
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
}

// Libraries
library Math {
    function divide(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b>0);
        uint256 c = a / b;
        return c;
    }
}

contract MyContract {
    uint256 public value;
    
    function calculate(uint value1, uint value2) public {
        value = Math.divide(value1, value2);
    }
}