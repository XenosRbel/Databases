DROP PROCEDURE IF EXISTS insert_master_data();
CREATE PROCEDURE join_table()
AS
$$
select admin_masters.father_name from admin_orders
    inner join admin_masters on admin_orders.admin_master_id = admin_masters.id;
$$ LANGUAGE SQL;

CALL join_table();

DROP INDEX IF EXISTS index_users_on_phone_number;
CREATE UNIQUE INDEX index_users_on_phone_number
    ON public.users USING btree (phone_number);


CREATE OR REPLACE FUNCTION total_sum_with_discount(integer, integer) RETURNS integer AS $$
    SELECT ($1 - ($1 * $2 / 100));
$$ LANGUAGE SQL;

SELECT total_sum_with_discount(1000, 20) AS total_sum_with_discount_answer;

DROP TRIGGER if exists view_insert on admin_masters;

CREATE OR REPLACE FUNCTION for_trig()
  RETURNS TRIGGER AS
$func$
BEGIN
UPDATE admin_masters SET father_name='xyz' WHERE admin_masters.id = 42;
END
$func$ LANGUAGE plpgsql;

CREATE TRIGGER view_insert
    AFTER INSERT OR UPDATE
    ON admin_masters
    FOR EACH ROW
    EXECUTE PROCEDURE for_trig()
