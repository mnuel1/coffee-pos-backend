const db = require("../database/db");
const Beverage = require("../models/Beverage");

exports.createBeverage = async (beverageDTO) => {
  const {
    idNo,
    name,
    description,
    sugarLevel,
    price,
    calories,
    beverageImg,
    isPopular,
    isFeatured,
    isAvailable,
    category,
  } = beverageDTO;

  const beverage = new Beverage(
    idNo,
    name,
    description,
    sugarLevel,
    [price.small, price.medium, price.large],
    [calories.small, calories.medium, calories.large],
    beverageImg,
    isPopular,
    isFeatured,
    isAvailable,
    category
  );

  beverage.isAvailable = true;
  beverage.beverageImg = `${beverageImg}`;

  try {
    const [results] = await db.query(
      `INSERT INTO beverages (name, description, sugar_level, price, calories, beverage_img, is_popular, is_featured, is_available, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        beverage.name,
        beverage.description,
        JSON.stringify(beverage.sugarLevel),
        JSON.stringify(beverage.price),
        JSON.stringify(beverage.calories),
        beverage.beverageImg,
        beverage.isPopular,
        beverage.isFeatured,
        beverage.isAvailable,
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

exports.readOneBeverage = async (beverageId) => {
  try {
    const [results] = await db.query(
      `SELECT * FROM beverages WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.length) {
      const beverage = results[0];

      beverage.sugar_level = JSON.parse(beverage.sugar_level);
      beverage.price = JSON.parse(beverage.price);
      beverage.calories = JSON.parse(beverage.calories);
      beverage.category = JSON.parse(beverage.category);

      const formattedBeverage = {
        beverage_id: beverage.beverage_id,
        name: beverage.name,
        description: beverage.description,
        sugarLevel: beverage.sugar_level,
        price: {
          small: beverage.price[0],
          medium: beverage.price[1],
          large: beverage.price[2],
        },
        calories: {
          small: beverage.calories[0],
          medium: beverage.calories[1],
          large: beverage.calories[2],
        },
        beverageImg: beverage.beverage_img,
        isPopular: !!beverage.is_popular,
        isFeatured: !!beverage.is_featured,
        isAvailable: !!beverage.is_available,
        category: beverage.category,
      };

      return formattedBeverage;
    }
  } catch (err) {
    console.error(err);
  }
};

exports.readAllBeverages = async () => {
  try {
    const [results] = await db.query(`SELECT * FROM beverages`);

    const formattedBeverages = results.map((beverage) => {
      beverage.sugar_level = JSON.parse(beverage.sugar_level);
      beverage.price = JSON.parse(beverage.price);
      beverage.calories = JSON.parse(beverage.calories);
      beverage.category = JSON.parse(beverage.category);

      return {
        id: beverage.beverage_id,
        name: beverage.name,
        description: beverage.description,
        sugarLevel: beverage.sugar_level,
        price: {
          small: beverage.price[0],
          medium: beverage.price[1],
          large: beverage.price[2],
        },
        calories: {
          small: beverage.calories[0],
          medium: beverage.calories[1],
          large: beverage.calories[2],
        },
        beverageImg: beverage.beverage_img,
        isPopular: !!beverage.is_popular,
        isFeatured: !!beverage.is_featured,
        isAvailable: !!beverage.is_available,
        category: beverage.category,
      };
    });

    return formattedBeverages;
  } catch (err) {
    console.error(err);
  }
};

exports.updateBeverage = async (beverageId, beverageDTO) => {
  const {
    idNo,
    name,
    description,
    sugarLevel,
    price,
    calories,
    beverageImg,
    isPopular,
    isFeatured,
    isAvailable,
    category,
  } = beverageDTO;

  const beverage = new Beverage(
    idNo,
    name,
    description,
    sugarLevel,
    [price.small, price.medium, price.large],
    [calories.small, calories.medium, calories.large],
    beverageImg,
    isPopular,
    isFeatured,
    isAvailable,
    category
  );

  try {
    const [results] = await db.query(
      `UPDATE beverages SET name = ?, description = ?, sugar_level = ?, price = ?, calories = ?, beverage_img = ?, is_popular = ?, is_featured = ?, is_available = ?, category = ? WHERE beverage_id = ?`,
      [
        beverage.name,
        beverage.description,
        JSON.stringify(beverage.sugarLevel),
        JSON.stringify(beverage.price),
        JSON.stringify(beverage.calories),
        beverage.beverageImg,
        beverage.isPopular,
        beverage.isFeatured,
        beverage.isAvailable,
        JSON.stringify(beverageDTO.category),
        beverageId,
      ]
    );

    if (results.affectedRows) {
      return {
        title: "Beverage Updated",
        message: "Beverage details have been updated",
      };
    }
  } catch (err) {
    console.error(err);
  }
};

exports.deleteBeverage = async (beverageId) => {
  try {
    const [results] = await db.query(
      `DELETE FROM beverages WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.affectedRows) {
      return {
        title: "Beverage Deleted",
        message: "Beverage has been removed from the menu",
      };
    }
  } catch (err) {
    console.error(err);
  }
};

exports.patchAvailable = async (beverageId) => {
  try {
    const [results] = await db.query(
      `UPDATE beverages SET is_available = true WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.affectedRows) {
      return {
        title: "Beverage Availability Updated",
        message: "Beverage availability has been updated",
      };
    }
  } catch (err) {
    console.error(err);
  }
};

exports.patchUnavailable = async (beverageId) => {
  try {
    const [results] = await db.query(
      `UPDATE beverages SET is_available = false WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.affectedRows) {
      return {
        title: "Beverage Availability Updated",
        message: "Beverage availability has been updated",
      };
    }
  } catch (err) {
    console.error(err);
  }
};
