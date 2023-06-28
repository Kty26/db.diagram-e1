CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "level" varchar(30) NOT NULL
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "category" varchar(30) UNIQUE NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "rol" varchar(30) NOT NULL
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "first_name" varchar(30) NOT NULL,
  "last_name" varchar(30) NOT NULL,
  "age" int NOT NULL,
  "email" varchar(30) UNIQUE NOT NULL,
  "password" varchar(15) NOT NULL
);

CREATE TABLE "users_rol" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" int NOT NULL,
  "rol_id" int NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_name" varchar(30),
  "description" text,
  "level_id" int NOT NULL,
  "teacher" int NOT NULL,
  "category" int
);

CREATE TABLE "course_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" int NOT NULL,
  "url" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "purchase_course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" int NOT NULL,
  "course_id" int NOT NULL
);

ALTER TABLE "users_rol" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "users_rol" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category") REFERENCES "categories" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "purchase_course" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "purchase_course" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");


/* ---------------Comands-----------------------*/


INSERT INTO levels (level) VALUES ('basico'), ('intermedio'), ('avanzado');

INSERT INTO roles (rol) VALUES ('student'), ('teacher'), ('admin');

INSERT INTO categories (category) VALUES ('Web Development'), ('Motion Graphics'), ('My SQL');

INSERT INTO users (first_name, last_name, age, email, password) VALUES
 ('Leidy', 'Ortega', 60, 'leidy@gmail.com', '1100'),
 ('Edgar', 'Contreras', 73, 'edgar@gmail.com', '1102'),
 ('Kattia', 'Contreras', 34, 'kattia@gmail.com', '1103'),
 ('Natalia', 'Mendez', 25, 'natalia@gmail.com', '1104'),
 ('Emanuel', 'Briceño', 23, 'emanuel@gmail.com', '1105'),
 ('Daniela', 'Ortega', 43, 'daniela@gmail.com', '1106'),
 ('Ian', 'Rosas', 32, 'ian@gmail.com', '1107'),
 ('David', 'Angulo', 38, 'david@gmail.com', '1108');

INSERT INTO users_rol (user_id, rol_id) VALUES
 (1, 1),
 (2, 1),
 (3, 1),
 (4, 1),
 (5, 1),
 (5, 2),
 (6, 2),
 (7, 2),
 (8, 3);  

INSERT INTO courses (course_name, description, level_id, teacher, category) VALUES
('Foundations', 'JavaScript CSS HTML', 1, 5, 1),
('Develop fullstack', 'React', 2, 6, 1),
('Alpha_Mate', 'Effects motions', 3, 4, 2),
('After Effects basic', 'Ajustes de posición, rotación y escala', 1, 4, 2),
('Database 1', 'postgres', 1, 7, 3),
('cybersecurity', 'reward your web site', 3, 6, 1);

INSERT INTO course_video (course_id, url) VALUES
(1, 'https://foundations.com'),
(2, 'https://developfullstack.com'),
(3, 'https://alpha_mate.com'),
(4, 'https://aftereffects.com'),
(5, 'https://database1.com'),
(6, 'https://cybersegurity.com');


INSERT INTO purchase_course (user_id, course_id) VALUES
(1, 1),
(1, 6),
(2, 3),
(2, 5),
(3, 2),
(3, 4),
(4, 2),
(4, 1);
