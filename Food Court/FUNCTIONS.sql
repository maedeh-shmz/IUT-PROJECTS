-- MAEDEH SHAMIRZAEI _ 9629743
-- IMPLEMENTATION OF FUNCTIONS

CREATE FUNCTION SEE_SPECIALCITY_BRANCHES(@CITYNAME VARCHAR(7))
RETURNS TABLE
AS
RETURN
	SELECT *
	FROM BRANCHES
	WHERE @CITYNAME=SUBSTRING(ADDRESS,1,LEN(@CITYNAME))


test:
select *
from SEE_SPECIALCITY_BRANCHES('Isfahan')
union
select *
from SEE_SPECIALCITY_BRANCHES('Tehran')

-----------------------------------------------------------------------


CREATE FUNCTION SHOW_INFO (@ID INTEGER)
RETURNS TABLE 
AS
RETURN
	SELECT *
	FROM CUSTOMER
	WHERE ID=@ID

TEST:
SELECT *
FROM CHECK_INFO(10)

--------------------------------------------------------------------------------------


CREATE FUNCTION SHOW_INVENTORY(@BRANCH_ID INTEGER)
RETURNS TABLE	
AS
RETURN
	SELECT *
	FROM INVENTORY
	WHERE [DATE]=CONVERT(DATE,GETDATE()) AND BRANCH_ID=@BRANCH_ID

test:
select *
from SHOW_INVENTORY(211)
---------------------------------------------------------------------------------------


CREATE FUNCTION SEE_EMPLOYEES_OF_A_BRANCH(@MANAGER_ID INTEGER)
RETURNS TABLE 
AS 
RETURN
	SELECT *
	FROM SERVICE_FORCE 
	WHERE (SELECT BRANCH_ID 
			FROM SERVICE_FORCE 
			WHERE ID=@MANAGER_ID)=BRANCH_ID


TEST:
	SELECT *
	FROM SEE_EMPLOYEES_OF_A_BRANCH(5020)
---------------------------------------------------------------------------------------

