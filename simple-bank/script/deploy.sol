// SPDX-License-Identifier: MIT
// forge build
// forge script ./deploy.sol:DeploySimpleBank --rpc-url http://localhost:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/SimpleBank.sol";

contract DeploySimpleBank is Script {
    function run() external {
        vm.startBroadcast(); // ← anvil 계정으로 트랜잭션 브로드캐스트
        new SimpleBank();    // ← 배포
        vm.stopBroadcast();
    }
}

// Build 후 out/src/SimpleBank.sol/SimpleBank.json 파일에 배포된 컨트랙트 주소가 기록됨
// deploy 후 생성된 contract 주소 확인 및 복사