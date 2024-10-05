# ERC20-contract
This is Metacrafters ETH + AVAX PROOF: Intermediate EVM Course Module 3 assessment to implement a custom ERC20 token. The contract is built using the OpenZeppelin library and includes functionalities for minting, burning, and transferring tokens. Only the contract owner can mint new tokens, while any token holder can burn or transfer tokens.

## Features

- **Minting Tokens**: The contract owner can mint new tokens.
- **Burning Tokens**: Any user can burn their tokens.
- **Transferring Tokens**: Users can transfer tokens to others.
- **Ownership Control**: The contract uses the `Ownable` pattern, which restricts certain functions to the contract owner.
- **Events**: Emits events for minting, burning, and transferring tokens.

## Contract Overview

### Inherited Contracts

The `MyToken` contract inherits from several OpenZeppelin contracts:

1. **ERC20**: Implements the ERC20 standard for fungible tokens.
2. **ERC20Burnable**: Allows token holders to burn (destroy) their tokens.
3. **Ownable**: Provides ownership control, restricting access to certain functions to the owner.

## Functions

### 1. `mint(address to, uint amount)`

This function mints new tokens and assigns them to the specified address. Only the contract owner can call this function.

- **Parameters**:
  - `to`: The address to which the newly minted tokens will be sent.
  - `amount`: The number of tokens to mint.

- **Access Control**:
  - Only the contract owner can call this function (`onlyOwner`).

- **Emits**:
  - `MintToken(to, amount)` event after minting.

### 2. `Burn(uint256 amount)`

This function allows any token holder to burn (destroy) a specific number of tokens from their account.

- **Parameters**:
  - `amount`: The number of tokens to burn.

- **Emits**:
  - `BurnToken(msg.sender, amount)` event after burning.

### 3. `transferto(address to, uint256 amount)`

This function enables users to transfer tokens from their own account to another address.

- **Parameters**:
  - `to`: The address of the recipient.
  - `amount`: The number of tokens to transfer.

- **Returns**:
  - `true` if the transfer is successful.

- **Emits**:
  - `TransferToken(msg.sender, to, amount)` event after transferring.

## Events

The contract emits the following events:

- **MintToken(address to, uint amount)**: Emitted when new tokens are minted.
- **BurnToken(address from, uint amount)**: Emitted when tokens are burned.
- **TransferToken(address from, address to, uint amount)**: Emitted when tokens are transferred.

## How To Use
-  You can use remix- an online solidity compiler to run this Program 
-  Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension.
- Copy and paste the following code into the file.

```
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    event Minted(address to, uint amount);
    event Burned(address  from, uint amount);
    event Transfered(address  from, address to, uint amount);
    
    constructor(uint initialSupply) ERC20("DOTNET", "DOT")Ownable(msg.sender){
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

    function transfertoken(address to, uint256 amount) public  returns (bool) {
        _transfer(msg.sender, to, amount);
        emit Transfered(msg.sender, to, amount);
        return true;
    }

}
```
Compile this contract on the lesft side of remix ,Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar.Then click on the "Deploy" button. Call the `mint()` function to add tokens to a specific address. Make sure to specify a positive amount, or the transaction will fail.

## Authors
Aashish Bhambri
## License
This contract is licensed under the MIT License. See `LICENSE` for more details.
