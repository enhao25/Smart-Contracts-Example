// Specific version of solidity to use
pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address public currentWinner;
    address[] public players;
    mapping(address => bool) playersMap;

    function Lottery() public {
        manager = msg.sender;
    }
    // Return all the players available
    function getPlayers() public view returns(address[]) {
        return players;
    }
    // Enter the user into the Lottery
    function enter() public payable {
        // Validation for minimum ether required (The user won't know why it fails)
        require(msg.value >= .01 ether);
        // Ensure that the account has not entered the lottery before
        require(playersMap[msg.sender] == false);
        // Push the person that enters into the players array
        players.push(msg.sender);
        // Push the person to the playersMap mapping
        playersMap[msg.sender] = true;
    }
    // Manager to pick a winner
    function pickWinner() public restrictedToManger {
        // Start to pick winner
        uint index = random() % players.length;
        address winner = players[index];
        currentWinner = winner;
        // Transfer all the ether that exist in the contract to the winner
        winner.transfer(this.balance);
        // Reset the mapping
        for (uint i = 0; i < players.length; i++){
            playersMap[players[i]] = false;
        }
        // Reset the players array to an empty array
        players = new address[](0);
    }
    // Randomly generate a huge number
    function random() private view returns(uint) {
        // Make use of the 3 variables to create a sha3 number
        // The 3 variables are, current block difficult, current time, addresses of players
        // Parse the sha3 value to unit and return it
        return uint(keccak256(block.difficulty, now, players));
    }
    modifier restrictedToManger {
        // Requires the sender to be the manager
        require(msg.sender == manager);
        // _ Specific the code that where the next code will run.
        _;
    }
}