drop table if exists company;
create table if not exists company
(
	company_id		varchar(10),
	company_name	varchar(50),
	location		varchar(20)
);

insert into company values
('C001', 'techTFQ Solutions', 'Kuala Lumpur');
insert into company values
('C002', 'techTFQ Media Group', 'Singapore');


DROP TABLE IF EXISTS family;
CREATE TABLE IF NOT EXISTS family
(
    member_id     VARCHAR(10),
    name          VARCHAR(50),
    age           INT,
    parent_id     VARCHAR(10)
);

insert into family values
  ('F1', 'David', 4, 'F5'),
  ('F2', 'Carol', 10, 'F5'),
  ('F3', 'Michael', 12, 'F5'),
  ('F4', 'Johnson', 36, ''),
  ('F5', 'Maryam', 40, 'F6'),
  ('F6', 'Stewart', 70, ''),
  ('F7', 'Rohan', 6, 'F4'),
  ('F8', 'Asha', 8, 'F4');
