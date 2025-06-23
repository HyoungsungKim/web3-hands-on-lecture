pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title Demo ERC-20 Token
contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("DemoToken", "DTK") {
        _mint(msg.sender, initialSupply);       // 배포자 지갑에 초기 공급
    }
}