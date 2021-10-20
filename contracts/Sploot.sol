pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import { Base64 } from "./Base64.sol";



contract Sploot is ERC721, Ownable {
  // Max and total supply
  uint public maxSupply = 100;
  uint internal totalSupply = 0;

  // Owner of the Colors contract (msg.sender)
  address contractOwner;

  constructor() ERC721("SPLOOT", "SPLOOT") {
    contractOwner = msg.sender;
  }

  function mint() public {
    _safeMint(msg.sender, totalSupply);
    totalSupply++;
  }

  // Utils
  function getOwnerCount(address account) public view returns (uint) {
    return balanceOf(account);
  }

  function getTotalSupply() public view returns (uint) {
    return totalSupply;
  }
}
