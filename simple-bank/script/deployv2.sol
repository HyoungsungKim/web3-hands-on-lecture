// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// forge script ./deployv2.sol:DeploySimpleBankV2 --rpc-url http://localhost:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

import "forge-std/Script.sol";
import "../src/SimpleBankv2.sol";
import "../src/MyToken.sol";

contract DeploySimpleBankV2  is Script {
    function run() external {
        vm.startBroadcast(); 

        // 초기 공급: 1_000_000 * 10**18 (18 decimals)
        MyToken token = new MyToken(1_000_000 ether);

        // SimpleBankV2 배포 (토큰 주소 주입)
        new SimpleBankV2(token);

        vm.stopBroadcast();
    }
}
