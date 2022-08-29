The Snow Computer Club is a program for snow.computer that lets multiple operators combine the power of their access
keys to draw on larger areas of the screen. It comes with an agent that claims the bottom 3x3 tiles.

🏆 The goal is to conquer the bottom left quadrant (4x4) tiles on snow.computer!

Deployed at [0xc001c0de2D7ac3b783D86D59506587383B0438B2](https://polygonscan.com/address/0xc001c0de2d7ac3b783d86d59506587383b0438b2#code)

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

