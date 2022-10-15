USE [master]
alter database [TemplateForAllDB] set Single_user with rollback IMMEDIATE;
drop database [TemplateForAllDB]
go