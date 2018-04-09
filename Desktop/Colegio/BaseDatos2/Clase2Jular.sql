CREATE DATABASE imdb;
USE imdb;
CREATE TABLE IF not exists film (film_id INT(10) NOT NULL PRIMARY KEY auto_increment, title VARCHAR(30) NOT NULL, description tinytext, release_date DATE);
CREATE TABLE IF not exists actor (actor_id INT(10) NOT NULL PRIMARY KEY auto_increment, first_name VARCHAR(30) NOT NULL, last_name VARCHAR(30));
CREATE TABLE IF not exists film_actor (actor_id INT(10) NOT NULL, film_id INT(10) NOT NULL);
ALTER TABLE film_actor add CONSTRAINT fk_filmactor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id);
ALTER TABLE film_actor add CONSTRAINT fk_filmactor_film FOREIGN KEY (film_id) REFERENCES film (film_id);
ALTER TABLE film add last_update TIMESTAMP;
ALTER TABLE actor add last_update TIMESTAMP;

insert into actor(first_name, last_name) values ('Ewan','McGregor');
insert into actor(first_name, last_name) values ('Hank','Moody');
insert into film(title,description,release_date) values ('Trainspotting',' Narra la punzante historia de un grupo de jóvenes heroinómanos.','1996-01-01');
insert into film(title,description,release_date) values ('Diarios de Motocicleta','El film relata el viaje que realizaron El Che y Granado a través de América del Sur','2004-01-01');
insert into film_actor(actor_id,film_id) values ('1','2');
