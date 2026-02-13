CREATE ROLE analyst_role;
CREATE USER akash IDENTIFIED BY 'password123';
GRANT analyst_role TO akash;

-- Read-only access
GRANT SELECT 
ON sakila.* 
TO analyst_role;

-- Read + Write Access (SELECT, INSERT, UPDATE)
GRANT SELECT, INSERT, UPDATE 
ON sakila.* 
TO analyst_role;

-- Full Access (ALL PRIVILEGES)
GRANT ALL PRIVILEGES 
ON sakila.* 
TO analyst_role;

-- Make ROLE Default for USER
SET DEFAULT ROLE analyst_role TO 'akash';

