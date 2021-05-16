-- MAEDEH SHAMIRZAEI _ 9629743
-- IMPLEMENTATION OF TRIGGERS

CREATE TRIGGER RETIRED_EMPLOYEE ON SERVICE_FORCE
AFTER DELETE
AS
BEGIN
	DECLARE @ID INT
	SET @ID=(SELECT ID FROM deleted)
	INSERT INTO SERVICE_FORCE_LOG 
		SELECT NATIONAL_CODE,ID,NAME_FAMILY,GENDER,PHONE_NUMBER,[ADDRESS]
		,POSITION AS PREVIOUS_POSITION , BRANCH_ID, 0.55*SALARY AS RETIRED_SALARY
		FROM deleted
		WHERE ID=@ID

END


TEST:
SELECT *
FROM SERVICE_FORCE_LOG

DELETE FROM SERVICE_FORCE
WHERE ID=5000

----------------------------------------------------------------------------

CREATE TRIGGER ADD_BRANCH ON BRANCHES
AFTER INSERT
AS
BEGIN
	DECLARE @X INTEGER
	SET @X=(SELECT BRANCH_ID FROM inserted)
	INSERT INTO INVENTORY VALUES (@X,GETDATE(),0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
END

TEST:

INSERT INTO BRANCHES VALUES 
(321,'ASEMAN','Mr.Kashani',25,03132311324,'Isfahan,Hotelpol')

select * from INVENTORY

--------------------------------------------------------------------------

CREATE TRIGGER ORDERING_UPDATE_INVENTORY ON INVENTORY
AFTER UPDATE
AS
BEGIN
	DECLARE @NUM INTEGER
	IF UPDATE([COMMODITY_1]) BEGIN
		SET @NUM=(SELECT COMMODITY_1 FROM inserted)-(SELECT COMMODITY_1 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=1
	END
	
	IF UPDATE([COMMODITY_1]) BEGIN
		SET @NUM=(SELECT COMMODITY_1 FROM inserted)-(SELECT COMMODITY_1 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=1
	END

	IF UPDATE([COMMODITY_2]) BEGIN
		SET @NUM=(SELECT COMMODITY_2 FROM inserted)-(SELECT COMMODITY_2 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=2
	END

	IF UPDATE([COMMODITY_3]) BEGIN
		SET @NUM=(SELECT COMMODITY_3 FROM inserted)-(SELECT COMMODITY_3 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=3
	END

	IF UPDATE([COMMODITY_4]) BEGIN
		SET @NUM=(SELECT COMMODITY_4 FROM inserted)-(SELECT COMMODITY_4 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=4
	END

	IF UPDATE([COMMODITY_5]) BEGIN
		SET @NUM=(SELECT COMMODITY_5 FROM inserted)-(SELECT COMMODITY_5 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=5
	END

	IF UPDATE([COMMODITY_6]) BEGIN
		SET @NUM=(SELECT COMMODITY_6 FROM inserted)-(SELECT COMMODITY_6 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=6
	END

	IF UPDATE([COMMODITY_7]) BEGIN
		SET @NUM=(SELECT COMMODITY_7 FROM inserted)-(SELECT COMMODITY_7 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=7
	END

	IF UPDATE([COMMODITY_8]) BEGIN
		SET @NUM=(SELECT COMMODITY_8 FROM inserted)-(SELECT COMMODITY_8 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=8
	END

	IF UPDATE([COMMODITY_9]) BEGIN
		SET @NUM=(SELECT COMMODITY_9 FROM inserted)-(SELECT COMMODITY_9 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=9
	END

	IF UPDATE([COMMODITY_10]) BEGIN
		SET @NUM=(SELECT COMMODITY_10 FROM inserted)-(SELECT COMMODITY_10 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=10
	END

	IF UPDATE([COMMODITY_11]) BEGIN
		SET @NUM=(SELECT COMMODITY_11 FROM inserted)-(SELECT COMMODITY_11 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=11
	END

	IF UPDATE([COMMODITY_12]) BEGIN
		SET @NUM=(SELECT COMMODITY_12 FROM inserted)-(SELECT COMMODITY_12 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=12
	END

	IF UPDATE([COMMODITY_13]) BEGIN
		SET @NUM=(SELECT COMMODITY_13 FROM inserted)-(SELECT COMMODITY_13 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=13
	END

	IF UPDATE([COMMODITY_14]) BEGIN
		SET @NUM=(SELECT COMMODITY_14 FROM inserted)-(SELECT COMMODITY_14 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=14
	END

	IF UPDATE([COMMODITY_15]) BEGIN
		SET @NUM=(SELECT COMMODITY_15 FROM inserted)-(SELECT COMMODITY_15 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=15
	END

	IF UPDATE([COMMODITY_16]) BEGIN
		SET @NUM=(SELECT COMMODITY_16 FROM inserted)-(SELECT COMMODITY_16 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=16
	END

	IF UPDATE([COMMODITY_17]) BEGIN
		SET @NUM=(SELECT COMMODITY_17 FROM inserted)-(SELECT COMMODITY_17 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=17
	END

	IF UPDATE([COMMODITY_18]) BEGIN
		SET @NUM=(SELECT COMMODITY_18 FROM inserted)-(SELECT COMMODITY_18 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=18
	END

	IF UPDATE([COMMODITY_19]) BEGIN
		SET @NUM=(SELECT COMMODITY_19 FROM inserted)-(SELECT COMMODITY_19 FROM deleted)
		UPDATE FOOD_REPORT 
		SET TOTAL_SALES= TOTAL_SALES - @NUM
		WHERE FOOD_ID=19
	END
END


TEST:


EXEC ORDERING 216,5,5,0,23,5,'Tehran,Mellat'
EXEC ORDERING 216,6,3,0,23,5,'Tehran,Poonak'

SELECT * FROM FOOD_REPORT

select * from INVENTORY



