import React, { Component } from "react";
import SplootContract from "./contracts/Sploot.json";
import getWeb3 from "./getWeb3";

import "./App.css";

class App extends Component {
  state = {
    storageValue: 0,
    web3: null,
    accounts: null,
    contract: null,
    totalSupply: 0
  };

  componentDidMount = async () => {
    try {
      // Get network provider and web3 instance.
      const web3 = await getWeb3();

      // Use web3 to get the user's accounts.
      const accounts = await web3.eth.getAccounts();

      // Get the contract instance.
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = SplootContract.networks[networkId];
      const instance = new web3.eth.Contract(
        SplootContract.abi,
        deployedNetwork && deployedNetwork.address,
      );

      // Set web3, accounts, and contract to the state, and then proceed with an
      // example of interacting with the contract's methods.
      this.setState({ web3, accounts, contract: instance }, this.runExample);
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );
      console.error(error);
    }
  };

  runExample = async () => {
    const { accounts, contract } = this.state;

    console.log(contract)
    console.log(accounts)

    await contract.methods.mint().send({ from: accounts[0] });

    // Get the value from the contract to prove it worked.
    const mints = await contract.methods.getOwnerCount(accounts[0]).call();
    const totalSupply = await contract.methods.getOwnerCount(accounts[0]).call();

    // Update state with the result.
    this.setState({ storageValue: mints, totalSupply: totalSupply});
  };

  render() {
    if (!this.state.web3) {
      return <div>Loading Web3, accounts, and contract...</div>;
    }
    return (
      <div className="App">
        <h1>Welcome to sploot NFT dev page</h1>
        <p>I dont really know what is gunna happen here but this is a start.</p>
        <h2>Sploot maybe</h2>
        <p>
          Contract compiled. Please ensure you're on the local branch and not Ethereum mainnet
        </p>
        <h1> MAKE SURE YOUR DEV WALLET IS CONNECTED, NOT MAINNET</h1>
        <p>
          Accept the Metamask transaction on the localhost 9545 chain to mint a token
        </p>
        <div>The number of Sploots you own: {this.state.storageValue}</div>
        <div>The total supply: {this.state.totalSupply}</div>
      </div>
    );
  }
}

export default App;
