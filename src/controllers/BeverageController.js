const { createBeverage } = require("../services/BeverageService");

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
