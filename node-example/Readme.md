# Run a TLChain Validator
## Setting up a node
```
1. git clone https://github.com/TLChainDev/TLChain.git
```
2. Copy source form node-example to root folder
```
cd TLChain
cp -r node-example/ /root/
```
3. Create an Account

```
cd /root/TLChain
./openethereum account new --chain ./spec/spec.json --keys-path ./nodes/validator//keys
```
Returned address like that 0x00aa39d30f0d20ff03a22ccfc30b7efbfca597c2

Copy result address to mode.toml
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

6. Wait for 1 cycle (approximately 48 hours).

    Wait until the next cycle gets started.
