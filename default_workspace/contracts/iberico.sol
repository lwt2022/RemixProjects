// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.3/contracts/token/ERC20/ERC20.sol";

contract Iberico is ERC20 {
    mapping(address => mapping(address => uint256)) private _allowances;
    
    constructor() ERC20("Iberico", "IBRC") {
        _mint(msg.sender, 48000 * (10 ** uint256(decimals())));
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20) {
        super._beforeTokenTransfer(from, to, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal virtual override {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

}
