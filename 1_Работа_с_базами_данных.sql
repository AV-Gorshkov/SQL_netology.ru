--======== ОСНОВНАЯ ЧАСТЬ ==============
--ЗАДАНИЕ №1
--Выведите уникальные названия городов из таблицы городов.
SELECT
	DISTINCT (city)
FROM
	city

--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания, чтобы запрос выводил только те города,
--названия которых начинаются на “L” и заканчиваются на “a”, и названия не содержат пробелов.
--Выведите уникальные названия городов из таблицы городов.
SELECT
	DISTINCT (city)
FROM 
	city
WHERE  
	city NOT LIKE '% %'
	AND  
	city LIKE  'L%a'
	
--ЗАДАНИЕ №3
--Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись 
--в промежуток с 17 июня 2005 года по 19 июня 2005 года включительно, 
--и стоимость которых превышает 1.00.
--Платежи нужно отсортировать по дате платежа.
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

--ЗАДАНИЕ №4
-- Выведите информацию о 10-ти последних платежах за прокат фильмов.
SELECT	
	payment_id,
	amount,
	payment_date
FROM 
	payment 
ORDER BY payment_date DESC 
LIMIT  10

--ЗАДАНИЕ №5
--Выведите следующую информацию по покупателям:
--  1. Фамилия и имя (в одной колонке через пробел)
--  2. Электронная почта
--  3. Длину значения поля email
--  4. Дату последнего обновления записи о покупателе (без времени)
--Каждой колонке задайте наименование на русском языке.
SELECT 	
	Concat(last_name, ' ', first_name) AS "ФИО покупателя",
	email AS "эл. почта",
	Character_Length(email) AS "Длина адреса эл.почты",
	last_update :: date AS "Дата обновления"
FROM 	
	customer 

--ЗАДАНИЕ №6
--Выведите одним запросом только активных покупателей, имена которых KELLY или WILLIE.
--Все буквы в фамилии и имени из верхнего регистра должны быть переведены в нижний регистр.
SELECT
	Lower(first_name) AS "Имя",
	Lower(last_name) AS "Фамилия",
	active
FROM 	
	customer
WHERE
	active = 1 AND 
	first_name IN (
	'KELLY',
	'WILLIE')
	
--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Выведите информацию о фильмах, у которых рейтинг “R” и стоимость аренды указана от 
--0.00 до 3.00 включительно, а также фильмы c рейтингом “PG-13” и стоимостью аренды больше или равной 4.00.
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
	
--ЗАДАНИЕ №2
--Получите информацию о трёх фильмах с самым длинным описанием фильма.
SELECT  
	film_id,
	title,
	description,
	Length(description) AS "кол-во символов"
FROM
	film
ORDER BY 
	Length(description) DESC 
LIMIT 3

--ЗАДАНИЕ №3
-- Выведите Email каждого покупателя, разделив значение Email на 2 отдельных колонки:
--в первой колонке должно быть значение, указанное до @, 
--во второй колонке должно быть значение, указанное после @.
SELECT 	
	email AS "эл. почта",
	split_part(email, '@',1) AS "часть до @",
    split_part(email, '@',2) AS "часть после @"
FROM 	
	customer 

--ЗАДАНИЕ №4
--Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: 
--первая буква строки должна быть заглавной, остальные строчными.
SELECT 	
	customer_id,
	email AS "эл. почта",
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
		 ) AS "часть до @",
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
		 ) AS "часть после @"
FROM 	
	customer 
