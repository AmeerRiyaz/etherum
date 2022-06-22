const contract = require("./build/contracts/HelloWorld.json");
const { ethers } = require("ethers");
const dotenv = require("dotenv")
dotenv.config()
const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;
const url = "http://127.0.0.1:8545"
console.log(JSON.stringify(contract.abi));
//const alchemyProvider = new ethers.providers.AlchemyProvider(network="goerli", API_KEY);
const provider = new ethers.providers.JsonRpcProvider(url);
const signer = new ethers.Wallet(PRIVATE_KEY, provider);
const helloWorldContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);
console.log("here")
async function main() {
    console.log("main")
    const message = await helloWorldContract.setMessage("riyaz");
    console.log("The message is: " + JSON.stringify(message));
    const text = await helloWorldContract.getMessage()
    console.log("output" ,text)
  }
  main();