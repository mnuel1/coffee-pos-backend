const express = require("express");
const router = express.Router();

const { create } = require("../controllers/BeverageController");

router.route("/beverages").post(create);

module.exports = router;
