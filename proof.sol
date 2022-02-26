//SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;


contract LibraryRecord {

    address librarian;
    uint256 ID = 0;


    struct Student {
        uint ID;
        address studentAddress;
        string fullname;
        uint256 level;
        string gender;
    }

    //declare mapping 
    mapping(address => Student) public studentInfo;

    constructor(address _librarian) {
        librarian = _librarian;
    }
    
    modifier onlylibrarian() {
    require(msg.sender == librarian ,"you are not the librarian");
    _;
    }

    function addToRecord(address _studentAddress, string memory _fullname, uint256 _level, string memory _gender) public {
        ID = ID + 1;
        studentInfo[_studentAddress] = Student(ID, _studentAddress, _fullname, _level, _gender);
       
    }

    function getRecord(address _address) onlylibrarian() public view returns(Student memory) {
        Student storage student = studentInfo[_address];
        return student;
    }

    

}