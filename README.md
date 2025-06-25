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

4. Explore
```
docker run -d --rm \
  --name otterscan \
  -p 5100:80 \
  --env OTTERSCAN_CONFIG='{
    "erigonURL":  "http://127.0.0.1:8545",
    "assetsURLPrefix": "http://127.0.0.1:5175",

    "chainInfo": {
      "chainId": 31337,                
      "name": "Anvil Local",
      "nativeCurrency": {
        "name": "Anvil Ether",
        "symbol": "aETH",
        "decimals": 18
      },
      "faucets": []
    },

    "branding": {
      "siteName": "My Otterscan",
      "networkTitle": "Dev Network"
    }
  }' \
  otterscan/otterscan:latest

```