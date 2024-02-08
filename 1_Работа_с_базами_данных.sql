--======== �������� ����� ==============
--������� �1
--�������� ���������� �������� ������� �� ������� �������.
SELECT
	DISTINCT (city)
FROM
	city

--������� �2
--����������� ������ �� ����������� �������, ����� ������ ������� ������ �� ������,
--�������� ������� ���������� �� �L� � ������������� �� �a�, � �������� �� �������� ��������.
--�������� ���������� �������� ������� �� ������� �������.
SELECT
	DISTINCT (city)
FROM 
	city
WHERE  
	city NOT LIKE '% %'
	AND  
	city LIKE  'L%a'
	
--������� �3
--�������� �� ������� �������� �� ������ ������� ���������� �� ��������, ������� ����������� 
--� ���������� � 17 ���� 2005 ���� �� 19 ���� 2005 ���� ������������, 
--� ��������� ������� ��������� 1.00.
--������� ����� ������������� �� ���� �������.
SELECT	
	payment_id,
	amount,
	payment_date
FROM 
	payment 
WHERE amount >1 AND 
	payment_date BETWEEN '17-06-2005' AND '19-06-2005' :: date + INTERVAL '1 day'
ORDER BY 
	payment_date ASC 

--������� �4
-- �������� ���������� � 10-�� ��������� �������� �� ������ �������.
SELECT	
	payment_id,
	amount,
	payment_date
FROM 
	payment 
ORDER BY payment_date DESC 
LIMIT  10

--������� �5
--�������� ��������� ���������� �� �����������:
--  1. ������� � ��� (� ����� ������� ����� ������)
--  2. ����������� �����
--  3. ����� �������� ���� email
--  4. ���� ���������� ���������� ������ � ���������� (��� �������)
--������ ������� ������� ������������ �� ������� �����.
SELECT 	
	Concat(last_name, ' ', first_name) AS "��� ����������",
	email AS "��. �����",
	Character_Length(email) AS "����� ������ ��.�����",
	last_update :: date AS "���� ����������"
FROM 	
	customer 

--������� �6
--�������� ����� �������� ������ �������� �����������, ����� ������� KELLY ��� WILLIE.
--��� ����� � ������� � ����� �� �������� �������� ������ ���� ���������� � ������ �������.
SELECT
	Lower(first_name) AS "���",
	Lower(last_name) AS "�������",
	active
FROM 	
	customer
WHERE
	active = 1 AND 
	first_name IN (
	'KELLY',
	'WILLIE')
	
--======== �������������� ����� ==============

--������� �1
--�������� ���������� � �������, � ������� ������� �R� � ��������� ������ ������� �� 
--0.00 �� 3.00 ������������, � ����� ������ c ��������� �PG-13� � ���������� ������ ������ ��� ������ 4.00.
SELECT  
	film_id,
	title,
	description,
	rental_rate,
	rating 
FROM
	film
WHERE (
		rating = 'R' AND 	
		rental_rate >= 0.00 AND rental_rate<=3.00
	  ) OR 
      (
	    rating = 'PG-13' AND 
    	rental_rate >=4.00
      )
ORDER BY title
	
--������� �2
--�������� ���������� � ��� ������� � ����� ������� ��������� ������.
SELECT  
	film_id,
	title,
	description,
	Length(description) AS "���-�� ��������"
FROM
	film
ORDER BY 
	Length(description) DESC 
LIMIT 3

--������� �3
-- �������� Email ������� ����������, �������� �������� Email �� 2 ��������� �������:
--� ������ ������� ������ ���� ��������, ��������� �� @, 
--�� ������ ������� ������ ���� ��������, ��������� ����� @.
SELECT 	
	email AS "��. �����",
	split_part(email, '@',1) AS "����� �� @",
    split_part(email, '@',2) AS "����� ����� @"
FROM 	
	customer 

--������� �4
--����������� ������ �� ����������� �������, �������������� �������� � ����� ��������: 
--������ ����� ������ ������ ���� ���������, ��������� ���������.
SELECT 	
	customer_id,
	email AS "��. �����",
	Concat( Upper(
				Substr( 
					split_part(email, '@',1)
					,1,1)
				),				
			Lower(
				Substr( 
					split_part(email, '@',1)
					,2)			
				)
		 ) AS "����� �� @",
	Concat( Upper(
				Substr( 
					split_part(email, '@',2)
					,1,1)
				),				
			Lower(
				Substr( 
					split_part(email, '@',2)
					,2)			
				)
		 ) AS "����� ����� @"
FROM 	
	customer 
