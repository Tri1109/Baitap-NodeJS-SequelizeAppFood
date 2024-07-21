import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const models = initModels(sequelize);

const createOrder = async (req, res) => {
  try {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;
    if (!user_id || !food_id || !amount || !code) {
      return res
        .status(400)
        .json({ error: "user_id, food_id, amount, and code are required" });
    }
    const order = await models.orders.create({
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    });
    res.status(201).json({ message: "Order placed successfully", order });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const getOrdersByUser = async (req, res) => {
  try {
    const { user_id } = req.params;
    const orders = await models.orders.findAll({ where: { user_id } });
    res.status(200).json(orders);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export { createOrder, getOrdersByUser };
