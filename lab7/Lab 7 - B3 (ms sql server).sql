USE [my]
GO
-- B3

-- ??? ������� "Supply" ������� ����������� (�� ����� �������?).

/* 1. ������� ������� "Firm" � ������: 
	IDF � ��������� ����, �������������, ���� ���������; 
	FirmName � ��������� ����;
	Address � ��������� ����; 
	Rate � �������� ���� � ��������� ���� ������ ����� �������. */
-- ----------------------------------------------------------------------
-- �������:
USE [my]
CREATE TABLE Firm (
	[Firm] [int] IDENTITY(1,1) NOT NULL,
	[FirmName] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[Rate] [numeric](18, 2) NULL,
	PRIMARY KEY ([Firm])
)



-- ----------------------------------------------------------------------
/* 2. ������ �� ����� ��������� ���������������� ������� �� ������� "Supply". 
C����� �Rate� ����� ���������: ������� ������� �������� �Rate,%�  
��� ������ ����� � ���� ��� ����� �� 10, �� ����� �������� � 0,1; 
				   ���� �� 10 �� 20 � 0,2; 
				   ���� �� 20 �� 30 � 0,3; 
				   � ��������� ������� � 0,4. */
-- ----------------------------------------------------------------------
-- �������:


select avg(rate), firm from [dbo].[Supply] group by firm;
USE [my]
insert into Firm (FirmName, Address, Rate)
select 
firm as FirmName, address as Address, 
CASE
    WHEN avg(rate) < 10 THEN 0.10
    WHEN avg(rate) > 10 and avg(rate) < 20 THEN 0.20
	WHEN avg(rate) > 20 and avg(rate) < 30 THEN 0.30
    ELSE 0.40
END AS Rate
from [dbo].[Supply] group by firm, address;


-- ----------------------------------------------------------------------
/* 3. ����� ���� ��� ������ ���� ���������� � ����� �������, ����� ������� �������� ������� �Address�, �Rate,%�.*/
-- ----------------------------------------------------------------------
-- �������:



-- ----------------------------------------------------------------------
/* 4. ��� �������� �������� ���������� �������� �� ������� ���������� �������� ������� �Store� � ������: 
IDST � ��������� ����, �������������, ���� ���������; 
IDFi � ������������� (������ ��� �����); 
IDAl � ������������� (������ ��� �������); 
Amount � ������������� (������ ���������� ��������).*/
-- ----------------------------------------------------------------------
-- �������:
 
USE [my]
create table [dbo].[Store] (
	IDST int IDENTITY(1,1) NOT NULL,
	IDFi int,
	IDAl int,
	Amount int,
	PRIMARY KEY (IDST)
)

select * from STORE;


-- ----------------------------------------------------------------------
/* 5. ��������� ������� �Store�, ������ ��� ���������� ����� �� ������� �Supply�. */
-- ----------------------------------------------------------------------
-- ������� �1 (������������ view/cursor):






-- ������� �2 (�� ������������ view/cursor):


-- ----------------------------------------------------------------------
/* 6. �������� ������� �Purchases�, � ��� ����� �������: 
IDP � ��������� ����, �������������, ���� ���������; 
IDST � ������������� (������ ��� ������� �� ����������� ����������); 
Amount � ������������� (������ ���������� ������������ ��������); 
PriceP � �������� ���� � ����� ������� ����� ������� (��������� �������); 
DateP � ������ ���� (����, �����, ���) �������. */
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
/* 7. �������� ��������� ��� �������������� ���������� ���������� � ������� � ������� "Purchases" 
� �������������� ����������� ����� �������� � ������� �Store�.
 ������� �� ������, ��� ������� ��, ���� ��� � ����������.  
 PriceP ������� ���:  Price * (1 + firm.Rate + 0.18)*/
-- ----------------------------------------------------------------------
-- ������� �1:


-- ������� �2:


-- ----------------------------------------------------------------------
/* 8. �������� ��������� ������� � ��������.*/
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
/* 9. ������� �������� �����, �������� ���������� �������, ���������� � ��������� �������, 
������������ ������� ����� ���� � ���� �� �����-����������.  */
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
/* 10. � ����������� ������� ��������� ����� ��������, ������� ����� ��������� ����-�����������.*/
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
/* 11. ������� �������� ������, ������������ � �������� ��������, 
������� ���� ������� � ���� ������, ����� ������� �������� �����, ��������� ������� � ����, ���� �������.*/
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
/*  12* ���������� ����������� ������� �Supply�. ������ ����� �������� 
�������� ����� �� ��� �����, � �������� ������� � ������ �������� �� ��� �������.*/
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
/*  13 �������� constraint foreign key ��� ������: �Supply�, �Firm�, �Purchases�, �Store�.*/
-- ----------------------------------------------------------------------
-- �������:


-- ----------------------------------------------------------------------
GO