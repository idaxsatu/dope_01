// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TimeLockVault - deposit ETH, withdraw only after an unlock time (owner only)
contract TimeLockVault {
    address public immutable owner;
    uint256 public immutable unlockTime;

    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

    error NotOwner();
    error TooEarly(uint256 nowTime, uint256 unlockTime);
    error ZeroAmount();
    error TransferFailed();

    constructor(uint256 _unlockTime) payable {
        require(_unlockTime > block.timestamp, "unlockTime must be in the future");
        owner = msg.sender;
        unlockTime = _unlockTime;

        // Optional: allow funding on deployment
