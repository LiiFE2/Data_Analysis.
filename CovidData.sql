SELECT *
FROM PortfolioProject..CovidDeath
ORDER BY 3,4

SELECT *
FROM PortfolioProject..CovidVaccination
ORDER BY 3,4
 
 
--select data that we are going to be using

SELECT  location, date,total_cases , new_cases, total_deaths, population
FROM PortfolioProject..CovidDeath
ORDER BY 1,2

--total cases vs total death didnt work

SELECT  location, date, total_cases,total_deaths,  (cast(total_deaths as int))/ cast(total_cases as int)*100 as deathpercentage
FROM  PortfolioProject..CovidDeath
ORDER BY 1,2

--total cases vs population 

SELECT  location, date,population, total_cases, (total_cases/population)*100 as PercentagePopulationInfected
FROM  PortfolioProject..CovidDeath
--where location like '%nigeria%'
ORDER BY 1,2


--looking at countries with higestninfection rate vs population  didnt work

SELECT  location,population, max(cast(total_cases as int)) as HighestInfectionCount, max(cast(total_cases/population as int))*100 as
PercentagePopulationInfected
FROM PortfolioProject..CovidDeath
--where location like '%nigeria%'
Group by location ,Population
ORDER BY PercentagePopulationInfected

--countries with highest death count per population

SELECT  location, max(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeath
--where location like '%nigeria%'
Group by location 
ORDER BY TotalDeathCount desc