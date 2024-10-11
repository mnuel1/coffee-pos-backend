const express = require("express");
const app = express();
const cors = require("cors");
const morgan = require("morgan");

const { setupWebSocket } = require("./src/websocket/websocket");

const router = require("./src/routes/route");
const beverage = require("./src/routes/BeverageRoute");
const beverageImageRouter = require("./src/routes/BeverageImageHandlerRouter");

require("dotenv").config();

app.use(morgan("tiny"));
app.use(cors());
app.use(express.json());
app.use("/public", express.static("public"));

app.use(express.urlencoded({ extended: true }));
app.use("/api/v1", router);
app.use("/api/v1", beverageImageRouter);
app.use("/api/v1", beverage);

const server = app.listen(process.env.PORT, '0.0.0.0', () => {
  console.log(`Server is running on http://localhost:${process.env.PORT}`);
});

app.get("/", (req, res) => {
  res.send("WebSocket server is running");
});

setupWebSocket(server);
