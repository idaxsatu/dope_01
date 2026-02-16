// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MiniERC20 - a simple ERC-20 style token (educational)
contract MiniERC20 {
    string public name;
    string public symbol;
    uint8 public immutable decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
