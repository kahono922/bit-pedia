// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/// @title Verified medical pedia

//struct for records


//how it should work
//A record is created by anyone
//People view the record and either vote positive or negative
//if someone votes negative, they should add a sub record describing why they voted negative
//if the sub record gets verified, the record is deleted
//<not sure how to determine if the record is verified>
//<pretty sure its not the best way to do it>
struct Record {
        string title;
        string content;
        address author;
        string[] issues;
        uint votesPositive;
        uint votesNegative;
        bool isVerified;
}


contract Pedia {
    mapping(uint256 => Record) public records;
      mapping(address => uint256) public recordCount;
      string[] public issue;

      function createRecord(string memory _title, string memory _content, address _author) public {
            Record memory record = Record(_title, _content, _author,issue, 0, 0, false);
            records[recordCount[_author]] = record;
      }
}