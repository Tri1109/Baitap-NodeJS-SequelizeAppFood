import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const models = initModels(sequelize);

const likeRestaurant = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;
    if (!user_id || !res_id) {
      return res.status(400).json({ error: "user_id and res_id are required" });
    }
    const like = await models.like_res.create({
      user_id,
      res_id,
      date_like: new Date(),
    });
    res.status(201).json({ message: "Liked successfully", like });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const unlikeRestaurant = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;
    if (!user_id || !res_id) {
      return res.status(400).json({ error: "user_id and res_id are required" });
    }
    const result = await models.like_res.destroy({
      where: { user_id, res_id },
    });
    if (result === 0) {
      return res.status(404).json({ error: "Like not found" });
    }
    res.status(200).json({ message: "Unliked successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const getLikesByRestaurant = async (req, res) => {
  try {
    const { res_id } = req.params;
    const likes = await models.like_res.findAll({ where: { res_id } });
    res.status(200).json(likes);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const getLikesByUser = async (req, res) => {
  try {
    const { user_id } = req.params;
    const likes = await models.like_res.findAll({ where: { user_id } });
    res.status(200).json(likes);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export {
  likeRestaurant,
  unlikeRestaurant,
  getLikesByRestaurant,
  getLikesByUser,
};
