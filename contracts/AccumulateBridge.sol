// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./WrappedToken.sol";

contract AccumulateBridge is Ownable {

    constructor() {}

    function transferTokenOwnership(WrappedToken token, address newOwner) public onlyOwner {
        token.transferOwnership(newOwner);
    }

    function renounceTokenOwnership(WrappedToken token) public onlyOwner {
        token.renounceOwnership();
    }

    function mint(WrappedToken token, address to, uint256 amount) public onlyOwner {
        token.mint(address(to), amount);
    }

    function burn(WrappedToken token, string memory destination, uint256 amount) public virtual {
        token.transferFrom(address(msg.sender), address(this), amount);
        token.burn(amount);
    }

}