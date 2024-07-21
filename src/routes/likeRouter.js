import express from "express";
import {
  likeRestaurant,
  unlikeRestaurant,
  getLikesByRestaurant,
  getLikesByUser,
} from "../controllers/like.controller.js";

const likeRouter = express.Router();

likeRouter.post("/like", likeRestaurant);
likeRouter.delete("/like", unlikeRestaurant);
likeRouter.get("/likes/restaurant/:res_id", getLikesByRestaurant);
likeRouter.get("/likes/user/:user_id", getLikesByUser);

export default likeRouter;
