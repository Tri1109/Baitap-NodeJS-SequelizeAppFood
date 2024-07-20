import mysql2 from 'mysql2'
import express from 'express'

const app = express();
app.use(express.json())
app.listen(8080);


const connect = mysql2.createConnection({
    host:"localhost",
    user:"root",
    password:"123456",
    port:"3307",
    database:"db_restaurant"

})

app.get("/get-user", (req,res) => {
    connect.query("SELECT * from users", (err, result) => {
        res.send(result)
    })
})

// Handle "Like" restaurant
app.post('/like', (req, res) => {
    const { user_id, res_id } = req.body;
    const query = 'INSERT INTO like_res (user_id, res_id, date_like) VALUES (?, ?, NOW())';
    connect.query(query, [user_id, res_id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ message: 'Liked successfully' });
    });
});

// Handle "Unlike" restaurant
app.delete('/like', (req, res) => {
    const { user_id, res_id } = req.body;
    const query = 'DELETE FROM like_res WHERE user_id = ? AND res_id = ?';
    connect.query(query, [user_id, res_id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json({ message: 'Unliked successfully' });
    });
});

// Like list of restaurant
app.get('/likes/restaurant/:res_id', (req, res) => {
    const { res_id } = req.params;
    const query = 'SELECT * FROM like_res WHERE res_id = ?';
    connect.query(query, [res_id], (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json(results);
    });
});

// Like list of user
app.get('/likes/user/:user_id', (req, res) => {
    const { user_id } = req.params;
    const query = 'SELECT * FROM like_res WHERE user_id = ?';
    connect.query(query, [user_id], (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json(results);
    });
});

// Handle rating
app.post('/rate', (req, res) => {
    const { user_id, res_id, amount } = req.body;
    const query = 'INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES (?, ?, ?, NOW())';
    connect.query(query, [user_id, res_id, amount], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ message: 'Rated successfully' });
    });
});

// Rating list of restaurant
app.get('/rates/restaurant/:res_id', (req, res) => {
    const { res_id } = req.params;
    const query = 'SELECT * FROM rate_res WHERE res_id = ?';
    connect.query(query, [res_id], (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json(results);
    });
});

// Rating list of user
app.get('/rates/user/:user_id', (req, res) => {
    const { user_id } = req.params;
    const query = 'SELECT * FROM rate_res WHERE user_id = ?';
    connect.query(query, [user_id], (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json(results);
    });
});

// User order
app.post('/order', (req, res) => {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;
    const query = 'INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES (?, ?, ?, ?, ?)';
    connect.query(query, [user_id, food_id, amount, code, arr_sub_id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ message: 'Order placed successfully' });
    });
});