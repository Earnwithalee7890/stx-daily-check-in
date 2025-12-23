# Weekly Badges Deployment Instructions

## Contract Address Configuration

**IMPORTANT:** Before the badge system works, you must:

1. **Deploy the contract** `weekly-badges.clar` to Stacks mainnet via Hiro Platform

2. **Update the contract address** in TWO files:
   - `components/ClientPage.tsx` (line ~150): Change `BADGE_CONTRACT_ADDRESS`
   - `components/BadgesPage.tsx` (line 68): Change the `contractAddress`

3. **Deploy to mainnet:** Replace `SP2F500B8DTRK1EANJQ054BRAB8DDKN6QCMXGNFBT` with your actual contract deployment address

## Current Status
- ✅ Contract code ready (`contracts/weekly-badges.clar`)
- ✅ UI integrated into dashboard
- ⏳ Waiting for contract deployment
- ⏳ Waiting for address update

## After Deployment
1. Copy your deployed contract address from Hiro Platform
2. Replace the placeholder address in both files
3. Commit and push the changes
4. Users can start earning badges!

## Fee Structure
- Each badge costs **0.01 STX** (u10000 microSTX)
- Fees go to: `SP2F500B8DTRK1EANJQ054BRAB8DDKN6QCMXGNFBT` (change this in contract before deployment!)
