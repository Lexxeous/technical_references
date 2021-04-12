pragma solidity >=0.5.0 <0.6.0;

// The best source of randomness we have in Solidity is the keccak256 hash function.
// We could do something like the following to generate a random number:

// Generate a random number between 1 and 100:
contract RNG {
	uint randNonce = 0;
	uint random = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % 100;
	randNonce++;
	uint random2 = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % 100;
}

// THE ABOVE METHOD IS VULNERABLE TO ATTACK BY A DISHONEST NODE
// In Ethereum, when you call a function on a contract, you broadcast it to a node or
// nodes on the network as a transaction. The nodes on the network then collect a bunch of
// transactions, try to be the first to solve a computationally-intensive mathematical problem
// as a "Proof of Work", and then publish that group of transactions along with their Proof of Work
// (PoW) as a block to the rest of the network.

// Once a node has solved the PoW, the other nodes stop trying to solve the PoW, verify that the
// other node's list of transactions are valid, and then accept the block and move on to trying to
// solve the next block.

// This makes our random number function exploitable.

// Let's say we had a coin flip contract — heads you double your money, tails you lose everything.
// Let's say it used the above random function to determine heads or tails. (random >= 50 is heads,
// random < 50 is tails).

// If I were running a node, I could publish a transaction only to my own node and not share it.
// I could then run the coin flip function to see if I won — and if I lost, choose not to include
// that transaction in the next block I'm solving. I could keep doing this indefinitely until I
// finally won the coin flip and solved the next block, and profit.

// SO HOW DO WE GENERATE RANDOM NUMBERS SAFELY IN ETHEREUM?
// Because the entire contents of the blockchain are visible to all participants, this is a hard
// problem, and its solution is beyond the scope of this tutorial. You can read this StackOverflow thread
// (https://ethereum.stackexchange.com/questions/191/how-can-i-securely-generate-a-random-number-in-my-smart-contract)
// for some ideas. One idea would be to use an oracle to access a random number function from outside
// of the Ethereum blockchain.