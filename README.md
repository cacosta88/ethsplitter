# ETHSplitter (Draft)

Designed to split Ether (ETH) among multiple recipients. It inherits from OpenZeppelin's Ownable contract, which helps manage contract ownership.

The main function, splitETH, takes two input arrays: an array of recipient addresses (recipients) and an array of amounts to be sent to those recipients (amounts). The function can only be called by the contract owner, and it accepts Ether payments.

Here's a step-by-step breakdown of what the contract does:

1 - It checks if the lengths of the input arrays are equal, to make sure each recipient has a corresponding amount.

2 - It limits the number of recipients to 100. Note that this limit might not be optimal and might need some testing.

3 - It verifies that none of the recipients is the zero address, an invalid address, or the owner's address.

4 - It calculates the total amount of Ether to be split and makes sure it matches the Ether sent to the contract.

5 - It transfers the specified amounts of Ether to each recipient. If a transfer fails, the transaction is reverted.

6 - The contract also includes a withdraw function that allows the owner to withdraw any remaining Ether in the contract.

Lastly, there's a receive function that safely accepts Ether sent to the contract. This function doesn't do anything besides accepting Ether payments.

DISCLAIMER: This smart contract has been put together for research purposes only.
    It is not intended for use in production, and users should exercise caution and
    conduct thorough testing and audits before using this or any other smart contract.
