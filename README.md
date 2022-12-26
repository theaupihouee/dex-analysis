# DEX Analysis 

**Dune Analytics dashboard that I have created : https://dune.com/tassergal/dex-analysis**

All visualizations were built using Dune databases and the SQL queries listed in this repo 

The dashboard is structured around 3 main topics : 
1) **Active users** : unique adresses in the last day, week, year, etc. 
2) **Volume** : volume in the last day, week; market shares by volume, etc. 
3) **Transactions** : transactions in the last day, week; daily average amount per transaction; market share by transaction, etc. 

## About Dune Analytics

[Dune Analytics](https://dune.com/home) is a blockchain data tool for crypto analysts and investors. It allows users to query, extract, and visualize data from different public blockchains (Ethereum, BNB Chain, Gnosis Chain, Polygon, and Optimism) 

The biggest advantage of Dune is that on-chain data is made easily accessible. The platform has a SQL editor that allows to write queries and build dashboards freely available to anyone. Dune supplies data from Ethereum Virtual Machine (EVM) compatible chains in two forms: raw and decoded. Accessing decoded data is straight-forward and the data tables used in this project are all decoded 

## About Decentralized Exchanges 

Decentralized exchanges, also known as DEXs, are peer-to-peer marketplaces where cryptocurrency traders make transactions directly without handing over management of their funds to an intermediary or custodian. These transactions are facilitated through the use of smart contracts. 

Popular decentralized exchanges (such as Uniswap, Curve, Sushiswap, Balancer, etc.) have been built on top of leading blockchains that support smart contracts. They are built on top of layer-one protocols, meaning that they are built directly on the blockchain. The most popular DEXs are built on the Ethereum blockchain.

The most popular DEX mechanism is the **automated market maker** system, which solves liquidity problems. Instead of matching buy orders and sell orders, the smart contracts of these decentralized exchanges use pre-funded pools of assets known as **liquidity pools**. The pools are funded by other users who are then entitled to the transaction fees that the protocol charges for executing trades on that pair. These liquidity providers need to deposit an equivalent value of each asset in the trading pair to earn interest on their cryptocurrency holdings, a process known as liquidity mining. The use of liquidity pools allows traders to execute orders or to earn interest in a permissionless and trustless way. These exchanges are often ranked according to the amount of funds locked in their smart contracts called total value locked (TVL)

More on DEX [here](https://cointelegraph.com/defi-101/what-are-decentralized-exchanges-and-how-do-dexs-work) 
