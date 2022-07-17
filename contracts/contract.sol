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
    uint256 id;
    string title;
    string content;
    address author;
    uint256[] issues;
    uint256 votesPositive;
    uint256 votesNegative;
    bool isVerified;
    //time of creation
    uint256 creationTime;
}

contract Pedia {
    mapping(uint256 => Record) public records;
    uint256[] public recordIDs;

    function addRecord(
        string memory _title,
        string memory _content,
        address _author
    ) public {
        uint256[] memory issue = new uint256[](0);
        //time now
        uint256 time = block.timestamp;
        Record memory record = Record(
            recordIDs.length,
            _title,
            _content,
            _author,
            issue,
            0,
            0,
            false,
            time
        );
        recordIDs.push(record.id);
        records[record.id] = record;
    }

    function voteNegative(
        uint256 _recordID,
        string memory _title,
        string memory _content,
        address _author
    ) public {
        uint256[] memory issue = new uint256[](0);
        //time now
        uint256 time = block.timestamp;
        Record memory record = Record(
            recordIDs.length,
            _title,
            _content,
            _author,
            issue,
            0,
            0,
            false,
            time
        );
        recordIDs.push(record.id);
        records[_recordID].issues.push(record.id);
        records[_recordID].votesNegative++;
    }

    function votePositive(uint256 _recordID) public {
        records[_recordID].votesPositive++;
    }
}
