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
