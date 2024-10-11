const {
  createBeverage,
  readOneBeverage,
  readAllBeverages,
  updateBeverage,
  deleteBeverage,
  patchAvailable,
  patchUnavailable,
} = require("../services/BeverageService");

exports.create = async (req, res) => {
  try {
    const beverage = req.body;
    const response = await createBeverage(beverage);
    res.status(201).json(response);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

exports.getOne = async (req, res) => {
  try {
    const beverageId = req.params.id;
    const beverage = await readOneBeverage(beverageId);
    res.status(200).json(beverage);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

exports.getAll = async (req, res) => {
  try {
    const beverages = await readAllBeverages();
    res.status(200).json(beverages);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

exports.update = async (req, res) => {
  try {
    const beverageId = req.params.id;
    const beverageDTO = req.body;
    const response = await updateBeverage(beverageId, beverageDTO);
    res.status(200).json(response);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

exports.deleteBev = async (req, res) => {
  try {
    const beverageId = req.params.id;
    const response = await deleteBeverage(beverageId);
    res.status(200).json(response);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
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
