pragma solidity ^0.8.26;
/**
 * @title MyBank
 * @dev This contract handles banking operations.
 * @notice Ensure you have sufficient balance before attempting to withdraw.
 
 */
contract Demo {
uint private newbal = 3500;
function deposit(uint x) public {
newbal += x;
}
function withdraw(uint x) public {
if (newbal < x) {
revert("Insufficient balance");
}
newbal -= x;
}
function show() public view returns (uint) {
return newbal;
}
}

*****************************************************************************************************

pragma solidity ^0.8.0;

/**
 * @title MyBank
 * @dev This contract handles banking operations.
 * @notice Ensure you have sufficient balance before attempting to withdraw.
 
 */
contract Bank_c {
	address owner; // Current owner of the contract

	constructor() payable {
    	owner = msg.sender;
	}

	function withdraw() public {
    	require(owner == msg.sender, "Only the owner can withdraw");
    	payable(msg.sender).transfer(address(this).balance);
	}

	function deposit() public payable {
    	require(msg.value > 0, "You must send some Ether");
	}

	function getBalance() public view returns (uint256) {
    	return address(this).balance;
	}
}
