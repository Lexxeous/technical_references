<!-- Solidity Coding Reference -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Solidity Reference: <img src="../.pics/Solidity/solidity_logo.png" width="100"/>

Credit for the contents in folders `Basic Zombie Dapp`, `Advanced Zombie Dapp`, & `Beyond Ethereum` goes to the [CryptoZombies Tutorial](https://cryptozombies.io/en/course/).

### Basic Zombie Dapp

This distributed application provides implementation for creating zombies with randomized DNA. The zombies are also mapped to owners, can attack/feed on other zombies and kittens, each have a win count and loss count, can level up, and can also be transferred to different owners. In an effort to control the rate at which a particular zombie attacks/feeds, there is also a cooldown timer that is incurred on each zombie.

The inclusion of the `Ownable`, `SafeMath`, and `ERC721` libraries/contracts are used to provide implementations for private user ownership, prevent overflow and underflow of computations, & for properly exchanging zombies as ERC tokens respectively.

An `index.html` file with embedded `JS` is also included to interface with the `Solidity` zombie files and provide some user interaction with `Web3`.


### Advanced Zombie Dapp


### Beyond Ethereum