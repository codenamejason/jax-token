//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

/// @title JaxToken
/// @author @codenamejason <jax@jaxcoder.xyz>
contract JaxToken is Ownable, ERC20, ERC20Permit, ERC20Votes {
	constructor(address _owner) ERC20("JaxToken", "JAX") ERC20Permit("JaxToken") {
		// Mint 100 million tokens to the contract creator
		_mint(_owner, 100000000 * 10**decimals());
		_transferOwnership(_owner);
	}

	function mint(address _to, uint256 _amount) public onlyOwner {
		_mint(_to, _amount);
	}

	function burn(address _from, uint256 _amount) public onlyOwner {
		_burn(_from, _amount);
	}

	/// @notice Override the parent implementation to add a post-hook after any transfer
	function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._burn(account, amount);
    }

	/**
	 * Function that allows the contract to receive ETH
	 */
	receive() external payable {}
}
