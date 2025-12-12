# Stacks Builder Challenge - Builder Rewards Contract

A Clarity smart contract deployed on Stacks Mainnet for the Stacks Builder Challenge.

## 🚀 Deployed Contract

- **Contract Name:** `builder-rewards`
- **Network:** Stacks Mainnet
- **Contract ID:** `SP2F500B8DTRK1EANJQ054BRAB8DDKN6QCMXGNFBT.builder-rewards`
- **Clarity Version:** 3
- **Deployment Cost:** 0.044520 STX

## 📋 Contract Overview

The `builder-rewards` contract is a comprehensive reward distribution system built with Clarity 3/4 features, designed to maximize Stacks Builder Challenge rewards by:

- Using new Clarity functions
- Generating user interactions
- Creating fee-generating transactions

## ✨ Features

### Public Functions

- **`claim-daily-reward`** - Users can claim daily rewards from the pool
- **`record-score`** - Track and record user scores
- **`daily-check-in`** - Log daily check-ins for users
- **`fund-rewards`** - Owner function to add STX to the reward pool
- **`toggle-contract-status`** - Owner function to activate/deactivate the contract

### Read-Only Functions

- **`get-user-score`** - Retrieve a user's score
- **`get-total-rewards`** - View total rewards distributed
- **`get-reward-pool`** - Check current reward pool balance
- **`has-user-claimed`** - Check if a user has claimed their reward
- **`get-check-in-count`** - Get the number of check-ins for a user
- **`is-contract-active`** - Check if the contract is active
- **`get-user-display-info`** - Get comprehensive user information

## 🔧 Technology Stack

- **Clarinet** - Smart contract development and testing framework
- **Clarity** - Smart contract language (version 3 with Clarity 4 features)
- **Stacks Blockchain** - Layer 2 blockchain on Bitcoin

## 🌐 View on Explorer

[View Contract on Stacks Explorer](https://explorer.hiro.so/txid/SP2F500B8DTRK1EANJQ054BRAB8DDKN6QCMXGNFBT.builder-rewards?chain=mainnet)

[View Deployer Address](https://explorer.hiro.so/address/SP2F500B8DTRK1EANJQ054BRAB8DDKN6QCMXGNFBT?chain=mainnet)

## 📦 Project Structure

```
stacks-builder-challenge/
├── contracts/
│   └── builder-rewards.clar    # Main smart contract
├── tests/
│   └── builder-rewards.test.ts # Unit tests
├── settings/
│   ├── Devnet.toml             # Devnet configuration
│   ├── Mainnet.toml            # Mainnet configuration (gitignored)
│   └── Testnet.toml            # Testnet configuration (gitignored)
├── Clarinet.toml               # Project manifest
└── package.json                # Node.js dependencies
```

## 🛠️ Development

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) installed
- Node.js and npm

### Setup

```bash
# Clone the repository
git clone https://github.com/Earnwithalee7890/stx-contract-deployment.git
cd stx-contract-deployment

# Install dependencies
npm install

# Check contract syntax
clarinet check

# Run tests
npm test
```

### Local Development

```bash
# Start local devnet
clarinet devnet start

# Run in console mode
clarinet console
```

## 🚀 Deployment

### Generate Deployment Plan

```bash
# For testnet
clarinet deployments generate --testnet --medium-cost

# For mainnet
clarinet deployments generate --mainnet --medium-cost
```

### Deploy to Network

```bash
# Deploy to testnet
clarinet deployments apply --testnet

# Deploy to mainnet
clarinet deployments apply --mainnet
```

## 🏆 Stacks Builder Challenge

This contract is part of the [Stacks Builder Challenge](https://www.stacksbuilderchallenge.com/), a 3-week campaign rewarding top builders on Stacks.

### Challenge Criteria

- ✅ Use of Clarity 4 functions
- ✅ User engagement and interactions
- ✅ Fee generation
- ✅ Public GitHub repository
- ✅ Mainnet deployment

## 📝 License

MIT License

## 🔒 Security

**Important:** Never commit your mnemonic phrase or private keys to version control. The `.gitignore` file is configured to exclude sensitive files:

- `settings/Mainnet.toml`
- `settings/Testnet.toml`
- `deployments/`

## 📞 Contact

Built for the Stacks Builder Challenge

---

**⚠️ Disclaimer:** This contract is provided as-is for educational and demonstration purposes. Use at your own risk.
