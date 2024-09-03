const db = require("../database/db");
const Beverage = require("../models/Beverage");

exports.createBeverage = async (beverageDTO) => {
  const {
    name,
    description,
    sugarLevel,
    price,
    calories,
    beverageImg,
    isPopular,
    isFeatured,
    category,
  } = beverageDTO;

  const beverage = new Beverage(
    name,
    description,
    sugarLevel,
    [price.small, price.medium, price.large],
    [calories.small, calories.medium, calories.large],
    beverageImg,
    isPopular,
    isFeatured,
    category
  );

  try {
    const [results] = await db.query(
      `INSERT INTO beverages (name, description, sugar_level, price, calories, beverage_img, is_popular, is_featured, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        beverage.name,
        beverage.description,
        JSON.stringify(beverage.sugarLevel),
        JSON.stringify(beverage.price),
        JSON.stringify(beverage.calories),
        beverage.beverageImg,
        beverage.isPopular,
        beverage.isFeatured,
        JSON.stringify(beverageDTO.category),
      ]
    );

    if (results.affectedRows) {
      return {
        title: "Beverage Created",
        message: "Beverage has been added to the menu",
      };
    }
  } catch (err) {
    console.error(err);
  }
};
