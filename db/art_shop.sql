DROP TABLE prints;
DROP TABLE artists;


CREATE TABLE artists (
  id SERIAL primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact text
);


CREATE TABLE prints (
  id SERIAL primary key,
  title VARCHAR(255),
  description text,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  wholesale_cost INT,
  retail_price INT,
  quantity INT
);
