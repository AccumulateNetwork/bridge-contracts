// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./WrappedToken.sol";

contract AccumulateBridge is Ownable {

    constructor() {}

    event LogTransferTokenOwnership(WrappedToken _token, address _newOwner);
    event LogRenounceTokenOwnership(WrappedToken _token);
    event LogMint(WrappedToken token, address to, uint256 amount);
    event LogBurn(WrappedToken token, string destination, uint256 amount);

    function transferTokenOwnership(WrappedToken token, address newOwner) public onlyOwner {
        token.transferOwnership(newOwner);
        emit LogTransferTokenOwnership(token, newOwner);
    }

    function renounceTokenOwnership(WrappedToken token) public onlyOwner {
        token.renounceOwnership();
        emit LogRenounceTokenOwnership(token);
    }

    function mint(WrappedToken token, address to, uint256 amount) public onlyOwner {
        token.mint(to, amount);
        emit LogMint(token, to, amount);
    }

    function burn(WrappedToken token, string memory destination, uint256 amount) public virtual {
        token.transferFrom(address(msg.sender), address(this), amount);
        token.burn(amount);
        emit LogBurn(token, destination, amount);
    }

}