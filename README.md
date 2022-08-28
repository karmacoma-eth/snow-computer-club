![the room](https://snow.computer/room.png)

This is a Foundry template for WINTΞR's on-chain generative Snow computer.

Alternatives:
- [hardhat template by 0xMoJo7](https://github.com/0xMoJo7/snowComputerHardhat)

## About

The Snow computer is deployed at [0xF53D926c13Af77C53AFAe6B33480DDd94B167610](https://polygonscan.com/address/0xf53d926c13af77c53afae6b33480ddd94b167610)
- call `becomeOperator` with an existing or new Snow program to get an access key
- you can call `storeProgram` at any time to update your Snow program
- a script calls `tick` every 5 min, which runs every program with a 50k gas stipend

Examples:
* `Sprite`, deployed at [0x7C4Cf2b32aD9AEde63C9f30b0349b1FA130A6b0d](https://polygonscan.com/address/0x7C4Cf2b32aD9AEde63C9f30b0349b1FA130A6b0d#code)
* `Chaos` and `Invertor` [gist](https://gist.github.com/w1nt3r-eth/eac0d0a4ae1fb8795f031ca580a40717)
* `Oighty` at [0x476920b3cf1B893F641745cDc8D30DfF55DD0920](https://polygonscan.com/address/0x476920b3cf1B893F641745cDc8D30DfF55DD0920#code)
* `Karma's Bit Reverter` at [0x33d677DAD659fB83B5F8dC16C7A01f82a619FBC1](https://polygonscan.com/address/0x33d677DAD659fB83B5F8dC16C7A01f82a619FBC1#code)

Reference:
* https://snow.computer/operators
* `SnowV1` deployed at [0x7B07afdD4b384B36DFadF4654B19932dc9164Bd6](https://polygonscan.com/address/0x7b07afdd4b384b36dfadf4654b19932dc9164bd6#code)


## Getting started

### Install foundry

```sh
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

More at [The Foundry Book](https://book.getfoundry.sh/getting-started/installation)

### Install dependencies

```sh
git submodule update --init --recursive
```

### Build

```sh
forge build
```

### Test

```sh
forge test -vvv
```

### Deploy

```sh
forge script script/SnowProgram.s.sol --broadcast --sender $ETH_FROM --rpc-url $RPC_URL
```

RTFM:
- [The Foundry Book's tutorial on Solidity scripting](https://book.getfoundry.sh/tutorials/solidity-scripting#deploying-our-contract) has an example to deploy contracts with scripts
- [forge script wallet options](https://book.getfoundry.sh/reference/forge/forge-script?highlight=mnemonic#wallet-options---raw) to specify a private key, mnemonic or hardware wallet


### Verify

```sh
forge script script/SnowProgram.s.sol --verify --etherscan-api-key $ETHERSCAN_API_KEY --rpc-url $RPC_URL
```

