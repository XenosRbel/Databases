CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_name character varying DEFAULT ''::character varying NOT NULL,
    first_name character varying DEFAULT ''::character varying NOT NULL,
    father_name character varying DEFAULT ''::character varying NOT NULL,
    phone_number character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

CREATE TABLE public.admin_administrators (
    id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    role character varying DEFAULT ''::character varying NOT NULL,
    voucher character varying DEFAULT ''::character varying
)
INHERITS (public.users);


ALTER TABLE public.admin_administrators OWNER TO postgres;

CREATE TABLE public.admin_customers (
    id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
)
INHERITS (public.users);


ALTER TABLE public.admin_customers OWNER TO postgres;


CREATE TABLE public.admin_discounts (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    percent integer DEFAULT 0,
    description character varying DEFAULT ''::character varying NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    start_date_at timestamp without time zone DEFAULT '2021-03-29 16:21:57.608672'::timestamp without time zone NOT NULL,
    end_date_at timestamp without time zone DEFAULT '2021-03-29 16:21:57.63103'::timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_discounts OWNER TO postgres;

CREATE TABLE public.admin_masters (
    id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    specialization character varying DEFAULT ''::character varying NOT NULL,
    work_experience double precision DEFAULT 0.0 NOT NULL
)
INHERITS (public.users);


ALTER TABLE public.admin_masters OWNER TO postgres;

CREATE TABLE public.admin_orders (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_execution_at timestamp without time zone DEFAULT '2021-03-29 16:21:57.667906'::timestamp without time zone NOT NULL,
    end_execution_at timestamp without time zone DEFAULT '2021-03-29 16:21:57.692413'::timestamp without time zone NOT NULL,
    admin_master_id bigint,
    admin_discount_id bigint,
    admin_customer_id bigint
);


ALTER TABLE public.admin_orders OWNER TO postgres;

CREATE TABLE public.admin_orders_services (
    order_id bigint,
    service_id bigint
);


ALTER TABLE public.admin_orders_services OWNER TO postgres;



CREATE TABLE public.admin_services (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    price double precision DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.admin_services OWNER TO postgres;

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;



CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;


ALTER TABLE ONLY public.admin_administrators ALTER COLUMN last_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_administrators ALTER COLUMN first_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_administrators ALTER COLUMN father_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_administrators ALTER COLUMN phone_number SET DEFAULT ''::character varying;



ALTER TABLE ONLY public.admin_customers ALTER COLUMN last_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_customers ALTER COLUMN first_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_customers ALTER COLUMN father_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_customers ALTER COLUMN phone_number SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_masters ALTER COLUMN last_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_masters ALTER COLUMN first_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_masters ALTER COLUMN father_name SET DEFAULT ''::character varying;




ALTER TABLE ONLY public.admin_masters ALTER COLUMN phone_number SET DEFAULT ''::character varying;



ALTER TABLE ONLY public.admin_administrators
    ADD CONSTRAINT admin_administrators_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.admin_customers
    ADD CONSTRAINT admin_customers_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.admin_discounts
    ADD CONSTRAINT admin_discounts_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.admin_masters
    ADD CONSTRAINT admin_masters_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.admin_orders
    ADD CONSTRAINT admin_orders_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.admin_services
    ADD CONSTRAINT admin_services_pkey PRIMARY KEY (id);




ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);




ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);




ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);




CREATE UNIQUE INDEX index_admin_administrators_on_email ON public.admin_administrators USING btree (email);




CREATE UNIQUE INDEX index_admin_administrators_on_reset_password_token ON public.admin_administrators USING btree (reset_password_token);




CREATE INDEX index_admin_orders_on_admin_customer_id ON public.admin_orders USING btree (admin_customer_id);




CREATE INDEX index_admin_orders_on_admin_discount_id ON public.admin_orders USING btree (admin_discount_id);




CREATE INDEX index_admin_orders_on_admin_master_id ON public.admin_orders USING btree (admin_master_id);




CREATE INDEX index_admin_orders_services_on_order_id ON public.admin_orders_services USING btree (order_id);




CREATE INDEX index_admin_orders_services_on_service_id ON public.admin_orders_services USING btree (service_id);




CREATE UNIQUE INDEX index_users_on_phone_number ON public.users USING btree (phone_number);




ALTER TABLE ONLY public.admin_orders
    ADD CONSTRAINT fk_rails_3214e81330 FOREIGN KEY (admin_customer_id) REFERENCES public.admin_customers(id);




ALTER TABLE ONLY public.admin_orders
    ADD CONSTRAINT fk_rails_4b872dee5f FOREIGN KEY (admin_discount_id) REFERENCES public.admin_discounts(id);




ALTER TABLE ONLY public.admin_orders
    ADD CONSTRAINT fk_rails_df5e83b762 FOREIGN KEY (admin_master_id) REFERENCES public.admin_masters(id);

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;




