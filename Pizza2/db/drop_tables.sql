declare @tname sysname
declare @cname sysname
declare @qry nvarchar(4000)
declare @id int

create table #tbls
(
  id int identity not null,
  tname sysname not null
)

insert into #tbls(tname)
select t.name
from sysobjects t
where t.xtype = 'U'

select @id = id, @tname=tname
from #tbls
where id = (select min(id) from #tbls)

while @id <= (select max(id) from #tbls)
begin
  set @qry = 'drop table [' + @tname + ']'
  execute sp_executesql @qry

  set @id = @id + 1
  select @tname=tname
  from #tbls
  where id = @id
end

drop table #tbls
