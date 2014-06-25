declare @product int
set @product = 1

set identity_insert Product on

insert into Product(id, displayOrder, category, name, description)
values (@product, 0, 'Pizzas', 'Margherita', 'Plain cheese and tomato sauce pizza.')

set identity_insert Product off

set identity_insert ProductSize on

insert into ProductSize(product, id, name, price)
values(@product, 1, '7 inch', 10)

insert into ProductSize(product, id, name, price)
values(@product, 2, '10 inch', 12.5)

insert into ProductSize(product, id, name, price)
values(@product, 3, '12 inch', 15)

set identity_insert ProductSize off

set identity_insert Customisation on

insert into Customisation(product, id, name, price)
values(@product, 1, 'Olives', 0.5)

insert into Customisation(product, id, name, price)
values(@product, 2, 'Jalepanos', 0.5)

insert into Customisation(product, id, name, price)
values(@product, 3, 'Anchovies', 1)

insert into Customisation(product, id, name, price)
values(@product, 4, 'Salami', 1)

insert into Customisation(product, id, name, price)
values(@product, 5, 'Peperoni', 1)

set identity_insert Customisation off

go
