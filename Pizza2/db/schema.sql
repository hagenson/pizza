
    alter table Customisation 
        drop constraint FK_qi8xkml298bs2hlg6solocfjx
go

    alter table LineItem 
        drop constraint FK_4mtenpssjpfjbc70nux7rcrar
go

    alter table LineItem 
        drop constraint FK_tof5yi9c5ehx1ipt9qf8tid3w
go

    alter table LineItem 
        drop constraint FK_qsftfuypqq82ehm9yq47uq2wu
go

    alter table LineItemCustomisation 
        drop constraint FK_lkfiatko6ns9f45yitbn5kae2
go

    alter table LineItemCustomisation 
        drop constraint FK_82ylqcto3h8xu7ixgof078wu6
go

    alter table ProductSize 
        drop constraint FK_lyofh3kh6s6jv681txk8dbo6x
go

    alter table Visitor 
        drop constraint FK_pfjp4hpjhjhrisam9ccuei357
go

    alter table [Order] 
        drop constraint FK_hj5qkmvpwdd3kon1i19im6dd9
go

    drop table Customer
go

    drop table Customisation
go

    drop table LineItem
go

    drop table LineItemCustomisation
go

    drop table Product
go

    drop table ProductSize
go

    drop table Visitor
go

    drop table [Order]
go

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

    alter table Customisation 
        add constraint FK_qi8xkml298bs2hlg6solocfjx 
        foreign key (product) 
        references Product
go

    alter table LineItem 
        add constraint FK_4mtenpssjpfjbc70nux7rcrar 
        foreign key ([order]) 
        references [Order]
go

    alter table LineItem 
        add constraint FK_tof5yi9c5ehx1ipt9qf8tid3w 
        foreign key (product_id) 
        references Product
go

    alter table LineItem 
        add constraint FK_qsftfuypqq82ehm9yq47uq2wu 
        foreign key (size_id) 
        references ProductSize
go

    alter table LineItemCustomisation 
        add constraint FK_lkfiatko6ns9f45yitbn5kae2 
        foreign key (Customisation) 
        references Customisation
go

    alter table LineItemCustomisation 
        add constraint FK_82ylqcto3h8xu7ixgof078wu6 
        foreign key (LineItem) 
        references LineItem
go

    alter table ProductSize 
        add constraint FK_lyofh3kh6s6jv681txk8dbo6x 
        foreign key (product) 
        references Product
go

    alter table Visitor 
        add constraint FK_pfjp4hpjhjhrisam9ccuei357 
        foreign key ([currentOrder_id]) 
        references [Order]
go

    alter table [Order] 
        add constraint FK_hj5qkmvpwdd3kon1i19im6dd9 
        foreign key (customer_id) 
        references Customer
go
