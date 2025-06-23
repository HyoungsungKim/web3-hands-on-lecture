// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/MyToken.sol";

contract DeployMyToken is Script {
    function run() external {
        vm.startBroadcast(); 

        // 초기 공급: 1_000_000 * 10**18 (18 decimals)
        new MyToken(1_000_000 ether);

        vm.stopBroadcast();
    }
}
