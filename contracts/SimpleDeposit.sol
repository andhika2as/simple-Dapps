pragma solidity >=0.4.21 <0.7.0;

contract SimpleDeposit {
    address private owner;
    uint8 public minDeposit = 10;
    uint256 private userCount;

    /// @notice Only the owner can withdraw from this contract
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /// @notice The requested withdrawal amount must be available in the contract balance
    modifier withMinBalance(uint256 amount) {
        require(address(this).balance >= amount + minDeposit);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
    
    /// @notice Allow deposits from anyone
    function() external payable {}
    
    /// @notice Full withdrawal
    function withdraw() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
    
    /// @notice Partial withdrawal
    /// @param amount Amount requested for withdrawal
    function withdraw(uint256 amount) public onlyOwner withMinBalance(amount + minDeposit) {
        msg.sender.transfer(amount);
    }
}