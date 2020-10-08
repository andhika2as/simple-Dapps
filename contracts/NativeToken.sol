// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NativeToken is ERC20 {
    string public name = "NativeToken";
    string public symbol = "NT";
    uint256 public decimals = 2;
    uint256 public INITIAL_SUPPLY = 12000;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}
