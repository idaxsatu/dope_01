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
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 initialSupply // whole tokens, e.g. 1_000_000
    ) {
        name = _name;
        symbol = _symbol;

        uint256 mintAmount = initialSupply * (10 ** uint256(decimals));
        totalSupply = mintAmount;
        balanceOf[msg.sender] = mintAmount;

        emit Transfer(address(0), msg.sender, mintAmount);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        require(allowed >= value, "allowance too low");

        // Decrease allowance (standard behavior)
        unchecked {
            allowance[from][msg.sender] = allowed - value;
        }
        emit Approval(from, msg.sender, allowance[from][msg.sender]);

        _transfer(from, to, value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "to is zero address");
        uint256 bal = balanceOf[from];
        require(bal >= value, "balance too low");

        unchecked {
            balanceOf[from] = bal - value;
            balanceOf[to] += value;
        }

        emit Transfer(from, to, value);
    }
}

