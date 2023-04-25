// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing OpenZeppelin's Ownable contract to handle contract ownership
import "@openzeppelin/contracts/access/Ownable.sol";

// Defining a new contract named ETHSplitter that inherits from Ownable
contract ETHSplitter is Ownable {

// Function to split ETH among multiple recipients
function withdraw() external onlyOwner {
// Transfer any remaining Ether to the owner
(bool success, ) = owner().call{value: address(this).balance}("");
// If the transfer fails, revert the transaction
require(success, "Withdrawal failed");
    }

// Receive function to safely accept Ether sent to the contract
receive() external payable {

    }
}
function splitETH(
    address payable[] calldata recipients, // Array of recipient addresses
    uint256[] calldata amounts             // Array of amounts to be sent to recipients
)
    external                               // Function can be called from external sources
    payable                                // Function can receive Ether
    onlyOwner                              // Function can only be called by the owner
{
    // Get the number of recipients from the recipients array
    uint256 length = recipients.length;
    // Check that both input arrays have the same length
    require(length == amounts.length, "Array lengths must be equal");
    // Limit the number of recipients to 100
    require(length <= 100, "Up to 100 recipients allowed");

    // Variable to store the total amount of Ether to be split
    uint256 totalAmount = 0;


    // Calculate the total amount of Ether to be split
    for (uint256 i = 0; i < length; ++i) {
        totalAmount = totalAmount + amounts[i];
    }

    // Check that the total amount to be split matches the Ether sent to the contract
    require(totalAmount == msg.value, "Total split amount must equal sent value");

    // Transfer the specified amounts to the recipients
    for (uint256 i = 0; i < length; ++i) {
        // Transfer Ether to the recipient and check for success
        (bool success, ) = recipients[i].call{value: amounts[i]}("");
        // If the transfer fails, revert the transaction
        require(success, "Transfer failed");
    }
}
}
