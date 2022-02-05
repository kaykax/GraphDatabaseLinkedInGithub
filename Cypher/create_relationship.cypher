//profile - title
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MATCH (Profile:Profile{profileID: row.profileID})
MATCH (Title:Title{titleName: row.jobTitle})
MERGE (Profile)-[pt:WORKS_AS]->(Title)
    ON CREATE SET pt.titleName = row.jobTitle;
    
//profile - company
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MATCH (Profile:Profile{profileID: row.profileID})
MATCH (Company:Company {companyName: row.company})
MERGE (Profile)-[pc:WORKS_AT]->(Company)
    ON CREATE SET pc.companyName = row.company;
    
//profile - school
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MATCH (Profile:Profile{profileID: row.profileID})
MATCH (School:School {schoolName: row.school})
MERGE (Profile)-[ps:GRADUATED_FROM]->(School)
    ON CREATE SET ps.schoolName = row.school;
    
//profile - location
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MATCH (Profile:Profile{profileID: row.profileID})
MATCH (Location:Location {locationName: row.location})
MERGE (Profile)-[pl:LIVES_IN]->(Location)
    ON CREATE SET pl.locationName = row.location;
    
//profile - degree
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MATCH (Profile:Profile{profileID: row.profileID})
MATCH (Degree:Degree {degreeName: row.schoolDegree})
MERGE (Profile)-[po:OWNS]->(Degree)
    ON CREATE SET po.degreeName = row.schoolDegree;
    
//profile - skill
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MATCH (Profile:Profile{profileID: row.profileID})
MATCH (Skill:Skill {skillName: row.allSkills})
MERGE (Profile)-[ps:HAS]->(Skill)
    ON CREATE SET ps.skillName = row.allSkills;    

//profile - repo
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQVwxMX7LNUhIJxIwExM2IKW9iEZlN8mKnb5R333_GKp0J6ZUnFHCVInUw9Cq8ThKqm8b-QW8whAt8o/pub?output=csv' 
AS row
MATCH (Profile:Profile{fullName: row.fullName})
MATCH (Repository:Repository {repoName: row.repoName})
MERGE (Profile)-[pr:OWNS]->(Repository)
    ON CREATE SET pr.repoName = row.repoName;
