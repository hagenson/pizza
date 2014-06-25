declare @product int
set @product = 2

set identity_insert Product on

insert into Product(id, displayOrder, category, name, description)
values (@product, 1, 'Pizzas', 'Peperoni', 'The classic Italian pizza. Peperoni and Mozzeralla Cheese on our special recipe pasta sauce.')

set identity_insert Product off

set identity_insert ProductSize on

insert into ProductSize(product, id, name, price)
values(@product, 4, '7 inch', 10)

insert into ProductSize(product, id, name, price)
values(@product, 5, '10 inch', 12.5)

insert into ProductSize(product, id, name, price)
values(@product, 6, '12 inch', 15)

set identity_insert ProductSize off

set identity_insert Customisation on

insert into Customisation(product, id, name, price)
values(@product, 6, 'Olives', 0.5)

insert into Customisation(product, id, name, price)
values(@product, 7, 'Jalepanos', 0.5)

insert into Customisation(product, id, name, price)
values(@product, 8, 'Anchovies', 1)

insert into Customisation(product, id, name, price)
values(@product, 9, 'Salami', 1)

insert into Customisation(product, id, name, price)
values(@product, 10, 'No Peperoni', -1)

set identity_insert Customisation off

go
