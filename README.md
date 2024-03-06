# TypesOfFunctionsERC20

This is a Solidity program that simulates a creditor loaning of wei to a debtor. The purpose of this program is showcase my current understanding of Solidity as a programming language (the creation of an ERC20 token and the use of its functions) as well as serve as a referrence to those who are studying Solidity like me. 

## Description

This program is a contract written in Solidity, an object-oriented programming language typically used for developing smart contracts on various blockchain platforms such as ethereum. This contract creates an ERC20 token and simulates some possible transactions with the ERC20 standard. ERC20 is a standard used to create tokens. It makes it easier for different tokens to be exchanged for one another on the ethereum network. For more information, here is the doc for ERC20 by openzeppelin: https://docs.openzeppelin.com/contracts/4.x/erc20.

This contract has a modifier called onlyOwner which only allows the contract owner to access the mint function. The rest of the functions are accessible by any user. The contract has the following functions: 
* **approve** - takes the address of the of a spender as well as an amount of type uint256 which will serve as an allowance of the spender which will be deducted from the owner's(function caller's) balance as arguments.
* **allowance** - takes the allowance provider's address and the address of the spender as arguments to return the allowance amount that can be spent by the spender from the allowance provider's balance.
* **transferFrom** - takes a from-address, a to-address, and an amount of type uint256 that will be transfered to the to-address as arguments. This can only work if the person who owns the from-address or a spender that was give an allowance to spend in their stead calls this function.

* **mint** - takes a receiving address as well an amount of type uint256 to be minted as arguments, mints that amount. The totalSupply is updated as a consequence.
* **burn** - takes an amount of type uint256 to be burned as an argument and burns that amount of tokens from the function caller's balance.
* **transfer** - takes a to-address and an amount of type uint256 as an argument and transfers that amount of tokens to the to-addressee's balance.
* **balanceOf** - takes an address as an argument and returns the balance of that address.
* **totalSupply** - returns the totalSupply of tokens.
* **name** - returns the name of the token.
* **symbol** - returns the symbol of the token.
* **decimals** - returns the decimals conversion factor of the token. Typically the value being used is 10^18.
* **displayOwner** - this is a custom function and a not imported from the ERC20.sol contract. It returns the address of the owner of the contract. As an alternative, you can use Ownable.sol by openzeppelin who also made ERC20. You can refer to this doc by openzeppelin for more information: https://docs.openzeppelin.com/contracts/2.x/access-control.

## Getting Started

### Executing program

In order to run this program, you can use Remix, an online Solidity IDE which I used to develop this contract. For starters, please go to the Remix website at https://remix.ethereum.org/.
Upon reaching the website, create a new file by clicking the "New File" button around the center of the website or the button that looks like a piece of paper with the top right corner folded found on the top left corner of the website under workspaces. Save the file under the file name of your choice while making sure to use the .sol extension (e.g. ERC20Assessment.sol). Copy and then paste the following code into the file you have just created:


```Solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SalieriToken is ERC20{
    
    //Global variable to hold address of the owner
    address owner;
    
    //Constructor to create an ERC20 Token, assign contract deployer as owner, and mint an initial supply of tokens
    constructor()ERC20("Salieri", "SAL"){
        owner = msg.sender;
        _mint(owner, 1000*(10**decimals()));
        
    }

    //Function to mint tokens. Only the owner is allowed to mint tokens.
    function mint(address receiver, uint256 amount) public onlyOwner{

        _mint(receiver, amount);
    } 

    //Creation of modifier to be used on the mint function
    modifier onlyOwner() {
        require(owner == msg.sender, "Only the owner of this contract is authorized to mint tokens.");
        _;
    }

    //Function that burns a specified amount of tokens from the caller's balance
    function burn(uint256 value) public{
        _burn(_msgSender(), value);
    }

    //Function that displays the address of the owner
    function displayOwner() public view returns (address){
        return owner;
    }
}


```
### Contract Compilation
In order to compile the code, click on the "Solidity compiler" tab found in the left-hand sidebar below the button that looks like a magnifying glass. Please make sure the Compiler is set to "0.8.18" (or any other compatible version), and then click on the "Compile ERC20Assessment.sol" assuming you named your Solidity contract as such. Otherwise, the button will say "Compile " followed by the name of your Solidity contract. For simplicity's sake I will be referring to the contract you have made as "ERC20Assessment.sol" but it will appear on the Remix IDE as how you named the contract.


### Contract Deployment
After the contract has been compiled, you can now deploy the contract by clicking on the "Deploy & run transactions" tab found in the left-hand sidebar below the "Solidity compiler" tab. Select the "ERC20Assessment.sol" contract or as how you have named it. After selecting the contract, click on the "Deploy" button.


### Post Contract Deployment
After the contract has been deployed, the contract will be found under "Deployed Contracts". Expand it by clicking the ">" button below "Deployed Contracts". You should see the following buttons: 
* **approve** - takes the address of the of a spender as well as an amount of type uint256 which will serve as an allowance of the spender which will be deducted from the owner's(function caller's) balance as arguments.
* **allowance** - takes the allowance provider's address and the address of the spender as arguments to return the allowance amount that can be spent by the spender from the allowance provider's balance.
* **transferFrom** - takes a from-address, a to-address, and an amount of type uint256 that will be transfered to the to-address as arguments. This can only work if the person who owns the from-address or a spender that was give an allowance to spend in their stead calls this function.

* **mint** - takes a receiving address as well an amount of type uint256 to be minted as arguments, mints that amount. The totalSupply is updated as a consequence.
* **burn** - takes an amount of type uint256 to be burned as an argument and burns that amount of tokens from the function caller's balance.
* **transfer** - takes a to-address and an amount of type uint256 as an argument and transfers that amount of tokens to the to-addressee's balance.
* **balanceOf** - takes an address as an argument and returns the balance of that address.
* **totalSupply** - returns the totalSupply of tokens.
* **name** - returns the name of the token.
* **symbol** - returns the symbol of the token.
* **decimals** - returns the decimals conversion factor of the token. Typically the value being used is 10^18.
* **displayOwner** - this is a custom function and a not imported from the ERC20.sol contract. It returns the address of the owner of the contract. As an alternative you can use Ownable.sol by openzeppelin who also made ERC20. You can refer to this doc by openzeppelin for more information: https://docs.openzeppelin.com/contracts/2.x/access-control.

These buttons correspond to each of the functions within the contract.
The approve, burn, mint, transfer, transferFrom, allowance, and balanceOf functions have input fields beside them.

You can interact with contract with the following actions:

#### I - Displaying the name of the token

**Steps on displaying the name of the token :**

1.) Find the "name" button.

2.) Click the "name" button. The name of the token will be displayed below the button.

#### II - Displaying the symbol of the token

**Steps on displaying the name of the token :**

1.) Find the "symbol" button.

2.) Click the "symbol" button. The symbol of the token will be displayed below the button.

#### III - Displaying the owner of the token

**Steps on displaying the name of the token :**

1.) Find the "displayOwner" button.

2.) Click the "displayOwner" button. The address of the owner of the contract will be displayed below the button.

#### IV - Displaying the decimal used by the token

**Steps on displaying the name of the token :**

1.) Find the "decimals" button.

2.) Click the "decimals" button. The decimal value used by the token will be displayed below the button.

#### V - Displaying the totalSupply of the token

**Steps on displaying the name of the token :**

1.) Find the "totalSupply" button.

2.) Click the "totalSupply" button. The totalSupply of the token will be displayed below the button.

#### VI - Getting the balance of a user given an address

**Steps on getting the balance of a user given an address:**

1.) Find the "balanceOf" button.

2.) Find the input field beside the "balanceOf" button.

3.) Input the address of the user whose balance you want to be displayed.

3.) Click the "balanceOf" button. The current balance of the user will be shown below the button.

#### VII - Minting of tokens

**Steps on minting of tokens:**

1.) Find the input field beside the "mint" button.

2.) Input the receiving address followed by the amount of your token to minted separated by a comma e.g.(receiving_address,amount).

3.) Click the "mint" button. You can confirm if the transaction is a success by checking the balance of the receiving address using the "balanceOf" function.

#### VIII - Transferring of tokens

**Steps on transferring of tokens:**

1.) Find the input field beside the "transfer" button.

2.) Input the receiving address followed by the amount of your token to transfer separated by a comma e.g.(receiving_address,amount).

3.) Click the "transfer" button. You can confirm if the transaction is a success by checking your balance using the "balanceOf" function (Your balance should have decreased by the amount you transferred).

#### IX - Burning of tokens

**Steps on burning of tokens:**

1.) Find the input field beside the "burn" button.

2.) Input the amount of tokens you want to burn from your balance.

3.) Click the "burn" button. You can confirm if the transaction is a success by checking your balance using the "balanceOf" function (Your balance should have decreased by the amount you burned).

#### X - Checking the allowance provided to you

1.) Find the "approve" button.

2.) Input the spender's address followed by the amount of tokens from your balance you want to give as an allowance separated by a comma e.g(spender_address,amount).

3.) Click the "approve" button. You can confirm that the transaction was a success by checking your balance using the balanceOf function(your balance should decrease)  or by checking the allowance provided to the spender using the "allowance" function (allowance should be the same amount as you inputted when using the "allowance" function).

#### XI - Approving of allowance to be given to a spender

**Steps on approving of allowance to be given to a spender:**

1.) Find the "approve" button.

2.) Input the spender's address followed by the amount of tokens from your balance you want to give as an allowance separated by a comma e.g(spender_address,amount).

3.) Click the "approve" button. You can confirm that the transaction was a success by check your balance using the balanceOf function or by checking the allowance provided to the spender using the "allowance" function.

#### XII - Transferring of tokens from a provided address to a receiving address (Using of allowance)

**Steps on transferring of tokens from a provided address to a receiving address (Using of allowance):**

1.) Find the "transferFrom" button.

2.) Input the address the provided you the allowance followed by the receiving address (the address where you will transfer an amount from the allowance provided to you) then the amount of tokens you want to transfer from the allowance all of which are separated by a comma e.g.(allowance_provider_address,receiving_address,amount).

3.) Click the "transferFrom" button. You can confirm that the transaction was by checking the remaining allowance using the "allowance" function.


## Code explanation and Contract usage Video Walkthrough
Below is the video walkthrough on how to use the contract once you already have it compiled and deployed on the Remix IDE:
https://www.loom.com/share/729d20832a7b4f1c824a6c1f79662c21


## Help

### Compilation failed
Please check if the code inside the .sol file you created in remix matches the code I provided. If it does not match then please copy the code I provided in its entirety and replace the code in the .sol filed that you created in Remix. If it does match and it still will not compile then please check your internet connection or trying a different browser or updating your current browser. 

### Transferring of tokens from a provided source address and receiving address failed
If upon checking that you have been indeed provided an allowance but the transferFrom transaction still failed, this could be due to a lack of balance from the person that provided you that allowance. The approve function allows the provision of allowance despite a lack of balance because any transaction that consumes that allowance will fail if the allowance providers balance is less then the allowance being spent. Allowance is merely the maximum amount of tokens you can use from the allowance provider's balance.

### Minting of tokens failed
You must be the owner of the contract in order to be able to mint tokens. If you are indeed the owner of the contract but the mint transaction still fails, please check your internet connection.

### Burning of tokens failed
You must have a sufficient balance in order to burn tokens. If your balance is less than the amount of tokens you want to burn then the transaction will fail.


## Authors

Drennix Guerrero @ 201812805@fit.edu.ph

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
