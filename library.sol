//SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;

contract LibraryRecord {

    address librarian;
    uint256 currentID = 0;
    uint256 constant startingID = 0;


    struct Student {
        uint8 level;
        address studentAddress;
        string fullname;
        string gender;
    }

    //declare mapping 
    mapping(uint => Student) public studentInfo;

    constructor(address _librarian) {
        librarian = _librarian;
    }
    
    modifier onlylibrarian() {
    require(msg.sender == librarian ,"you are not the librarian");
    _;
    }

    function addToRecord( uint8 _level, address _studentAddress, string memory _fullname, string memory _gender) public {
        studentInfo[currentID] = Student(_level, _studentAddress, _fullname, _gender);
        currentID = currentID + 1; 
        
    }

    function getRecord(uint _index) public view onlylibrarian() returns(Student memory) {
        require(_index < currentID, "limit exceeded");
        Student storage student = studentInfo[_index];
        return student;
    }

    function getAllStudents() public view onlylibrarian() returns(Student[] memory) {
        Student[] memory _students = new Student[](currentID - startingID);
        
        for (uint i = startingID; i < currentID; i++ ){
            Student memory _student = studentInfo[i];
            _students[i] = _student;
        }

        return _students;

    }

}
