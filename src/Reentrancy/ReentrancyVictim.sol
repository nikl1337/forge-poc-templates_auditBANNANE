pragma solidity ^0.8.13;

contract ReentrancyVictim {
    mapping(address => uint256) balance;

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw() external {
        msg.sender.call{value: balance[msg.sender]}("");
        balance[msg.sender] = 0;
    }
}