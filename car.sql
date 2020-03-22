CREATE TABLE Bill_Of_Material (
	-- Define PartID as primary key of type INT
  	PartID INT NOT NULL PRIMARY KEY,
	SubPartID INT,
	Component VARCHAR(255) NOT NULL,
	Title  VARCHAR(255) NOT NULL,
	Vendor VARCHAR(255) NOT NULL,
  	ProductKey CHAR(32) NOT NULL,
  	-- Define Cost of type INT
  	Cost INT NOT NULL,
	Quantity INT NOT NULL);

-- Insert the root element SUV as described
INSERT INTO Bill_Of_Material
VALUES ('1',NULL,'SUV','BMW X1','BMW','F48',50000,1);
INSERT INTO Bill_Of_Material
VALUES ('2','1','Engine','V6BiTurbro','BMW','EV3891ASF',3000,1);
INSERT INTO Bill_Of_Material
VALUES ('3','1','Body','AL_Race_Body','BMW','BD39281PUO',5000,1);
INSERT INTO Bill_Of_Material
VALUES ('4','1','Interior Decoration','All_Leather_Brown','BMW','ZEU198292',2500,1);
-- Insert the entry Wheels as described
INSERT INTO Bill_Of_Material
VALUES ('5','1','Wheels','M-Performance 19/255','BMW','MKQ134098URZ',400,4);

SELECT * 
FROM Bill_Of_Material;

-- Define CTE with the fields: PartID, SubPartID, Title, Component, Level
with construction_Plan (PartID, SubPartID, Title, Component, Level) AS (
	SELECT 
  		PartID,
  		SubPartID,
  		Title,
  		Component,
  		-- Initialize the field Level
  		1 as level
	FROM partList
	WHERE PartID = '1'
	UNION ALL
	SELECT 
		CHILD.PartID, 
  		CHILD.SubPartID,
  		CHILD.Title,
  		CHILD.Component,
  		-- Increment the field Level each recursion step
  		PARENT.level + 1
	FROM construction_Plan PARENT, partList CHILD
  	WHERE CHILD.SubPartID = PARENT.PartID
  	-- Limit the number of iterations to Level < 2
	  AND PARENT.level < 2)

SELECT DISTINCT PartID, SubPartID, Title, Component, Level
FROM construction_Plan
ORDER BY PartID, SubPartID, Level;
-- Define CTE with the fields: PartID, SubPartID, Level, Component, Total
WITH construction_Plan  (PartID, SubPartID, Level, Component, Total) AS (
	SELECT 
  		PartID,SubPartID,
  		0,
  		Component,
  		-- Initialize Total
  		Quantity
	FROM partList
	WHERE PartID = '1'
	UNION ALL
	SELECT 
		CHILD.PartID, CHILD.SubPartID,
  		PARENT.Level + 1,
  		CHILD.Component,
  		-- Increase Total by the quantity of the child element
  		PARENT.total + CHILD.quantity
	FROM construction_Plan PARENT, partList CHILD
  	WHERE CHILD.SubPartID = PARENT.PartID
	  AND PARENT.Level < 3)
      
SELECT 
    PartID, SubPartID,Component,
    -- Calculate the sum of total on the aggregated information
    sum(total)
FROM construction_Plan
GROUP BY PartID, SubPartID, Component
ORDER BY PartID, SubPartID;