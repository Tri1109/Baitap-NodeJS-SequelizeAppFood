import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const models = initModels(sequelize);

const rateRestaurant = async (req, res) => {
  try {
    const { user_id, res_id, amount } = req.body;
    if (!user_id || !res_id || !amount) {
      return res
        .status(400)
        .json({ error: "user_id, res_id, and amount are required" });
    }
    const rate = await models.rate_res.create({
      user_id,
      res_id,
      amount,
      date_rate: new Date(),
    });
    res.status(201).json({ message: "Rated successfully", rate });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const getRatesByRestaurant = async (req, res) => {
  try {
    const { res_id } = req.params;
    const rates = await models.rate_res.findAll({ where: { res_id } });
    res.status(200).json(rates);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const getRatesByUser = async (req, res) => {
  try {
    const { user_id } = req.params;
    const rates = await models.rate_res.findAll({ where: { user_id } });
    res.status(200).json(rates);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export { rateRestaurant, getRatesByRestaurant, getRatesByUser };
