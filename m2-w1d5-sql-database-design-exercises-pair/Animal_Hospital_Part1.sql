CREATE DATABASE AnimalHospital;

BEGIN TRANSACTION

CREATE TABLE owner
(
	ownerId int identity not null,
	lastName varchar(100) not null,
	firstName varchar(100) not null,
	
	constraint pk_ownerId primary key (ownerId)
);

CREATE TABLE address
(
	addressId int identity not null,
	ownerId int not null,
	addressLine1 varchar(200) not null,
	addressLine2 varchar(200) null,
	city varchar(100) not null,
	state varchar(50) not null,
	postalCode varchar(10) not null,
	
	constraint pk_addressId primary key (addressId),
	constraint fk_ownerId foreign key (ownerID) references owner(ownerId)
	
);

CREATE TABLE pet
(
	petid int identity not null,
	ownerId int not null,
	pettype varchar (50) not null,
	petname varchar (50) not null,
	petDOB datetime not null,
	
	constraint pk_petid primary key (petid),
	constraint fk_ownerId1 foreign key (ownerId) references owner(ownerId)
);	

CREATE TABLE visit
(
	visitid int identity not null,
	petid int not null,
	visitdate datetime not null,
	
	constraint pk_visitid primary key (visitid),
	constraint fk_petId foreign key (petId) references pet(petId)
	
);	

CREATE TABLE vetprocedure
(
	procedureid int identity not null,
	name varchar (50) not null,
	cost int not null,
	--petid int not null,
	
	constraint pk_procedureid primary key (procedureid),
	--constraint fk_petId2 foreign key (petid) references pet(petid)
);	


--CONSTRAINT pk_film_category_film_id_category_id PRIMARY KEY (film_id, category_id)
CREATE TABLE pet_vetprocedure
(
	petid int not null,
	procedureid int not null,
	CONSTRAINT pk_petid_vetprocedureid primary key (petId,procedureid),
	CONSTRAINT fk_petid_ foreign key (petid) references pet(petid),
	CONSTRAINT fk_procedureid_ foreign key (procedureid) references vetprocedure(procedureid)
);

COMMIT