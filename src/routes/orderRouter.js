import express from "express";
import {
  createOrder,
  getOrdersByUser,
} from "../controllers/order.controller.js";

const orderRouter = express.Router();

orderRouter.post("/order", createOrder);
orderRouter.get("/orders/user/:user_id", getOrdersByUser);

export default orderRouter;
