//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Job {
    struct JobPosting {
        address employer;
        string JobTitle;
        string JobDescription;
        string RequiredQualifications;
        uint16 Salary;
        string Location;
        uint8 minimumAge;
        string requiredSkill;
        string LastDate;
    }

    struct jobApplication {
        uint applicantID;
        string name;
        uint8 age;
        string skill;
    }

    mapping (uint => JobPosting) JobList;
    mapping (uint => jobApplication[]) jobApplications;

    JobPosting[] public Jobs;
    uint public jobId;
    uint public applicationId;

    function postJob(
        address _employer,
        string memory _JobTitle,
        string memory _JobDescription,
        string memory _RequiredQualifications,
        uint16 _Salary,
        string memory _Location,
        uint8 _minimumAge,
        string memory _requiredSkill,
        string memory _LastDate
        )
        public returns(uint, string memory) {
            jobId ++;

            JobList[jobId] = JobPosting(
            _employer,
            _JobTitle,
            _JobDescription,
            _RequiredQualifications,
            _Salary,
            _Location,
            _minimumAge,
            _requiredSkill,
            _LastDate);
            return(jobId, "Job Posted Successfully");
        }

    function getJob(uint _JobId) public view returns(
        string memory JobTitle,
        string memory JobDescrition,
        string memory RequiredQualifications,
        uint16 Salary,
        string memory Location,
        uint8 minimumAge,
        string memory requiredSkill,
        string memory LastDate
    ) {
        JobPosting storage JobPost = JobList[_JobId];
        return (
        JobPost.JobTitle, 
        JobPost.JobDescription, 
        JobPost.RequiredQualifications,
        JobPost.Salary,
        JobPost.Location,
        JobPost.minimumAge,
        JobPost.requiredSkill,
        JobPost.LastDate
        );

    }

    function applyForJob(
        uint _applicantID,
        uint _jobId,
        string memory _name,
        uint8 _age,
        string memory _skill
        ) public returns (string memory, uint) {

            applicationId ++;
            require(_applicantID >0, "Invalid Input application id" );
            require(_jobId <= jobId, "Invalid Job ID");

            JobPosting storage JobPost =  JobList[_jobId];
            require(_age >= JobPost.minimumAge, "Underage candidate");
            require(keccak256(abi.encodePacked(_skill)) == keccak256(abi.encodePacked(JobPost.requiredSkill)), "Skills do not match");

            jobApplication memory newApply = jobApplication(_applicantID, _name, _age, _skill);
            jobApplications[_jobId].push(newApply);

            return ("Application successfull",applicationId);

        }


}


 