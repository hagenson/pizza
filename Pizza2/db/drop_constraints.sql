declare @tname sysname
declare @cname sysname
declare @qry nvarchar(4000)
declare @id int

create table #constr
(
  id int identity not null,
  tname sysname not null,
  cname sysname not null
)

insert into #constr(tname, cname)
select t.name, c.name
from sysobjects c, sysobjects t
where c.xtype = 'F'
and t.id = c.parent_obj

select @id = id, @tname=tname, @cname=cname
from #constr
where id = (select min(id) from #constr)

while @id <= (select max(id) from #constr)
begin
  set @qry = 'alter table [' + @tname + '] drop constraint [' + @cname + ']'
  execute sp_executesql @qry

  set @id = @id + 1
  select @tname=tname, @cname=cname
  from #constr
  where id = @id
end

drop table #constr
