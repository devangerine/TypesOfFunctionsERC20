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
