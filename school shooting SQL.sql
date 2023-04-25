--Getting rid of uneccecisary columns

Select * 
From [School Shootings].dbo.SchoolShootings

Alter Table [School Shootings].dbo.SchoolShootings
Drop Column LONCOD

Alter Table [School Shootings].dbo.SchoolShootings
Drop Column LATCOD

Alter Table [School Shootings].dbo.SchoolShootings
Drop Column CDCODE

Alter Table [School Shootings].dbo.SchoolShootings
Drop Column NCESSCH

--Replacing Null Values

Select urbanrural
From [School Shootings].dbo.SchoolShootings
Where ISNULL( urbanrural, INVALID)

Update [School Shootings].dbo.SchoolShootings
Set urbanrural = 'INVALID'
Where urbanrural IS NULL;

Update [School Shootings].dbo.SchoolShootings
Set race = 'INVALID'
Where race IS NULL;

Update [School Shootings].dbo.SchoolShootings
Set time = '0:00'
Where time IS NULL;

-- Finding MAX and MIN values

Select * 
From [School Shootings].dbo.SchoolShootings

Select MAX(state) as MostShootingsState
From [School Shootings].dbo.SchoolShootings

SELECT State, COUNT(State) 
FROM [School Shootings].dbo.SchoolShootings
GROUP BY state

Alter Table [School Shootings].dbo.SchoolShootings
Drop column StateShootingCount

Select MIN(state) as LeastShootingsState
From [School Shootings].dbo.SchoolShootings

Select MAX(city) as MostShootingsCity
From [School Shootings].dbo.SchoolShootings

Select MIN(city) as LeastShootingsCityState
From [School Shootings].dbo.SchoolShootings


--Removing time from date column

Select * 
From [School Shootings].dbo.SchoolShootings

Select Date, CONVERT(date, date) as DateOnly 
From [School Shootings].dbo.SchoolShootings

Update dbo.SchoolShootings
Set date = CONVERT(date, date)

Alter Table dbo.SchoolShootings
Add DateOnly date;

Update SchoolShootings
Set DateOnly = CONVERT(date, date)

Alter table SchoolShootings
Drop Column date

-- Renamed DateOnly back to Date
