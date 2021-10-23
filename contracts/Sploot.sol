pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import { Base64 } from "./Base64.sol";

contract Sploot is ERC721, Ownable {
  // Max and total supply
  uint public maxSupply = 100;
  uint internal totalSupply = 0;

  struct Splooter {
    string name;
    uint speed;
    uint stamina;
    uint strength;
    uint aggression;
    uint creativity;
    uint luck;
    uint focus;
    uint influence;
    uint agility;
    string phobia;
    string[] vices;
    string role;
    string personality;
    string class;
    string affinity;
  }

  mapping(uint => Splooter) tokenToSplooter;

  // Owner of the Colors contract (msg.sender)
  address contractOwner;

  constructor() ERC721("SPLOOT", "SPLOOT") {
    contractOwner = msg.sender;
  }

  function mint() public {
    _safeMint(msg.sender, totalSupply);
    totalSupply++;
  }

  /* function setSplooter(
    uint tokenId,
    string memory name,
    uint speed,
    uint stamina,
    uint strength,
    uint aggression,
    uint creativity,
    uint luck,
    uint focus,
    uint influence,
    uint agility,
    string memory phobia,
    string[] memory vices,
    string memory role,
    string memory personality,
    string memory class,
    string memory affinity
    ) public onlyOwner() {
      tokenToSplooter[tokenId] = Splooter(
        name,
        speed,
        stamina,
        strength,
        aggression,
        creativity,
        luck,
        focus,
        influence,
        agility,
        phobia,
        vices,
        role,
        personality,
        class,
        affinity
        );
  } */

  function getIdOwner(uint _tokenId) public view returns(address) {
    return ownerOf(_tokenId);
  }

  // Utils
  function getOwnerCount(address account) public view returns (uint) {
    return balanceOf(account);
  }

  function getTotalSupply() public view returns (uint) {
    return totalSupply;
  }
}
