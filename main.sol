// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MiniERC20 - a simple ERC-20 style token (educational)
contract MiniERC20 {
    string public name;
    string public symbol;
    uint8 public immutable decimals = 18;

    uint256 public totalSupply;
