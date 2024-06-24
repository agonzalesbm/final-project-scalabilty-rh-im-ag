CREATE TABLE IF NOT EXISTS subscriptions_user(
    id_subscription SERIAL PRIMARY KEY,
    id_user VARCHAR NOT NULL,
    id_user_subscribed VARCHAR NOT NULL,
    name_user_suscribed VARCHAR NOT NULL,
    id_customer_stripe VARCHAR NOT NULL,
    id_product_stripe VARCHAR NOT NULL,
    id_price_stripe VARCHAR NOT NULL,
    id_subscription_stripe VARCHAR NOT NULL
)