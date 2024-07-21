import express from "express";
import {
  rateRestaurant,
  getRatesByRestaurant,
  getRatesByUser,
} from "../controllers/rate.controller.js";

const rateRouter = express.Router();

rateRouter.post("/rate", rateRestaurant);
rateRouter.get("/rates/restaurant/:res_id", getRatesByRestaurant);
rateRouter.get("/rates/user/:user_id", getRatesByUser);

export default rateRouter;
