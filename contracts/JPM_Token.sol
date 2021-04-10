pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract JPM_Token is ERC20 {
    
    event Bought(uint256 amount);
    event Sold(uint256 amount);
    
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }
    
    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
    
    // User mint 1 JPM Token by transfering 1 ETH
    function buyTokens() public payable {
        require(msg.value == 1 ether, "need 1 Ether!");
        _mint(msg.sender, 1);
    }
    
    // User sell there Token and get Ethers in return
    function sell(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        transfer(address(this), amount);
        payable(msg.sender).transfer(amount*(1 ether));
        emit Sold(amount);
    }
}