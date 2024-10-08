// https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/S16_NFTReentrancy_en/NFTReentrancy.sol

// SPDX-License-Identifier: MIT
// By 0xAA
// English translation by 22X
pragma solidity ^0.8.21;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// NFT contract built from openzeppelin ERC721
contract CustomNFT is ERC721 {
    uint256 public totalSupply;
    mapping(address => bool) public mintedAddress;
    // Constructor to initialize the name and symbol of the NFT collection
    constructor() ERC721("Custom NFT", "ReNFT"){}

    // Mint function, each user can only mint 1 NFT
    // Contains a reentrancy vulnerability
    function mint() payable external {
        // Check if already minted
        require(mintedAddress[msg.sender] == false);
        // Increase total supply
        totalSupply++;
        // Mint the NFT
        _safeMint(msg.sender, totalSupply);
        // Record the minted address
        mintedAddress[msg.sender] = true;
    }
}