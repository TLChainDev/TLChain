# Run a TLChain Validator
## Setting up a node
```
git clone https://github.com/TLChainDev/TLChain.git
```
2. Copy source form node-example to root folder
```
cd TLChain
cp -r node-example/ /root/
```
3. Create an Account

```
cd /root/node-example/TLChain
./openethereum account new --chain ./spec/spec.json --keys-path ./nodes/validator//keys
```
Returned address like that 0x00aa39d30f0d20ff03a22ccfc30b7efbfca597c2
```
cd nodes/validator/
vi node.toml
```
Copy result address to node.toml
Ex:
```
...
[account]
unlock = ["0x00aa39d30f0d20ff03a22ccfc30b7efbfca597c2"]
password = ["password"]

[mining]
force_sealing = true
engine_signer = "0x00aa39d30f0d20ff03a22ccfc30b7efbfca597c2"
reseal_on_txs = "none"
...
```
Update also the password on node.pwd in the same folder
4. Run the authority nodes
```
./openethereum --config ./nodes/validator/node.toml

```
5. Stake

    Stake

    To stake TLC coin, all you should do is sending your TLC coin to the TLChain Consensus contract address over the TLChain network from the validator address.
    The TLChain Consensus contract address: 0xc7DfDF919864844943628c2C150F67829327C90E
    The easiest way to do so, is to import your private key or key-store file to your favourite wallet (for example Metamask), switch network to TLChain and send the TLC coin to the Consensus contract address.

    You can find your key-store (containing your private key) and the password for the created account in:
    /TLChain/nodes/validator/keys/TLChain/UTC--xxxx
    /TLChain/nodes/validator/node.pwd

    
Step 1: Install python3. like ```apt get install python3```

Step 2: Install python pip like ```apt get install python3-pip```

Step 3: Install web3 pip ```pip3 install w3```

Step 4: Create a python script to decrypt the file ```touch decrypt.py```

Step 5: Edit the file ```vi decrypt.py``` and add this code

```
from web3.auto import w3
with open("/root/TLChain/nodes/validator/keys/TLChain/UTC--xxxx") as keyfile:
 encrypted_key = keyfile.read()
 private_key = w3.eth.account.decrypt(encrypted_key, 'password') # you need to modify this with your password

import binascii
print("This is your private key: ")
print(binascii.b2a_hex(private_key))
```

6. Wait for 1 cycle (approximately 48 hours).

    Wait until the next cycle gets started.
