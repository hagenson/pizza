    create table Customer (
        id int identity not null,
        addressLine1 varchar(255),
        addressLine2 varchar(255),
        addressLine3 varchar(255),
        addressLine4 varchar(255),
        email varchar(255),
        firstName varchar(255),
        lastName varchar(255),
        password varchar(255),
        phoneNumber varchar(255),
        primary key (id)
    )
go
    create table Customisation (
        id int identity not null,
        name varchar(255),
        price double precision not null,
        product int,
        primary key (id)
    )
go
    create table LineItem (
        id int identity not null,
        count int not null,
        [order] int,
        product_id int,
        size_id int,
        primary key (id)
    )
go
    create table LineItemCustomisation (
        LineItem int not null,
        Customisation int not null
    )
go
    create table Product (
        id int identity not null,
        category varchar(255),
        description varchar(255),
        displayOrder int not null,
        name varchar(255),
        primary key (id)
    )
go
    create table ProductSize (
        id int identity not null,
        name varchar(255),
        price double precision not null,
        product int,
        primary key (id)
    )
go
    create table Visitor (
        id uniqueidentifier not null,
        creationDate datetime2,
        [currentOrder_id] int,
        primary key (id)
    )
go
    create table [Order] (
        id int identity not null,
        date datetime2,
        state int,
        customer_id int,
        primary key (id)
    )
go
