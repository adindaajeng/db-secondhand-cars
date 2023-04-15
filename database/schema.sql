-- Table Car Type
CREATE TABLE IF NOT EXISTS cars_type
(
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR NOT NULL
);

-- Table Car Body
CREATE TABLE IF NOT EXISTS cars_body
(
    car_body_id SERIAL PRIMARY KEY,
    car_body_name VARCHAR(50) NOT NULL
);

-- Table Car Brand
CREATE TABLE IF NOT EXISTS cars_brand
(
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

-- Table City
CREATE TABLE IF NOT EXISTS city
(
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    latitude NUMERIC(10, 8) NOT NULL,
    longitude NUMERIC(10, 8) NOT NULL
);

-- Table Bid Status
CREATE TABLE IF NOT EXISTS bid_status
(
    bid_status_id SERIAL PRIMARY KEY,
    bid_status character(50) NOT NULL
);

-- Table Users
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    province character(50),
    city_id INTEGER NOT NULL,
    postal_code INTEGER,
    CONSTRAINT city FOREIGN KEY (city_id)
        REFERENCES city (city_id) 
        ON DELETE NO ACTION
);

-- Table Cars
CREATE TABLE IF NOT EXISTS cars (
    car_id SERIAL PRIMARY KEY,
    brand_id INTEGER NOT NULL,
    model VARCHAR(50) NOT NULL,
    car_body_id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    model_year INTEGER NOT NULL,
    color VARCHAR(50),
    seller_id INTEGER NOT NULL,
    is_active boolean DEFAULT 'True',
    date_post date,
    date_updated date,
    seller_allow_bid boolean,
    description VARCHAR,
    CONSTRAINT seller_id FOREIGN KEY (seller_id)
        REFERENCES users (user_id) 
        ON DELETE NO ACTION,
    CONSTRAINT type_id FOREIGN KEY (type_id)
        REFERENCES cars_type (type_id) 
        ON DELETE NO ACTION,
    CONSTRAINT car_body FOREIGN KEY (car_body_id)
        REFERENCES cars_body (car_body_id) 
        ON DELETE NO ACTION,
    CONSTRAINT brand_id FOREIGN KEY (brand_id)
        REFERENCES cars_brand (brand_id) 
        ON DELETE NO ACTION
);

-- Table Bid
CREATE TABLE IF NOT EXISTS cars_bid
(
    bid_id SERIAL PRIMARY KEY,
    buyer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    bid_price INTEGER NOT NULL,
    bid_status_id INTEGER,
    date_bid date,
    CONSTRAINT user_id FOREIGN KEY (buyer_id)
        REFERENCES users (user_id) 
        ON DELETE NO ACTION,
    CONSTRAINT car_id FOREIGN KEY (car_id)
        REFERENCES cars (car_id) 
        ON DELETE NO ACTION,
    CONSTRAINT bid_status FOREIGN KEY (bid_status_id)
        REFERENCES bid_status (bid_status_id) 
        ON DELETE NO ACTION
);

