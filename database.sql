create DATABASE db_restaurant;
use db_restaurant;

-- Tạo bảng users
CREATE TABLE users (
    user_name VARCHAR(50),
    email VARCHAR(255),
    address VARCHAR(255),
    age INT,
    cmnd VARCHAR(20),
    user_id INT PRIMARY KEY AUTO_INCREMENT
);

-- Chèn dữ liệu vào bảng users
INSERT INTO users (user_name, email, address, age) VALUES
('user1', 'user1@example.com', '123 Main St', 25),
('user2', 'user2@example.com', '456 Elm St', 30),
('user3', 'user3@example.com', '789 Oak St', 22),
('user4', 'user4@example.com', '321 Pine St', 28),
('user5', 'user5@example.com', '654 Maple St', 35),
('user6', 'user6@example.com', '987 Birch St', 27),
('user7', 'user7@example.com', '147 Cedar St', 24),
('user8', 'user8@example.com', '258 Spruce St', 29),
('user9', 'user9@example.com', '369 Aspen St', 26),
('user10', 'user10@example.com', '741 Willow St', 33),
('user11', 'user11@example.com', '852 Cypress St', 32),
('user12', 'user12@example.com', '963 Redwood St', 31),
('user13', 'user13@example.com', '159 Poplar St', 23),
('user14', 'user14@example.com', '753 Sequoia St', 34),
('user15', 'user15@example.com', '951 Fir St', 21),
('user16', 'user16@example.com', '357 Ash St', 20),
('user17', 'user17@example.com', '258 Linden St', 36),
('user18', 'user18@example.com', '951 Alder St', 27),
('user19', 'user19@example.com', '753 Hawthorn St', 29),
('user20', 'user20@example.com', '357 Chestnut St', 28);

-- Tạo bảng restaurant
CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(100),
    image VARCHAR(255),
    description VARCHAR(255)
);

-- Chèn dữ liệu vào bảng restaurant
INSERT INTO restaurant (res_name, image, description) VALUES
("Pizza Palace", "images/pizza_palace.jpg", "Delicious pizzas made with fresh ingredients and a variety of toppings."),
("Noodle Nirvana", "images/noodle_nirvana.jpg", "Authentic Asian noodle dishes with bold flavors and generous portions."),
("Taco Fiesta", "images/taco_fiesta.jpg", "Lively atmosphere with traditional and creative tacos, plus margaritas."),
("The Curry Corner", "images/curry_corner.jpg", "Exquisite Indian curries with fragrant spices and a range of vegetarian options."),
("Burger Barn", "images/burger_barn.jpg", "Classic American burgers made with juicy patties, fresh toppings, and crispy fries."),
("Sushi Symphony", "images/sushi_symphony.jpg", "Upscale sushi restaurant offering fresh seafood, creative rolls, and traditional Japanese dishes."),
("Crepe Heaven", "images/crepe_heaven.jpg", "Sweet and savory crepes made with authentic French batter and a variety of delicious fillings."),
("Happy Wok", "images/happy_wok.jpg", "Healthy and flavorful stir-fries with fresh vegetables, protein options, and homemade sauces."),
("Mamma's Kitchen", "images/mammas_kitchen.jpg", "Homestyle cooking with comforting dishes like pasta, lasagna, and slow-cooked meats."),
("The Grill House", "images/grill_house.jpg", "High-quality steaks, seafood, and other grilled specialties in an elegant setting."),
("Burrito Bandits", "images/burrito_bandits.jpg", "Large and flavorful burritos, tacos, and other Mexican favorites with fresh ingredients."),
("Pasta Paradise", "images/pasta_paradise.jpg", "Italian comfort food with a variety of pasta dishes, sauces, and fresh seafood options."),
("The Ramen Shop", "images/ramen_shop.jpg", "Authentic Japanese ramen with savory broths, perfectly cooked noodles, and customizable toppings."),
("Falafel Frenzy", "images/falafel_frenzy.jpg", "Delicious and healthy Middle Eastern cuisine featuring falafel wraps, pita bread, and fresh dips."),
("The French Table", "images/french_table.jpg", "Romantic French bistro offering classic dishes like steak frites, escargot, and decadent desserts."),
("Taco Tuesday Everyday", "images/taco_tuesday_everyday.jpg", "Casual eatery celebrating tacos every day with creative fillings, delicious salsas, and refreshing drinks."),
("Dim Sum Delight", "images/dim_sum_delight.jpg", "Traditional and innovative dim sum dishes in a vibrant and bustling atmosphere."),
("The Healthy Choice", "images/healthy_choice.jpg", "Fresh and nutritious meals with a focus on healthy ingredients, dietary needs, and delicious flavors."),
("Coffee Corner & Bakery", "images/coffee_corner_bakery.jpg", "Cozy cafe offering delicious coffee drinks, fresh-baked pastries, and light lunch options.");

-- Tạo bảng like_res
CREATE TABLE like_res (
    like_res_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    res_id INT,
    FOREIGN KEY (res_id) REFERENCES restaurant (res_id),
    date_like DATE
);

-- Chèn dữ liệu vào bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 3, "2024-07-03"),
(2, 5, "2024-06-20"),
(3, 1, "2024-05-12"),
(1, 7, "2024-07-02"),
(4, 2, "2024-06-25"),
(2, 10, "2024-06-18"),
(5, 8, "2024-07-01"),
(3, 14, "2024-04-10"),
(1, 16, "2024-06-30"),
(4, 18, "2024-06-15");

-- Tạo bảng rate_res
CREATE TABLE rate_res (
    rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    res_id INT,
    FOREIGN KEY (res_id) REFERENCES restaurant (res_id),
    amount INT,
    date_rate DATE
);

-- Chèn dữ liệu vào bảng rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 3, 5, "2024-07-03"),
(2, 5, 4, "2024-06-20"),
(3, 1, 4, "2024-05-12"),
(4, 7, 5, "2024-07-02"),
(1, 2, 3, "2024-06-22"),
(5, 10, 5, "2024-06-19"),
(3, 8, 4, "2024-07-01"),
(2, 14, 4, "2024-06-27"),
(4, 16, 5, "2024-06-12"),
(1, 18, 3, "2024-06-25"),
(6, 1, 5, "2024-03-15"),
(7, 9, 4, "2024-05-08"),
(8, 12, 5, "2024-04-20"),
(9, 6, 3, "2024-02-10"),
(10, 15, 4, "2024-01-25");

-- Tạo bảng food_type
CREATE TABLE food_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100)
);

-- Chèn dữ liệu vào bảng food_type
INSERT INTO food_type (type_name) VALUES
("Italian"),
("Mexican"),
("Asian"),
("American"),
("French"),
("Mediterranean"),
("Indian"),
("Vegetarian"),
("Healthy"),
("Fast Food");

-- Tạo bảng food
CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(100),
    price FLOAT,
    image VARCHAR(255),
    description TEXT,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type (type_id)
);

-- Chèn dữ liệu vào bảng food
INSERT INTO food (food_name, price, image, description, type_id) VALUES
("Margherita Pizza", 12.99, "images/margherita_pizza.jpg", "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.", 1),
("Chicken Fajitas", 15.50, "images/chicken_fajitas.jpg", "Sizzling grilled chicken strips with peppers and onions, served with tortillas, salsa, and guacamole.", 2),
("Pad Thai", 11.75, "images/pad_thai.jpg", "Stir-fried rice noodles with chicken, vegetables, and a flavorful peanut sauce.", 3),
("Cheeseburger", 9.99, "images/cheeseburger.jpg", "All-American cheeseburger with a juicy beef patty, melted cheddar cheese, lettuce, tomato, and onion on a toasted bun.", 4),
("Ratatouille", 14.25, "images/ratatouille.jpg", "Provençal vegetable stew with eggplant, zucchini, tomatoes, and herbs.", 6),
("Butter Chicken", 13.95, "images/butter_chicken.jpg", "Creamy Indian curry with tender chicken in a spiced tomato gravy.", 7),
("Black Bean Burger", 10.50, "images/black_bean_burger.jpg", "Vegetarian burger made with black beans, corn, and spices, served on a whole wheat bun.", 8),
("Salmon with Roasted Vegetables", 18.75, "images/salmon_roasted_vegetables.jpg", "Grilled salmon fillet with roasted seasonal vegetables.", 5),
("Quinoa Salad", 11.25, "images/quinoa_salad.jpg", "Healthy and flavorful salad with quinoa, vegetables, and a light vinaigrette dressing.", 9),
("Chicken Tenders", 8.99, "images/chicken_tenders.jpg", "Crispy breaded chicken tenders with dipping sauces.", 10),
("Sushi Set", 17.50, "images/sushi_set.jpg", "Assortment of sushi pieces and nigiri.", 3),
("Beef Lasagna", 14.95, "images/beef_lasagna.jpg", "Classic Italian layered pasta dish with ground beef, tomato sauce, and béchamel sauce.", 1),
("Tacos Al Pastor", 12.25, "images/tacos_al_pastor.jpg", "Marinated pork tacos with pineapple, onions, and cilantro.", 2),
("Chicken Tikka Masala", 13.75, "images/chicken_tikka_masala.jpg", "Creamy Indian curry with marinated chicken in a tomato-based sauce.", 7),
("French Fries", 3.50, "images/french_fries.jpg", "Classic side dish of crispy French fries.", 10);

-- Tạo bảng orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food (food_id),
    amount INT,
    code VARCHAR(20),
    arr_sub_id VARCHAR(255)
);

-- Chèn dữ liệu vào bảng orders
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 3, 2, "ORDER123", "[1,2,3]"),
(2, 5, 1, "ORDER456", "[4,2,3]"),
(3, 1, 1, "ORDER789", "[1,2,3]"),
(4, 7, 3, "ORDER012", "[]"),
(1, 12, 1, "ORDER345", "[]"),
(5, 2, 2, "ORDER678", "[]"),
(3, 8, 1, "ORDER901", "[]"),
(2, 10, 2, "ORDER234", "[]"),
(4, 14, 1, "ORDER567", "[]"),
(1, 4, 1, "ORDER890", "[5,6,7]"),
(6, 11, 1, "ORDER102", "[1]"),
(7, 9, 2, "ORDER349", "[]"),
(8, 6, 1, "ORDER781", "[3,7,9]"),
(5, 13, 1, "ORDER092", "[]"),
(9, 15, 3, "ORDER510", "[]");

-- Tạo bảng sub_food
CREATE TABLE sub_food (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(100),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food (food_id)
);


------------------ câu 1: tìm 5 người like nhà hàng nhiều nhất
SELECT u.user_name, u.email, COUNT(lr.like_res_id) AS like_count
FROM like_res lr
JOIN users u ON lr.user_id = u.user_id
GROUP BY lr.user_id, u.user_name, u.email
ORDER BY like_count DESC
LIMIT 5;

------------------ câu 2: tìm 2 nhà hàng có lượt like nhiều nhất
SELECT r.res_name, r.description, COUNT(lr.like_res_id) AS like_count
FROM like_res lr
JOIN restaurant r ON lr.res_id = r.res_id
GROUP BY r.res_id, r.res_name, r.description
ORDER BY like_count DESC
LIMIT 2;

------------------ câu 3: tìm người đã đặt hàng nhiều nhất
SELECT u.user_name, u.email, COUNT(o.order_id) AS order_count
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY o.user_id, u.user_name, u.email
ORDER BY order_count DESC
LIMIT 1;

------------------ câu 4: Tìm người dùng không hoạt động trong hệ thống(không đặt hàng, không like, không đánh giá nhà hàng).
SELECT u.user_name, u.email
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.order_id IS NULL AND lr.like_res_id IS NULL AND rr.rate_res_id IS NULL;




