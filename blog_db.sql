/*----CREAR TABLA USUARIOS----*/
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);

/*----CREAR 3 USUARIOS----*/
insert into users(first_name, last_name, email) values
('luis','pinzon','luis@gmail.com'),
('fernando', 'morales', 'fernando@gmail.com'),
('sara','pinzon', 'sara@gmail.com');



/*----CREAR TABLA POSTS----*/
create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(100),
	description text
);

/*----ANADIR 5 POST----*/
insert into posts(creator_id,title,description) values
(1,'¿Por qué lo usamos?','Es un hecho establecido hace demasiado tiempo que un lector'),
(1,'¿Dónde puedo conseguirlo?','Hay muchas variaciones de los pasajes de Lorem Ipsum'),
(2,'¿Qué es Lorem Ipsum?','Lorem Ipsum es simplemente el texto de relleno de las imprentas'),
(2,'¿de dónde viene?','Al contrario del pensamiento popular, el texto de Lorem Ipsum'),
(3,'Lorem Ipsum','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a.');


/*----CREAR TABLA LIKES----*/
create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

/*----AÑADIR 5 LIKES----*/
insert into likes (user_id, post_id) values
(1,2),
(1,3),
(2,2),
(3,3),
(3,4),
(3,5);


/*----Trae todos los posts y la información del usuario del campo creator_id----*/
select * from posts inner join users
on users.id = posts.creator_id;

/*----Trae todos los posts, con la información de los usuarios que les dieron like.----*/
select * from posts inner join likes
on post_id=posts.id inner join users
on user_id=users.id order by posts.id;
