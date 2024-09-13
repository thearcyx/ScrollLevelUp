// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Define your ERC20 token contract
contract MyToken is ERC20 {
    // Define the global variables for balances, total supply, name, and symbol below
    uint256 _totalSupply;
    string _name;
    string _symbol;

    // Constructor that mints the initial supply to the deployer of the contract
    constructor(uint256 initialSupply, string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint the initial supply of tokens to the deployer's address
        _name = name;
        _symbol = symbol;
        _totalSupply = initialSupply;
        
        _mint(msg.sender, initialSupply);
    }

    // Function to mint new tokens to a specified address
    function mint(address to, uint256 amount) public {
        // Implement the mint function using the _mint internal function
        _mint(to, amount);
    }

    // Function to burn tokens from a specified address
    function burn(address from, uint256 amount) public {
        // Implement the burn function using the _burn internal function
        _burn(from, amount);
    }

    // Function to transfer tokens from the caller's address to a specified address
    function transfer(address to, uint256 amount) public override returns (bool) {
        // Implement the transfer function using the _transfer internal function
        _transfer(msg.sender, to, amount);
        return true;
    }

    // Function to approve an address to spend a certain amount of tokens on behalf of the caller
    function approve(address spender, uint256 amount) public override returns (bool) {
        // Implement the approve function using the _approve internal function
        _approve(msg.sender, spender, amount);
        return true;
    }

    // Function to transfer tokens from one address to another using an allowance
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        // Implement the transferFrom function using the _transfer and _approve internal functions
        _approve(from, msg.sender, amount);
        _transfer(from, to, amount);
        return true;
    }

    function getBalanceOf(address account) public view returns (uint256) {
        // Implement the getBalanceOf function
        return balanceOf(account);
    }
}
