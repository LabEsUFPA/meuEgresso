-- Grupos Padrões

insert into grupo (id_grupo, ativo, created_date , last_modified_date , nome_grupo) values (1,	true, '2023-04-22 01:38:25.666', '2023-04-22 01:38:25.666', 'ADMIN') ON CONFLICT DO NOTHING;
insert into grupo (id_grupo, ativo, created_date , last_modified_date , nome_grupo) values (2,	true, '2023-04-22 01:38:25.666', '2023-04-22 01:38:25.666', 'SECRETARIO') ON CONFLICT DO NOTHING;
insert into grupo (id_grupo, ativo, created_date , last_modified_date , nome_grupo) values (3,	true, '2023-04-22 01:38:25.666', '2023-04-22 01:38:25.666', 'EGRESSO') ON CONFLICT DO NOTHING;

-- Usuario Padrão

INSERT INTO usuario (id_usuario,ativo,created_date,last_modified_date,email,matricula_usuario,nome_usuario,senha_usuario,login_usuario) VALUES (1,true,'2023-04-22 14:34:40.702','2023-04-22 14:34:40.702','admin@admin.com','2023-04-14','ADMIN ADMIN','{bcrypt}$2a$10$vh9/MkL4XQyd.fqkQdnWSelTUxPBpDb6qL5W2uWLxLUN0JR9vwRZm','ADMIN') ON CONFLICT DO NOTHING;

INSERT INTO usuario (id_usuario,ativo,created_date,last_modified_date,email,matricula_usuario,nome_usuario,senha_usuario,login_usuario) VALUES (2,true,'2023-04-22 14:35:09.149','2023-04-22 14:35:09.149','secretario@secretario.com','2023-04-14','SECRETARIO SECRETARIO','{bcrypt}$2a$10$biZwxymZqQDevuqWzB/wCe0jfC6Idr.SJRYO9oXBFPuusp9oA9hAy','SECRETARIO') ON CONFLICT DO NOTHING;

INSERT INTO usuario (id_usuario,ativo,created_date,last_modified_date,email,matricula_usuario,nome_usuario,senha_usuario,login_usuario) VALUES (3,true,'2023-04-22 14:35:30.354','2023-04-22 14:35:30.354','egresso@egresso.com','2023-04-14','EGRESSO EGRESSO','{bcrypt}$2a$10$Tas4Xjqxogotz3bSL08nHOZRUNF9WJZuPthj2qn3maJMjwI2/uHtO','EGRESSO') ON CONFLICT DO NOTHING;
