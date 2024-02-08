## Учебный кейс PostgreSQL от Netolology

1. [Работа с базами данных](https://github.com/AV-Gorshkov/SQL_netology.ru/blob/main/1_%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0_%D1%81_%D0%B1%D0%B0%D0%B7%D0%B0%D0%BC%D0%B8_%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85.sql)

Изучение:

- Запросы
- Основные типы данных
- Работа с разными типами данных
- Сортировка Order By
- Фильтрация Where


2. [Основы SQL](https://github.com/AV-Gorshkov/SQL_netology.ru/blob/main/2_%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B_SQL.txt)

Изучение:

- Объединение таблиц Inner Join / Left Join / Right Join / Full Outer Join / Union / Except
- Агрегация данных Sum / Count / Avg / String_Agg
- Группировка данных Group By / Having
- Вложенные запросы
- Условные конструкции Case


3. [Углубление в SQL](https://github.com/AV-Gorshkov/SQL_netology.ru/blob/main/3_%D0%A3%D0%B3%D0%BB%D1%83%D0%B1%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5_%D0%B2_SQL.txt)

Изучение:

- Созадние таблиц Creat Table / Alter Table / Drop Table
- Данные Insert Into / Update Table / Delete From Table
- Внешние ключи
- Проверяющие ограничения


4. [Работа с PostgreSQL](https://github.com/AV-Gorshkov/SQL_netology.ru/blob/main/4_%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0_%D1%81_PostgreSQL.txt)

Изучение:

- Оконные функции
- CTE
- Рекурсивные CTE


5. [Работа с PostgreSQL часть 2](https://github.com/AV-Gorshkov/SQL_netology.ru/blob/main/5_%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0_%D1%81_PostgreSQL(%D1%87%D0%B0%D1%81%D1%82%D1%8C_2).txt)

Изучение:

- Представления Create View / Creat Materialized View
- Схемы запросов Explain Analyze
- Индексы
- Сложные типы данных Json
- Массивы


6. [Проектная работа по модулю “SQL и получение данных” ](https://github.com/AV-Gorshkov/SQL_netology.ru/blob/main/%D0%98%D1%82%D0%BE%D0%B3%D0%BE%D0%B2%D1%8B%D0%B9_%D0%BC%D0%BE%D0%B4%D1%83%D0%BB%D1%8C.txt)


**Для выполнения работы Вам необходимо:**					
1. Перейти по ссылке и ознакомиться с описанием базы данных: https://edu.postgrespro.ru/bookings.pdf
2. Подключиться к базе данных **avia** по одному из следующих вариантов:
- облачное подключение, те же настройки, что и у dvd-rental, только название базы **demo**, схема bookings
- импорт sql запроса из sql файла, представленных на 2 странице описания базы
- восстановить базу из *.backup файла по ссылке [avia](https://drive.google.com/file/d/1U15gYuu_ZFE2sQMN32GXK3phBLcUl6OM/view?usp=sharing)

3. Написать запросы, позволяющие ответить на вопросы, согласно списка ниже. 
4. Отправить работу на проверку.

**Перечень вопросов:**

|№|Вопрос|
|-|-|
|1|Выведите названия самолётов, которые имеют менее 50 посадочных мест.|
|2|Выведите процентное изменение ежемесячной суммы бронирования билетов, округленной до сотых.|
|3|Выведите названия самолётов без бизнес-класса. Используйте в решении функцию array_agg.|
|4|Выведите накопительный итог количества мест в самолётах по каждому аэропорту на каждый день. Учтите только те самолеты, которые летали пустыми и только те дни, когда из одного аэропорта вылетело более одного такого самолёта. Выведите в результат код аэропорта, дату вылета, количество пустых мест и накопительный итог.|
|5|Найдите процентное соотношение перелётов по маршрутам от общего количества перелётов. Выведите в результат названия аэропортов и процентное отношение. Используйте в решении оконную функцию.|
|6|Выведите количество пассажиров по каждому коду сотового оператора. Код оператора – это три символа после +7|
|7|Классифицируйте финансовые обороты (сумму стоимости билетов) по маршрутам:до 50 млн – low, от 50 млн включительно до 150 млн – middle, от 150 млн включительно – high. Выведите в результат количество маршрутов в каждом полученном классе.|
|8|Вычислите медиану стоимости билетов, медиану стоимости бронирования и отношение медианы бронирования к медиане стоимости билетов, результат округлите до сотых.|
|9|Найдите значение минимальной стоимости одного километра полёта для пассажира. Для этого определите расстояние между аэропортами и учтите стоимость билетов. Для поиска расстояния между двумя точками на поверхности Земли используйте дополнительный модуль earthdistance. Для работы данного модуля нужно установить ещё один модуль – cube.|




**Пояснения:**

Перелет, рейс - это **flight_id** (разовый перелет между двумя аэропортами).

Маршрут - это все перелеты между двумя аэропортами.

Кратчайшее расстояние между двумя точками A и B на земной поверхности (если принять ее за сферу) определяется зависимостью:
d = arccos {sin(latitude_a)·sin(latitude_b) + cos(latitude_a)·cos(latitude_b)·cos(longitude_a - longitude_b)}, где latitude_a и latitude_b — широты, longitude_a, longitude_b — долготы данных пунктов, d — расстояние между пунктами измеряется в радианах длиной дуги большого круга земного шара.
Расстояние между пунктами, измеряемое в километрах, определяется по формуле:
L = d·R, где R = 6371 км — средний радиус земного шара.