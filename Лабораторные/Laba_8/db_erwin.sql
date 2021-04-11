

CREATE TABLE admin_masters53UI5323000
(id INTEGER,
admin_user_id INTEGER,
updated_at DATE,
created_at DATE,
specialization TEXT,
work_experience FLOAT);




INSERT INTO admin_masters53UI5323000 (id, admin_user_id, updated_at, created_at, specialization, work_experience) SELECT id,
admin_user_id,
updated_at,
created_at,
specialization,
work_experience FROM admin_masters;




CREATE TABLE admin_customers53UI5323001
(id INTEGER,
admin_user_id INTEGER,
updated_at DATE);




INSERT INTO admin_customers53UI5323001 (id, admin_user_id, updated_at) SELECT id,
admin_user_id,
updated_at FROM admin_customers;




CREATE TABLE admin_discounts53UI5323002
(id INTEGER,
created_at DATE,
updated_at DATE,
precent INTEGER,
description TEXT,
title TEXT,
start_date_at DATE,
end_date_at DATE);




INSERT INTO admin_discounts53UI5323002 (id, created_at, updated_at, precent, description, title, start_date_at, end_date_at) SELECT id,
created_at,
updated_at,
precent,
description,
title,
start_date_at,
end_date_at FROM admin_discounts;




CREATE TABLE admin_administrators53UI5323003
(id INTEGER,
admin_user_id INTEGER,
admin_role_id INTEGER,
created_at DATE,
updated_at DATE,
email TEXT,
encrypted_password TEXT,
reset_password_token TEXT,
reset_password_sent_at TEXT,
vaucher TEXT);




INSERT INTO admin_administrators53UI5323003 (id, admin_user_id, admin_role_id, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, vaucher) SELECT id,
admin_user_id,
admin_role_id,
created_at,
updated_at,
email,
encrypted_password,
reset_password_token,
reset_password_sent_at,
vaucher FROM admin_administrators;




CREATE TABLE admin_orders53UI5323004
(id CHAR(18),
admin_master_id INTEGER,
admin_user_id INTEGER,
admin_customer_id INTEGER,
admin_discount_id INTEGER,
created_at DATE,
updated_at DATE,
start_execution_at DATE,
end_execution_at DATE);




INSERT INTO admin_orders53UI5323004 (id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id, created_at, updated_at, start_execution_at, end_execution_at) SELECT id,
admin_master_id,
admin_user_id,
admin_customer_id,
admin_discount_id,
created_at,
updated_at,
start_execution_at,
end_execution_at FROM admin_orders;




CREATE TABLE admin_services53UI5323005
(id CHAR(18),
created_at DATE,
updated_at DATE,
description TEXT,
title TEXT,
price FLOAT);




INSERT INTO admin_services53UI5323005 (id, created_at, updated_at, description, title, price) SELECT id,
created_at,
updated_at,
description,
title,
price FROM admin_services;




CREATE TABLE users53UI5323006
(id INTEGER,
created_at DATE,
updated_at DATE,
last_name TEXT,
first_name TEXT,
father_name TEXT,
phone_number TEXT);




INSERT INTO users53UI5323006 (id, created_at, updated_at, last_name, first_name, father_name, phone_number) SELECT id,
created_at,
updated_at,
last_name,
first_name,
father_name,
phone_number FROM users;




CREATE TABLE admin_orders_services53UI5323007
(id CHAR(18),
admin_master_id INTEGER,
admin_user_id INTEGER,
admin_customer_id INTEGER,
admin_discount_id INTEGER);




INSERT INTO admin_orders_services53UI5323007 (id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id) SELECT id,
admin_master_id,
admin_user_id,
admin_customer_id,
admin_discount_id FROM admin_orders_services;




CREATE TABLE schema_migrations53UI5323008
(version INTEGER);




INSERT INTO schema_migrations53UI5323008 (version) SELECT version FROM schema_migrations;




CREATE TABLE admin_roles53UI5323009
(id INTEGER,
title TEXT,
type TEXT);




INSERT INTO admin_roles53UI5323009 (id, title, type) SELECT id,
title,
type FROM admin_roles;



DROP TABLE admin_masters;



DROP TABLE admin_customers;



DROP TABLE admin_discounts;



DROP TABLE admin_administrators;



DROP TABLE admin_orders;



DROP TABLE admin_services;



DROP TABLE users;



DROP TABLE admin_orders_services;



DROP TABLE schema_migrations;



DROP TABLE admin_roles;



CREATE TABLE admin_masters
(
	id                   INTEGER NOT NULL,
	updated_at           DATE NULL,
	created_at           DATE NULL,
	specialization       TEXT NULL,
	work_experience      FLOAT NULL,
	admin_user_id        INTEGER NOT NULL
);



ALTER TABLE admin_masters
ADD PRIMARY KEY (id,admin_user_id);



CREATE TABLE admin_customers
(
	id                   INTEGER NOT NULL,
	updated_at           DATE NULL,
	admin_user_id        INTEGER NOT NULL
);



ALTER TABLE admin_customers
ADD PRIMARY KEY (id,admin_user_id);



CREATE TABLE admin_discounts
(
	id                   INTEGER NOT NULL,
	created_at           DATE NULL,
	updated_at           DATE NULL,
	precent              INTEGER NULL,
	description          TEXT NULL,
	title                TEXT NULL,
	start_date_at        DATE NULL,
	end_date_at          DATE NULL
);



ALTER TABLE admin_discounts
ADD PRIMARY KEY (id);



CREATE TABLE admin_administrators
(
	id                   INTEGER NOT NULL,
	created_at           DATE NOT NULL,
	updated_at           DATE NOT NULL,
	email                TEXT NOT NULL,
	encrypted_password   TEXT NOT NULL,
	reset_password_token TEXT NULL,
	reset_password_sent_at TEXT NULL,
	vaucher              TEXT NULL,
	admin_user_id        INTEGER NOT NULL,
	admin_role_id        INTEGER NOT NULL
);



ALTER TABLE admin_administrators
ADD PRIMARY KEY (id,admin_user_id,admin_role_id);



CREATE TABLE admin_orders
(
	id                   CHAR(18) NOT NULL,
	created_at           DATE NULL,
	updated_at           DATE NULL,
	start_execution_at   DATE NULL,
	end_execution_at     DATE NULL,
	admin_master_id      INTEGER NOT NULL,
	admin_user_id        INTEGER NOT NULL,
	admin_customer_id    INTEGER NOT NULL,
	admin_discount_id    INTEGER NOT NULL
);



ALTER TABLE admin_orders
ADD PRIMARY KEY (id,admin_master_id,admin_user_id,admin_customer_id,admin_discount_id);



CREATE TABLE admin_services
(
	id                   CHAR(18) NOT NULL,
	created_at           DATE NULL,
	updated_at           DATE NULL,
	description          TEXT NULL,
	title                TEXT NULL,
	price                FLOAT NULL
);



ALTER TABLE admin_services
ADD PRIMARY KEY (id);



CREATE TABLE users
(
	id                   INTEGER NOT NULL,
	created_at           DATE NULL,
	updated_at           DATE NULL,
	last_name            TEXT NULL,
	first_name           TEXT NULL,
	father_name          TEXT NULL,
	phone_number         TEXT NULL
);



ALTER TABLE users
ADD PRIMARY KEY (id);



CREATE TABLE admin_orders_services
(
	id                   CHAR(18) NOT NULL,
	admin_master_id      INTEGER NOT NULL,
	admin_user_id        INTEGER NOT NULL,
	admin_customer_id    INTEGER NOT NULL,
	admin_discount_id    INTEGER NOT NULL
);



ALTER TABLE admin_orders_services
ADD PRIMARY KEY (id,admin_master_id,admin_user_id,admin_customer_id,admin_discount_id);



CREATE TABLE schema_migrations
(
	version              INTEGER NOT NULL
);



ALTER TABLE schema_migrations
ADD PRIMARY KEY (version);



CREATE TABLE admin_roles
(
	id                   INTEGER NOT NULL,
	title                TEXT NULL,
	type                 TEXT NULL
);



ALTER TABLE admin_roles
ADD PRIMARY KEY (id);



INSERT INTO admin_masters (id, admin_user_id, updated_at, created_at, specialization, work_experience) SELECT id, admin_user_id, updated_at, created_at, specialization, work_experience FROM admin_masters53UI5323000;



INSERT INTO admin_customers (id, admin_user_id, updated_at) SELECT id, admin_user_id, updated_at FROM admin_customers53UI5323001;



INSERT INTO admin_discounts (id, created_at, updated_at, precent, description, title, start_date_at, end_date_at) SELECT id, created_at, updated_at, precent, description, title, start_date_at, end_date_at FROM admin_discounts53UI5323002;



INSERT INTO admin_administrators (id, admin_user_id, admin_role_id, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, vaucher) SELECT id, admin_user_id, admin_role_id, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, vaucher FROM admin_administrators53UI5323003;



INSERT INTO admin_orders (id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id, created_at, updated_at, start_execution_at, end_execution_at) SELECT id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id, created_at, updated_at, start_execution_at, end_execution_at FROM admin_orders53UI5323004;



INSERT INTO admin_services (id, created_at, updated_at, description, title, price) SELECT id, created_at, updated_at, description, title, price FROM admin_services53UI5323005;



INSERT INTO users (id, created_at, updated_at, last_name, first_name, father_name, phone_number) SELECT id, created_at, updated_at, last_name, first_name, father_name, phone_number FROM users53UI5323006;



INSERT INTO admin_orders_services (id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id) SELECT id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id FROM admin_orders_services53UI5323007;



INSERT INTO schema_migrations (version) SELECT version FROM schema_migrations53UI5323008;



INSERT INTO admin_roles (id, title, type) SELECT id, title, type FROM admin_roles53UI5323009;



ALTER TABLE admin_masters
ADD FOREIGN KEY R_21 (admin_user_id) REFERENCES users (id);



ALTER TABLE admin_customers
ADD FOREIGN KEY R_23 (admin_user_id) REFERENCES users (id);



ALTER TABLE admin_administrators
ADD FOREIGN KEY R_22 (admin_user_id) REFERENCES users (id);



ALTER TABLE admin_administrators
ADD FOREIGN KEY R_35 (admin_role_id) REFERENCES admin_roles (id);



ALTER TABLE admin_orders
ADD FOREIGN KEY R_28 (admin_master_id, admin_user_id) REFERENCES admin_masters (id, admin_user_id);



ALTER TABLE admin_orders
ADD FOREIGN KEY R_29 (admin_customer_id, admin_user_id) REFERENCES admin_customers (id, admin_user_id);



ALTER TABLE admin_orders
ADD FOREIGN KEY R_30 (admin_discount_id) REFERENCES admin_discounts (id);



ALTER TABLE admin_orders_services
ADD FOREIGN KEY R_31 (id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id) REFERENCES admin_orders (id, admin_master_id, admin_user_id, admin_customer_id, admin_discount_id);



ALTER TABLE admin_orders_services
ADD FOREIGN KEY R_32 (id) REFERENCES admin_services (id);



DROP TABLE admin_masters53UI5323000;



DROP TABLE admin_customers53UI5323001;



DROP TABLE admin_discounts53UI5323002;



DROP TABLE admin_administrators53UI5323003;



DROP TABLE admin_orders53UI5323004;



DROP TABLE admin_services53UI5323005;



DROP TABLE users53UI5323006;



DROP TABLE admin_orders_services53UI5323007;



DROP TABLE schema_migrations53UI5323008;



DROP TABLE admin_roles53UI5323009;


