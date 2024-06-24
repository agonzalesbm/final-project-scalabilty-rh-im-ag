CREATE TABLE IF NOT EXISTS perfil_suscription(
    id_subscription SERIAL PRIMARY KEY,
    id_user VARCHAR NOT NULL,
    is_private BOOLEAN NOT NULL
);
