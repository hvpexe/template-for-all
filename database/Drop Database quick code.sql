USE [master]
alter database TemplateForAll set Single_user with rollback IMMEDIATE;
drop database TemplateForAll
go