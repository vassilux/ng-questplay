// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Doubloon.sol";

contract MintableDoubloon is Doubloon {
    address public owner;

    constructor(uint256 _supply) Doubloon(_supply) {
        owner = msg.sender; 
    }

    function mint(address _to, uint256 _amount) external {
        require(
            msg.sender == owner,
            "Only owner is allowed"
        );

        uint256 mintAmount = _amount; 
        totalSupply += mintAmount; 
        balanceOf[_to] += mintAmount; 
        emit Transfer(address(0), _to, mintAmount); 
    }
}