const {
  createBeverage,
  readOneBeverage,
  readAllBeverages,
  updateBeverage,
  deleteBeverage,
  patchAvailable,
  patchUnavailable,
  readPopularBeverages
} = require("../services/BeverageService");

exports.create = async (req, res) => {
  const beverage = req.body;
  const response = await createBeverage(beverage);
  res.status(response.status).json({ message: response.message });
};

exports.getOne = async (req, res) => {
  const beverageId = req.params.id;
  const response = await readOneBeverage(beverageId);
  res.status(response.status).json(response.status === 200 ? response.beverage : { message: response.message });
};

exports.getAll = async (req, res) => {
  const response = await readAllBeverages();
  res.status(response.status).json(response.status === 200 ? response.beverages : { message: response.message });
};

exports.update = async (req, res) => {
  const beverageId = req.params.id;
  const beverageDTO = req.body;
  const response = await updateBeverage(beverageId, beverageDTO);
  res.status(response.status).json({ message: response.message });
};

exports.deleteBev = async (req, res) => {
  const beverageId = req.params.id;
  const response = await deleteBeverage(beverageId);
  res.status(response.status).json({ message: response.message })
};

exports.patchBeverageAvailable = async (req, res) => {
  const beverageId = req.params.id;
  const response = await patchAvailable(beverageId);
  res.status(response.status).json({ message: response.message });
};

exports.patchBeverageUnavailable = async (req, res) => {
  const beverageId = req.params.id;
  const response = await patchUnavailable(beverageId);
  res.status(response.status).json({ message: response.message });
};

exports.getPopularBeverages = async (req, res) => {
  const response = await readPopularBeverages();
  res.status(response.status).json(response.status === 200 ? response.popularBeverages : response.message)
}