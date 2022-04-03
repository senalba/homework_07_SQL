DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;


CREATE TABLE merchant_category(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE merchant(
	id SERIAL,
	name VARCHAR(50),
	id_merchant_category INT,
	PRIMARY KEY(id)
);

CREATE TABLE card_holder(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE credit_card(
	card VARCHAR(20) UNIQUE,
	cardholder_id INT
);

CREATE TABLE transaction(
	id	INT,
	date TIMESTAMP,	
	amount FLOAT,	
	card VARCHAR(20),
	id_merchant INT
);


ALTER TABLE merchant 
	ADD CONSTRAINT fk_merchant_category 
		FOREIGN KEY (id_merchant_category) 
			REFERENCES merchant_category(id);

ALTER TABLE credit_card			
	ADD CONSTRAINT fk_card_holder
      FOREIGN KEY(cardholder_id) 
	  	REFERENCES card_holder(id);	

ALTER TABLE transaction
	ADD CONSTRAINT fk_merchant
		FOREIGN KEY(id_merchant) 
	  		REFERENCES merchant(id);
			
ALTER TABLE transaction
	ADD CONSTRAINT fk_credit_card
		FOREIGN KEY(card) 
	  		REFERENCES credit_card(card);			
		

