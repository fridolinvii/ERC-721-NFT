// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
 
contract newNFT is ERC721 {
 
  using Strings for uint; // Allows to convert uints to strings

  address ownerOfContract;
  constructor() ERC721("Example Token", "Token") {
      // The person deploying the Contract can only mint new Tokens
      ownerOfContract = msg.sender;

  }
    

  // Here you mint the token  
  function mint(address _to, uint256 _tokenId) external onlyOwner {

    _safeMint(_to, _tokenId);

  }

  // uncomment this, if you want to add the burn option. Owner of token can burn it
  //function burn(uint _tokenId) external {
//    _burn(_tokenId);
//  }

    // If you need to add manually the URI: for each token different file
    function tokenURI(uint tokenId) public view override returns (string memory output) {
      // you should use ipfs instead of github
       output = "https://gist.githubusercontent.com/fridolinvii/bf7ef19ad7d0bce9c949ee3562f30433/raw/f20b5defe90df4610b7858f1b0b1528a951d1de2/";
       output = string(abi.encodePacked(output,tokenId.toString()));
       output = string(abi.encodePacked(output,".json"));
    }


    // Only owner can mint contract
    modifier onlyOwner() {
        require(ownerOfContract == msg.sender, "Not Owner of Contract");
        _;
    }

}