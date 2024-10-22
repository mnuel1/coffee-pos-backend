const express = require("express");
const router = express.Router();

const {
  create,
  getOne,
  getAll,
  update,
  deleteBev,
  patchBeverageAvailable,
  patchBeverageUnavailable,
  getPopularBeverages
} = require("../controllers/BeverageController");

router.route("/beverages")
  .post(create)
  .get(getAll);

router.route("/beverages/popular")
  .get(getPopularBeverages);

router.route("/beverages/:id")
  .get(getOne)
  .put(update)
  .delete(deleteBev);

router.route("/beverages/:id/available")
  .patch(patchBeverageAvailable);

router.route("/beverages/:id/unavailable")
  .patch(patchBeverageUnavailable);

module.exports = router;
