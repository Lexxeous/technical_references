<!-- Solidity Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Solidity Management: <img src="../.pics/Solidity/solidity_logo.png" width="100"/>

> Credit for these contents goes to the [CryptoZombies Tutorial](https://cryptozombies.io/en/course/). Please follow these tutorials for more information.

## ERC721:

Using a standard like ERC721 has the benefit that we don't have to implement the
auction or escrow logic within our contract that determines how players can trade / sell items.
If we conform to the spec, someone else could build an exchange platform for
crypto-tradable ERC721 assets, and our ERC721-compatible items would be usable on that platform.
So there are clear benefits to using a token standard instead of rolling your own trading logic.

> An example of a prototyped contract for ERC721 crypto-tradable assets can be found at `lib/erc721.sol` and is also listed below.

```sol
contract ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

  function balanceOf(address _owner) external view returns (uint256);
  function ownerOf(uint256 _tokenId) external view returns (address);
  function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
  function approve(address _approved, uint256 _tokenId) external payable;
}
```


## SafeMath:

The `assert` function is similar to `require`, but it will throw an error if false.
The difference between `assert` and `require` is that `require` will refund the user
the rest of their gas when a function fails, whereas `assert` will not. So most of
the time you want to use `require` in your code; `assert` is typically used when something
has gone horribly wrong with the code (like a `uint` overflow).

> An example of a prototyped contract for `SafeMath` implementations can be found at `lib/safemath.sol` and is also listed below. To perform safe math operations for other types of integers, simply replace the `uint256` keywords with the desired datatype for all occurences.

```sol
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
```


## Natspec Commenting Standard:

There is a standard in the Solidity community that is used to format comments/documentation called `Natspec`, which looks like this:

```sol
/// @title A contract for basic math operations.
/// @author H4XF13LD MORRIS
/// @notice For now, this contract just includes a multiply function.
contract Math {
  /// @notice Multiplies 2 numbers together.
  /// @param x the first uint.
  /// @param y the second uint.
  /// @return z the product of x and y.
  /// @dev This function does not currently check for overflows.
  function multiply(uint x, uint y) returns (uint z) {
    // This is just a normal comment, and won't get picked up by natspec
    z = x * y;
  }
}
```

 * `@title` and `@author` are straightforward.
 * `@notice` explains to a user what a contract/function does.
 * `@dev` is for explaining extra details to developers.
 * `@param` and `@return` are for describing what each parameter and return value of a function are for.

> Note: You don't always have to use all of these tags for every function — all tags are optional. But at the very least, leave a `@dev` note explaining what each function does.


## JSON-RPC:

Ethereum nodes only speak a language called JSON-RPC, which isn't very human-readable. A query to tell the node you want to call a function on a contract looks something like this:

```json 
{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from":"0xb60e8dd61c5d32be8058bb8eb970870f07233155","to":"0xd46e8dd67c5d32be8058bb8eb970870f07244567","gas":"0x76c0","gasPrice":"0x9184e72a000","value":"0x9184e72a","data":"0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"}],"id":1}
```

Luckily, `Web3.js` hides these nasty queries below the surface, so you only need to interact with a convenient and easily readable JavaScript interface. Instead of needing to construct the above query, calling a function in your code will look something like this:

```js
<contract_object>.methods.<function_name>([params]).send({ from: "0xb60e8dd61c5d32be8058bb8eb970870f07233155", gas: "3000000" })

```


## Infura:

[`Infura`](https://infura.io/) is a service that maintains a set of Ethereum nodes with a caching layer for fast reads, which you can access for free through their API. Using `Infura` as a provider, you can reliably send and receive messages to/from the Ethereum blockchain without needing to set up and maintain your own node.

```js
var web3 = new Web3(new Web3.providers.WebsocketProvider("wss://mainnet.infura.io/ws"));
```

However, since some DApps are going to be used by many users — and these users are going to WRITE to the blockchain and not just read from it — we might need a way for these users to sign transactions with their private key.

> Note: `Ethereum` (and blockchains in general) use a public / private key pair to digitally sign transactions. Think of it like an extremely secure password for a digital signature. That way if you change some data on the blockchain, you can prove via your public key that you were the one who signed it — but since no one knows you private key, no one can forge a transaction for you.

Cryptography is complicated, so unless you're a security expert and you really know what you're doing, it's probably not a good idea to try to manage users' private keys yourself in our app's front-end.
But luckily you don't need to — there are already services that handle this for you. The most popular of these is Metamask.


## Metamask:

[`Metamask`](https://metamask.io/) is a browser extension for `Google Chrome` and `Firefox` that lets users securely manage their `Ethereum` accounts and private keys, and use these accounts to interact with websites that are using `Web3.js`. (If you haven't used it before, you'll definitely want to go and install it — then your browser is `Web3` enabled, and you can now interact with any website that communicates with the `Ethereum` blockchain!).
And as a developer, if you want users to interact with your DApp through a website in their web browser, you'll definitely want to make it `Metamask`-compatible.

> Note: `Metamask` uses `Infura`'s servers under the hood as a `Web3` provider, just like what was explained above — but it also gives the user the option to choose their own `Web3` provider. So by using `Metamask`'s `Web3` provider, you're giving the user a choice, and it's one less thing you have to worry about in your app.

```js
window.addEventListener('load', function() {
  // Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 !== 'undefined') {
    // Use Mist/MetaMask's provider
    web3js = new Web3(web3.currentProvider);
  } else {
    // Handle the case where the user doesn't have web3.
    // Show a message telling how to install Metamask to use the app.
  }

  // Start the app & access web3js freely
  startApp()
})
```

Now that `Web3.js` is initialized with `MetaMask`'s `Web3` provider, you can set it up to talk to your smart contract.
`Web3.js` will need 2 things to talk to your contract: its address and its ABI.


## Contract ABI:

The other thing `Web3.js` will need to talk to your contract is its ABI.
ABI stands for "Application Binary Interface". Basically, it's a representation of your contracts' methods in JSON format that tells `Web3.js` how to format function calls in a way your contract will understand.
When you compile your contract to deploy to `Ethereum`, the `Solidity` compiler will give you the ABI, so you'll need to copy and save this in addition to the contract address.

```js
<project_var> = new web3js.eth.Contract(<contract_ABI>, <contract_address>);
```

`Web3.js` has two methods we will use to call functions on our contract: `call` and `send`.

#### Call:

The `call` method is used for `view` and `pure` functions. It only runs on the local node, and won't create a transaction on the blockchain.

> Note: The `view` and `pure` functions are read-only and don't change state on the blockchain. They also don't cost any gas, and the user won't be prompted to sign a transaction with MetaMask.

Using `Web3.js`, you would call a function named `<method_name>` as follows:

```js
<contract_object>.methods.<method_name>([params]).call()
```

#### Send:

The `send` method will create a transaction and change data on the blockchain. You'll need to use `send` for any functions that aren't `view` or `pure`.

> Note: Sending a transaction will require the user to pay gas, and will pop up their `Metamask` to prompt them to sign a transaction. When we use `Metamask` as our `Web3` provider, this all happens automatically when we call `send()`, and we don't need to do anything special in the code.

Using `Web3.js`, you would send a transaction calling a function named `<method_name>` as follows:

```js
<contract_object>.methods.<method_name>([params]).send()
```


## Getting Data:

In Solidity, when you declare a variable public, it automatically creates a public "getter" function with the same name. So if you wanted to look up an object with and ID of 15, you would call it as if it were a function: `<object_name>(15)`.
Here's how we would write a `JavaScript` function in our front-end that would take an object ID, query our contract for that object, and return the result:

```js
function getObjectDetails(id) {
  return <contract_object>.methods.<object_name>(id).call()
}

// Call the function and do something with the result:
getObjectDetails(15)
.then(function(result) {
  console.log("Object 15: " + JSON.stringify(result));
});
```

> Note: that this is asynchronous, like an API call to an external server. So `Web3` returns a promise here.
Once the promise resolves (which means we got an answer back from the `Web3` provider), our example code continues with the then statement, which logs the result to the console.



## Getting User Accounts with `MetaMask`:

`MetaMask` allows the user to manage multiple accounts in their extension.
We can see which account is currently active on the injected `Web3` variable using:

```js
var userAccount = web3.eth.accounts[0]
```

Because the user can switch the active account at any time in `MetaMask`, the app needs to monitor this variable to see if it has changed and update the UI accordingly. For example, if the user's homepage displays their objects, when they change their account in `MetaMask`, we'll want to update the page to show the owned objects for the new account they've selected.
We can do that with a `setInterval()` loop as follows:

```js
var accountInterval = setInterval(function() {
  // Check if account has changed
  if (web3.eth.accounts[0] !== userAccount) {
    userAccount = web3.eth.accounts[0];
    // Call some function to update the UI with the new account
    updateInterface();
  }
}, 100);
```

What this does is check every 100 milliseconds to see if `userAccount` is still equal to `web3.eth.accounts[0]` (i.e. does the user still have that account active). If not, it reassigns `userAccount` to the currently active account, and calls a function to update the display.



## Wei
The way to send Ether along with a function is simple, with one caveat: we need to specify how much to send in wei, not Ether.

#### What's a Wei?
A wei is the smallest sub-unit of Ether — there are 10^18 wei in one ether.
That's a lot of zeroes to count — but luckily `Web3.js` has a conversion utility that does this for us.

```js
web3js.utils.toWei("1"); // This will convert 1 ETH to Wei
```
