-- Use the test database
USE test;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS `coffee` (
    `id` INT(5) NOT NULL AUTO_INCREMENT,
    `coffee_name` VARCHAR(100) NOT NULL,
    `priced` INT(5),
    PRIMARY KEY (`id`)
);

-- Insert coffee records
INSERT INTO coffee VALUES (101, 'Febary', 120);
INSERT INTO coffee VALUES (102, 'Royal', 140);
INSERT INTO coffee VALUES (103, 'Diamond', 180);
