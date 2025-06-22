docker exec -u root -it web3-hands-on_anvil_1 bash

local
'''
anvil --host 0.0.0.0 -p 8545 --mnemonic "test test test test test test test test test test test junk"
'''
 
rpc: http://localhost:8545  
chainid: 31337  