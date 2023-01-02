BEGIN;


CREATE TABLE IF NOT EXISTS public.users
(
    id bigserial NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.pengeluaran
(
    id bigserial NOT NULL,
    id_user bigint NOT NULL,
    date date NOT NULL DEFAULT now(),
    description character varying(255),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.pengeluaran
    ADD FOREIGN KEY (id_user)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
INSERT INTO users(name, email, password) VALUES('Azri Akmal', 'azriakmal2222@gmail.com', '123456');

INSERT INTO pengeluaran(id_user, description) VALUES(1, 'Beli Makan');

SELECT * FROM pengeluaran
LEFT JOIN users ON users.id = pengeluaran.id_user
WHERE pengeluaran.id_user = 1
ORDER BY pengeluaran.date ASC;

END;