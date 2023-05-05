# ETHSplitter (Draft)

This smart contract, called ETHSplitter, is built using Solidity 0.8.19 and designed to split ETH or ERC20 tokens among multiple recipients. The contract imports the OpenZeppelin library, specifically the IERC20 and ReentrancyGuard contracts, to handle token operations and protect against reentrancy attacks. The contract emits events to log the splitting operations performed.

The contract contains the following key functions:

#### splitETH: 
Splits the sent ETH among the specified recipients according to the given amounts. Any remaining ETH is returned to the sender. The function is protected by the nonReentrant modifier.
#### splitEqualETH: 
Splits the sent ETH equally among the specified recipients, rounding down when necessary. Any remaining ETH is added to the first recipient's share. The function is also protected by the nonReentrant modifier.
#### splitERC20: 
Splits the specified ERC20 token among the given recipients according to the provided amounts. The function is protected by the nonReentrant modifier.
#### splitEqualERC20: 
Splits the specified ERC20 token equally among the given recipients, rounding down when necessary. Any remaining tokens are added to the first recipient's share. The function is protected by the nonReentrant modifier.
#### _splitETH: 
An internal function to handle the logic of splitting ETH according to the provided amounts, ensuring that the total split does not exceed the available balance.
#### _transferTokensFromSenderToRecipients: 
An internal function to transfer ERC20 tokens from the sender to the recipients according to the provided amounts.
#### _convertToAddresses: 
An internal function to convert an array of payable addresses to an array of regular addresses.
#### withdraw: 
Withdraws the remaining ETH or ERC20 tokens to the contract owner's address.
The contract also includes a receive() function to accept ETH payments.

This contract is designed for research and development purposes and should be used with caution.
