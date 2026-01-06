show databases;
use sakila;
show tables;

-- in operator 
-- “Is this value present in the list?”
select * from payment where amount in (select amount from payment where payment_id=2 or payment_id =3);

-- any operator
-- Checks whether a value satisfies the condition with at least one value from a subquery.
select * from payment where amount =any (select amount from payment where payment_id=2 or payment_id =3);

-- all operator 
-- Checks whether a value satisfies the condition with every value from a subquery.
select * from payment where amount <all (select amount from payment where payment_id=2 or payment_id =3);

