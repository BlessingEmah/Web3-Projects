//SPDX -License-Identifier: MIT

pragma solidity >0.7.0 <0.9.0;

contract Namevariable {

    string public name = "Blessing";

    function myName() public view returns(string memory) {
        return name;
    }

}
