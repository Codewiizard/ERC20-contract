// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    event Minted(address to, uint amount);
    event Burned(address  from, uint amount);
    event Transfered(address  from, address to, uint amount);
    
    constructor(uint initialSupply) ERC20("MyToken", "MTK")Ownable(msg.sender){
        _mint(msg.sender,initialSupply);
    }

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
        emit Minted(to, amount);
    }

    function burn(uint amount) public {
        _burn(msg.sender, amount);
        emit Burned(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        emit Transfered(msg.sender, to, amount);
        return true;
    }

}