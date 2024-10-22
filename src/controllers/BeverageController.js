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
  try {
    const beverageId = req.params.id;
    const response = await patchAvailable(beverageId);
    res.status(200).json(response);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

exports.patchBeverageUnavailable = async (req, res) => {
  try {
    const beverageId = req.params.id;
    const response = await patchUnavailable(beverageId);
    res.status(200).json(response);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

exports.getPopularBeverages = async (req, res) => {
  const response = await readPopularBeverages();
  res.status(response.status).json(response.status === 200 ? response.popularBeverages : response.message)
}