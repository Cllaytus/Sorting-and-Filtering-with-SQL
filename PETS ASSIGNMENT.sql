-- 1. EXTRACT INFORMATION ON PETS NAME AND OWNERS NAME SIDE BY SIDE
select PETS.NAME PET_NAME, OWNERS.FULLNAME OWNERS_NAME FROM OWNERS, PETS
WHERE OWNERS.OWNERID = PETS.OWNERID;

-- 2. FIND OUT WHICH PETS FROM THIS CLINIC HAD THEIR PROCEDURES PERFORMED
SELECT  pets.PETID, pets.KIND, PETS.NAME `PET NAME`, history.PROCEDURETYPE HISTORY_PROCEDURETYPE, details.ProcedureType DETAILS_PROCEDURE FROM PETS
JOIN HISTORY
ON PETS.PETID = HISTORY.PETID
JOIN details
ON history.ProcedureSubCode = DETAILS.PROCEDURESUBCODE; 

-- 3. MATCH UP ALL PROCEDURES PERFORMED TO THEIR DESCRIPTIONS
SELECT HISTORY.PROCEDURETYPE HISTORY_PROCEDURE, DETAILS.PROCEDURETYPE DETAILS_PROCEDURE, DETAILS.DESCRIPTION FROM HISTORY
JOIN DETAILS
ON HISTORY.PROCEDURESUBCODE = DETAILS.PROCEDURESUBCODE;

SELECT HISTORY.PROCEDURETYPE `HISTORY PROCEDURE`, DETAILS.PROCEDURETYPE `DETAILS PROCEDURE`, DETAILS.DESCRIPTION FROM HISTORY
JOIN DETAILS
ON HISTORY.PROCEDURESUBCODE = DETAILS.PROCEDURESUBCODE
AND HISTORY.PROCEDURETYPE = DETAILS.PROCEDURETYPE
ORDER BY HISTORY.PROCEDURETYPE, DETAILS.PROCEDURESUBCODE;

SELECT history.ProcedureType, history.ProcedureSubCode, details.Description
FROM details, history
WHERE history.ProcedureSubCode = details.ProcedureSubCode
AND history.ProcedureType = details.ProcedureType
ORDER BY ProcedureType, ProcedureSubCode;

-- 4. SAME AS ABOVE BUT ONLY ON PETS FROM THE CLINIC IN QUESTION
SELECT PETS.PETID, history.ProcedureType, history.ProcedureSubCode, details.Description
FROM PETS 
JOIN history
ON PETS.PETID = history.PETID
JOIN DETAILS
ON history.ProcedureSubCode = details.ProcedureSubCode
AND history.ProcedureType = details.ProcedureType
ORDER BY ProcedureType, ProcedureSubCode;

SELECT PETS.PETID, history.ProcedureType, history.ProcedureSubCode, details.Description
FROM PETS, DETAILS, HISTORY
WHERE PETS.PETID = HISTORY.PETID
AND details.ProcedureSubCode = history.ProcedureSubCode
AND details.ProcedureType = history.ProcedureType
ORDER BY PROCEDURETYPE, PROCEDURESUBCODE;

-- 5. EXTRACT A TABLE OF INDIVIDUAL COSTS (PROCEDURE PRICES) INCURED BY OWNERS OF PETS FROM  THE CLINIC IN QUESTION 
-- (THIS TABLE SHOULD HAVE OWNER AND PROCEDURE SIDE BY SIDE)

select owners.fullname OWNERS, sum(j.price) `TOTAL PRICE` FROM owners
JOIN pets
on owners.OWNERID = pets.OwnerID
join
(select history.PetID, details.ProcedureType, details.Price from history, details
where history.ProcedureSubCode = details.ProcedureSubCode
and history.ProcedureType = details.ProcedureType) J
group by 1
order by `total price` desc;

select owners.fullname OWNERS, sum(j.price) `TOTAL PRICE` FROM owners
JOIN pets
on owners.OWNERID = pets.OwnerID
join
(select details.ProcedureType `DETAILS PROCEDURE`, history.proceduretype `HISTORY PROCEDURE`
from details
join history
on details.ProcedureType = history.ProcedureType) U
join
(select history.PetID, details.Price from history, details
where history.ProcedureSubCode = details.ProcedureSubCode
and history.ProcedureType = details.ProcedureType) J
group by 1;

order by `total price` desc;

