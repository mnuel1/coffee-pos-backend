const express = require("express");
const router = express.Router();

const {
  create,
  getOne,
  getAll,
  update,
  deleteBev,
} = require("../controllers/BeverageController");

router.route("/beverages").post(create);
router.route("/beverages/:id").get(getOne);
router.route("/beverages").get(getAll);
router.route("/beverages/:id").put(update);
router.route("/beverages/:id").delete(deleteBev);

module.exports = router;
