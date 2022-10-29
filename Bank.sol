// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Bank{

    mapping(address => uint) balances;
    event depositAdded(address _address, uint amount);
    event withdrawAdded(address _address, uint amount);
    

    function deposit() payable public {
        require(msg.value > 0 wei, "You haven't make any deposit");
        balances[msg.sender] += msg.value;

        emit depositAdded(msg.sender, msg.value);
    }

    function withdraw() public {
        require(balances[msg.sender] > 0,"You don't have money to withdraw");
        address payable to = payable(msg.sender);
        uint withdrawed = balances[msg.sender];
        to.transfer(withdrawed);

        emit withdrawAdded(msg.sender, withdrawed);
    }
}