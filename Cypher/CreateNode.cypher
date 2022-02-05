//load profile
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT8jzEQhRcUu198LnbD9xSFWf3v-LTudnLWlJ8a4S4F95_dtM_zmnGSFdqNEAEhgKMGwNHAf9Ao9oe4/pub?output=csv' 
AS row
MERGE (Profile:Profile {profileID: row.profileID})
  ON CREATE SET Profile.fullName = row.fullName, Profile.description = row.description;
  
//load company
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTqsf1UcBuDINcsfIwV_4giQPtzK2-vpLSuoubJemwN45NkFrEL0CaPXwICeyNG2vVWXsEv7ksRId_X/pub?output=csv' 
AS row 
MERGE (Company:Company {companyID: row.companyID}) 
  ON CREATE SET Company.companyName = row.company

//load degree
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTZNPYB5hERZa6jECsZjBZtzQHxPEEbGMU5BnzjmTz4hOH_MxFU7-lKugmLu7Nx17Fr3b9fvNl6OzNi/pub?output=csv' 
AS row 
MERGE (Degree:Degree {degreeID: row.degreeID}) 
  ON create set Degree.degreeName = row.degree

//load location
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRU91CPf-KuhsNtIlm6vcEO1xkoVd1AvP2JLIwcK092wDycrgaeYzZGMW29oaDZNMHB3SOwapcu8sp0/pub?output=csv' 
AS row 
MERGE (Location:Location {locationID: row.locationID}) 
  ON CREATE SET Location.locationName = row.location
  
//load school
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR8mXlRihbGgs_pA5d9-EX3jUTmZ16eNLJ-KsehcCjZucRzeEpLtnr2kIhZOZr1nLCuCv2GFR2zFJZA/pub?output=csv' 
AS row 
MERGE (School:School {schoolID: row.schoolID}) 
  ON CREATE SET School.schoolName = row.school
  
//load skill
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTcvtaNLipXLMmMlbo77hjdPTXArP4eBNUm41RIHboKae7f-otYju5J5cuB64ww6ZasNm-1O15Ckk0R/pub?output=csv' 
AS row 
MERGE (Skill:Skill {skillID: row.skillID}) 
ON CREATE SET Skill.skillName = row.skill

//load title
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSlc9qnliuCAcSOQUgYQy1QWX-Vxjlngl6znHu1X7U8LhN4FBDoGJin9kDo28ZA4wmFIwhWtTUMVtwM/pub?output=csv' 
AS row 
MERGE (Title:Title {titleID: row.titleID}) 
ON CREATE SET Title.titleName = row.title

//create indice
CREATE INDEX company_id FOR (p:Company) ON (p.companyID);
CREATE INDEX location_id FOR (l:Location) ON (l.locationID);
CREATE INDEX skill_id FOR (s:Skill) ON (s.skillID);
CREATE INDEX school_id FOR (s:School) ON (s.schoolID);
CREATE INDEX title_id FOR (t:Title) ON (t.titleID);
CREATE INDEX degree_id FOR (d:Degree) ON (d.degreeID);
CREATE CONSTRAINT profile_id ON (p:Profile) ASSERT p.profileID IS UNIQUE;
CALL db.awaitIndexes();
