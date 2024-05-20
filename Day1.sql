-- Create table Country
CREATE TABLE Country (
    Id SERIAL PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);

-- Create table City
CREATE TABLE City (
    Id SERIAL PRIMARY KEY,
    CountryId INT REFERENCES Country(Id) ON DELETE CASCADE,
    CityName VARCHAR(255) NOT NULL
);

-- Create table MissionApplication
CREATE TABLE MissionApplication (
    Id SERIAL PRIMARY KEY,
    MissionId INT REFERENCES Missions(Id) ON DELETE CASCADE,
    UserId INT REFERENCES "User"(Id) ON DELETE CASCADE,
    AppliedDate TIMESTAMPTZ NOT NULL,
    Status BOOLEAN NOT NULL,
    Sheet INT NOT NULL
);

-- Create table Missions
CREATE TABLE Missions (
    Id SERIAL PRIMARY KEY,
    MissionTitle VARCHAR(255) NOT NULL,
    MissionDescription TEXT NOT NULL,
    MissionOrganisationName VARCHAR(255) NOT NULL,
    MissionOrganisationDetail TEXT NOT NULL,
    CountryId INT REFERENCES Country(Id) ON DELETE CASCADE,
    CityId INT REFERENCES City(Id) ON DELETE CASCADE,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    MissionType VARCHAR(255) NOT NULL,
    TotalSheets INT,
    RegistrationDeadLine DATE NOT NULL,
    MissionThemeId INT REFERENCES MissionTheme(Id) ON DELETE CASCADE,
    MissionSkillId INT REFERENCES MissionSkill(Id) ON DELETE CASCADE,
    MissionImages TEXT,
    MissionDocuments TEXT,
    MissionAvailability TEXT,
    MissionVideoUrl TEXT
);

-- Create table MissionSkill
CREATE TABLE MissionSkill (
    Id SERIAL PRIMARY KEY,
    SkillName VARCHAR(255) NOT NULL,
    Status VARCHAR(255) NOT NULL
);

-- Create table MissionTheme
CREATE TABLE MissionTheme (
    Id SERIAL PRIMARY KEY,
    ThemeName VARCHAR(255) NOT NULL,
    Status VARCHAR(255) NOT NULL
);

-- Create table "User"
CREATE TABLE "User" (
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255),
    EmailAddress VARCHAR(255) UNIQUE NOT NULL,
    UserType VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Create table UserDetail
CREATE TABLE UserDetail (
    Id SERIAL PRIMARY KEY,
    UserId INT REFERENCES "User"(Id) ON DELETE CASCADE,
    Name VARCHAR(255) NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    EmployeeId VARCHAR(255),
    Manager VARCHAR(255),
    Title VARCHAR(255),
    Department VARCHAR(255),
    MyProfile TEXT,
    WhyIVolunteer TEXT,
    CountryId INT REFERENCES Country(Id) ON DELETE CASCADE,
    CityId INT REFERENCES City(Id) ON DELETE CASCADE,
    Availability TEXT,
    LinkedInUrl TEXT,
    MySkills TEXT,
    UserImage TEXT,
    Status BOOLEAN NOT NULL
);

-- Create table UserSkills
CREATE TABLE UserSkills (
    Id SERIAL PRIMARY KEY,
    Skill VARCHAR(255) NOT NULL,
    UserId INT REFERENCES "User"(Id) ON DELETE CASCADE
);