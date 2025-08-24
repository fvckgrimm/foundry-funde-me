## Foundry Fund Me 

# About 

This is a minimal project allowing users to fund the contract owner with donations. The smart contract accepts ETH as donations, denominated in USD. Donations have a minimal USD value, otherwise they are rejected. The value is priced using a Chainlink price feed, and the smart contract keeps track of doners in case they are to be rewarded in the future.

# Requirements

- [foundry](https://getfoundry.sh/)

# Quickstart

```bash
git clone https://github.com/fvckgrimm/foundry-funde-me
cd foundry-funde-me
make
```

# Deploy

```bash
forge script script/DeployFundMe.s.sol
```
