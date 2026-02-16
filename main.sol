// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TimeLockVault - deposit ETH, withdraw only after an unlock time (owner only)
contract TimeLockVault {
    address public immutable owner;
    uint256 public immutable unlockTime;

    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

