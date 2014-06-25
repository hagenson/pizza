SERVER=.\\sql2008r2
DB=pizza_test
OSQL=osql -E -S $(SERVER)
USER=$(DB)
PASSWORD=xxx
JAVA_HOME="$(PROGRAMFILES)/Java/jdk1.7.0_60"
JAVA=$(JAVA_HOME)/bin/java.exe

default: drop_constraints.log drop_tables.log tables.log static constraints.log

all: clean default

boot:
	$(OSQL) -Q "if exists(select name from sysdatabases where name = \"$(DB)\") drop database $(DB)"
	$(OSQL) -Q "create database $(DB)"
	$(OSQL) -Q "sp_addlogin $(USER), $(PASSWORD)"
	$(OSQL) -d $(DB) -Q "sp_changedbowner $(DB)"


clean:
	rm -f $$(/usr/bin/find . -name '*.log')
	rm -f tables.sql
	rm -f constraints.sql

drop_constraints.log: schema.sql
	$(OSQL) -d $(DB) -i drop_constraints.sql | sqlcheck
	@echo ok > $@

drop_tables.log: schema.sql
	$(OSQL) -d $(DB) -i drop_tables.sql | sqlcheck
	@echo ok > $@

constraints:constraints/constraints.sql
	$(OSQL) -d $(DB) -i $< | sqlcheck

tables.sql: schema.sql
	cat schema.sql | ./slice.pl tables > tables.sql

constraints.sql: schema.sql
	cat schema.sql | ./slice.pl constraints > constraints.sql

tables.sql: schema.sql

constraints.sql: schema.sql

static: schema.sql $(patsubst %.sql,%.log,$(wildcard static/*.sql))

%.log:%.sql
	$(OSQL) -d $(DB) -i $< | sqlcheck
	$(if $(shell grep '[^ ]' $< | tail -n 1 | grep -iv 'go'), $(error error: $<: no GO statement at end of file.))
	$(if $(shell tail -c 1 $< | grep "[^$$]"), $(error error: $<: no newline at end of file))
	@echo ok > $@
