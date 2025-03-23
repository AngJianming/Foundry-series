// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableToken {
    address public owner;
    bool public paused;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    // 1️⃣ Modifier to allow only the owner to call the function
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // 2️⃣ Modifier to check if the contract is not paused
    modifier notPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    // 3️⃣ Apply the notPaused modifier to the transfer function
    function transfer(address to, uint amount) public notPaused {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
