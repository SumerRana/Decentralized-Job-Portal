//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Applicant {
    enum ApplicantType {
        FullTime,
        partTime,
        gigWork,
        Internship
    }

    struct applicant {
        string name;
        uint8 age;
        string skill;
        ApplicantType applicantType;
    }

    mapping (uint => applicant) Application;
    uint applicantID;

    function addApplicant(string memory _name, uint8 _age, string memory _skill, uint _ApplicantType) public {
        applicantID ++;
        Application[applicantID] = applicant(_name, _age, _skill, ApplicantType(_ApplicantType));
    }

    function getApplicant(uint _applicationId) public view returns(string memory, uint8, string memory, string memory){
        applicant storage application = Application[_applicationId];
        return (application.name, application.age, application.skill, applicationTypeString(application.applicantType));
    }
    
    function getApplicantType(uint _applicationId) public view returns(string memory) {
        applicant storage application = Application[_applicationId];
        return (applicationTypeString(application.applicantType));
    }

    function applicationTypeString(ApplicantType _applicantType) pure private returns(string memory) {
        if (_applicantType == ApplicantType.FullTime) {
            return "Full Time";
        }
        else if (_applicantType == ApplicantType.partTime) {
            return "Part Time";
        }
        else if (_applicantType == ApplicantType.gigWork) {
            return "Gig Work";
        }
        else if (_applicantType == ApplicantType.Internship) {
            return "Internship";
        }
        else {
        return "Something else";
        }

    }
}