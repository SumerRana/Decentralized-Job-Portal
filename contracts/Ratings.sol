//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ratings {
    
    struct rating {
        uint applicantID;
        uint8 appliantRating;
    }

    mapping (uint => rating) public applicantRatings;

    function addApplicantRating(uint _applicantID, uint8 _applicantRating) public returns(string memory){
        require(_applicantRating > 0 && _applicantRating <= 5, "Rating is Invalid");

        rating memory newRating = rating(_applicantID, _applicantRating);
        applicantRatings[_applicantID] = newRating;

        return "Rating added Successfully";
    }

    function getApplicantRating(uint _applicantID) public view returns(uint8) {
        rating storage fetchedRating = applicantRatings[_applicantID];
        return fetchedRating.appliantRating;
    }
}