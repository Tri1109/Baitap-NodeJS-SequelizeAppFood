import mysql2 from "mysql2";
import express from "express";
import rootRouter from "./routes/rootRouter.js";

const app = express();
app.use(express.json());
app.use(rootRouter);
app.listen(8080);
