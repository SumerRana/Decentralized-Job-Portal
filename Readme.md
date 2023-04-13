Decentralized Job Portal


Job Application and Ratings System on Ethereum Blockchain
Introduction
This technical writeup presents a decentralized job application and ratings system on the Ethereum blockchain using the Solidity programming language. The system consists of three smart contracts: Applicant, Job, and Ratings.

The Applicant contract contains the applicant's data, which includes their name, age, skill, and type of job they are applying for. The Job contract contains job postings, which include the job title, description, qualifications, salary, location, minimum age requirement, required skill, and last date to apply. Finally, the Ratings contract contains ratings given by employers to applicants.

Applicant Contract
The Applicant contract uses an enum to define the type of job an applicant is applying for, and a struct to store the applicant's data. The contract also has a mapping that maps an applicant ID to their data.

The contract has two public functions: addApplicant and getApplicant. The addApplicant function adds a new applicant to the mapping with a unique ID. The getApplicant function returns an applicant's data given their ID.

Job Contract
The Job contract has two structs: JobPosting and jobApplication. The JobPosting struct contains the job posting data, and the jobApplication struct contains the applicant's data.

The contract has a mapping that maps a job ID to a JobPosting struct and another mapping that maps a job ID to an array of jobApplication structs. The contract also has two public functions: postJob and applyForJob. The postJob function posts a new job with a unique ID, and the applyForJob function allows applicants to apply for a job by adding their data to the jobApplications array associated with the job ID.

Ratings Contract
The Ratings contract has a struct called rating that contains the applicant's ID and the employer's rating of the applicant. The contract has a mapping that maps an applicant ID to their rating. The contract has two public functions: addApplicantRating and getApplicantRating. The addApplicantRating function allows employers to add a rating for an applicant, and the getApplicantRating function returns an applicant's rating given their ID.

Conclusion
This job application and ratings system is a decentralized solution for job seekers and employers. It allows job seekers to apply for jobs and for employers to rate applicants in a secure and transparent manner. The system can be extended to include additional features such as job matching algorithms and payment processing.
