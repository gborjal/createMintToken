// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BigCatCoin is ERC20, Ownable {
    event TransferredToken(address indexed sender,address indexed reciever, uint256 amount);
    constructor (uint256 initialSupply) ERC20("BigCatCoin","BCC") Ownable(msg.sender){
        _mint(msg.sender,initialSupply * (10 ** decimals()));
    }

    function mint(address to, uint256 amount) onlyOwner  public {
        _mint(to, amount * (10 ** decimals()));
    }
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount * (10 ** decimals()));
        emit TransferredToken(_msgSender(), recipient, amount * (10 ** decimals()));
        return true;
    }
    function burn(uint256 amount) public {
        _burn(_msgSender(), amount * (10 ** decimals()));
    }
}