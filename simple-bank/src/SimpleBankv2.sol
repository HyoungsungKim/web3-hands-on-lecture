// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/// @title SimpleBankV2 — ETH + 하나의 ERC-20 토큰 보관 예제
contract SimpleBankV2 {
    using SafeERC20 for IERC20;

    /* ─────────────── 설정 ─────────────── */
    IERC20 public immutable token;           // 예: MyToken(“DTK”)

    /* ─────────────── 상태 저장 ─────────────── */
    mapping(address => uint256) private ethBalances;
    mapping(address => uint256) private tokenBalances;

    /* ─────────────── 이벤트 ─────────────── */
    event DepositETH   (address indexed user, uint256 amt);
    event WithdrawETH  (address indexed user, uint256 amt);
    event DepositToken (address indexed user, uint256 amt);
    event WithdrawToken(address indexed user, uint256 amt);

    /* ─────────────── 생성자 ─────────────── */
    constructor(IERC20 _token) {
        token = _token;
    }

    /* ─────────────── ETH 입출금 ─────────────── */
    function deposit() external payable {
        ethBalances[msg.sender] += msg.value;
        emit DepositETH(msg.sender, msg.value);
    }

    function withdraw(uint256 amountWei) external {
        require(ethBalances[msg.sender] >= amountWei, "ETH balance too low");
        ethBalances[msg.sender] -= amountWei;
        payable(msg.sender).transfer(amountWei);
        emit WithdrawETH(msg.sender, amountWei);
    }

    /* ─────────────── Token 입출금 ─────────────── */
    function depositToken(uint256 amount) external {
        // 사용자는 먼저 approve 필요
        token.safeTransferFrom(msg.sender, address(this), amount);
        tokenBalances[msg.sender] += amount;
        emit DepositToken(msg.sender, amount);
    }

    function withdrawToken(uint256 amount) external {
        require(tokenBalances[msg.sender] >= amount, "Token balance too low");
        tokenBalances[msg.sender] -= amount;
        token.safeTransfer(msg.sender, amount);
        emit WithdrawToken(msg.sender, amount);
    }

    /* ─────────────── 조회 함수 ─────────────── */
    function ethBalanceOf(address user) external view returns (uint256) {
        return ethBalances[user];
    }

    function tokenBalanceOf(address user) external view returns (uint256) {
        return tokenBalances[user];
    }

    /// @notice 본인 잔액 편리 조회
    function myEth() external view returns (uint256) {
        return ethBalances[msg.sender];
    }

    function myToken() external view returns (uint256) {
        return tokenBalances[msg.sender];
    }
}