// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageSystem {
    uint256 private storedData;
    address public owner;

    event DataUpdated(uint256 oldValue, uint256 newValue, address updatedBy);

    constructor(uint256 initialValue) {
        storedData = initialValue;
        owner = msg.sender;
    }

    function store(uint256 newValue) public {
        require(msg.sender == owner, "Only owner can update data");
        uint256 oldValue = storedData;
        storedData = newValue;
        emit DataUpdated(oldValue, newValue, msg.sender);
    }

    function retrieve() public view returns (uint256) {
        return storedData;
    }
}