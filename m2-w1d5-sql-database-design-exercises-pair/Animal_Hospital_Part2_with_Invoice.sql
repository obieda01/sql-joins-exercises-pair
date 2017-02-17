CREATE TABLE invoice (
	ownerId int not null,
	invoiceId int not null,
	tax float not null default(0.08),
	address varchar(200)  not null default('HILLTOP ANIMAL HOSPITAL'),
	total float default(0),
	amongOwning float default(0),
	date_time datetime,
	
	constraint pk_invoiceId_ primary key (invoiceId),
	constraint fk_ownerId_ foreign key (ownerID) references owner(ownerId)
)