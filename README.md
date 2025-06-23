0. setup_web3_env.sh 참고
- Debian 전용
- 중간에 foundry 설치 오류시 직접 설치 필요

```
Detected your preferred shell is bash and added foundryup to PATH.
Run 'source /***/***/.bashrc' or start a new terminal session to use foundryup.
Then, simply run 'foundryup' to install Foundry.
```

1. Frontend setup
```
cd frontend
npm install
npx http-server .
```

1. Testnet setup
```
anvil --host 0.0.0.0 -p 8545 --mnemonic "test test test test test test test test test test test junk"
```

2. Connect tesstnet to metamask
rpc: http://localhost:8545  
chainid: 31337

3. Install OpenZeppelin
```
forge install OpenZeppelin/openzeppelin-contracts
```