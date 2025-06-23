// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleBank {
    /* ────────────────  State ──────────────── */
    mapping(address => uint256) private balances;     // 잔액 테이블 (private → 전용 getter 정의)
    event Deposit(address indexed user, uint256 amt); // 입금 이벤트
    event Withdraw(address indexed user, uint256 amt);

    /* ────────────────  Write  ──────────────── */
    function deposit() external payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "balance too low");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    /* ────────────────  Read  ──────────────── */
    /// @notice 해당 주소의 현재 잔액을 조회 (mapping read)
    function balanceOf(address user) external view returns (uint256) {
        return balances[user];
    }

    /// @notice 본인 잔액을 편하게 조회
    function myBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}