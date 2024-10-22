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
    subCategories
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
    category,
    subCategories
  );

  beverage.isAvailable = true;
  beverage.beverageImg = `${beverageImg}`;

  try {
    const [results] = await db.query(
      `INSERT INTO beverages (name, description, sugar_level, price, calories, beverage_img, is_popular, is_featured, is_available, category, sub_categories) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
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
        beverage.category,
        JSON.stringify(beverage.subCategories)
      ]
    );

    if (results.affectedRows) {
      return {
        status: 201,
        message: "Beverage has been added to the menu.",
      };
    } else {
      return {
        status: 500, // Internal Server Error
        message: "Failed to create beverage. Please try again."
      };
    }
  } catch (err) {
    if (err.errno === 1048) {
      return {
        status: 400,
        message: "Required fields cannot be empty."
      }
    } else {
      return {
        status: 500, // Internal Server Error
        message: "An unexpected error occurred. Please try again later."
      };
    }
  }
};

exports.readOneBeverage = async (beverageId) => {
  try {
    const [results] = await db.query(
      `SELECT * FROM beverages WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.length === 0) {
      return {
        status: 404,
        message: "Beverage was not found."
      }
    }

    const beverage = results[0];

    beverage.sugar_level = JSON.parse(beverage.sugar_level);
    beverage.price = JSON.parse(beverage.price);
    beverage.calories = JSON.parse(beverage.calories);
    beverage.sub_categories = JSON.parse(beverage.sub_categories);

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
      subCategories: beverage.sub_categories
    }

    return {
      status: 200,
      beverage: formattedBeverage
    }
  } catch (err) {
    return {
      status: 500, // Internal Server Error
      message: "An error occurred while retrieving the beverage. Please try again later."
    };
  }
};

exports.readAllBeverages = async () => {
  try {
    const [results] = await db.query(`SELECT * FROM beverages`);

    const formattedBeverages = results.map((beverage) => {
      beverage.sugar_level = JSON.parse(beverage.sugar_level);
      beverage.price = JSON.parse(beverage.price);
      beverage.calories = JSON.parse(beverage.calories);
      beverage.sub_categories = JSON.parse(beverage.sub_categories);

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
        subCategories: beverage.sub_categories
      };
    });

    return {
      status: 200,
      beverages: formattedBeverages
    };
  } catch (err) {
    return {
      status: 500, // Internal Server Error
      message: "An error occurred while retrieving the beverages. Please try again later."
    };
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
    subCategories
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
    category,
    subCategories
  );

  try {
    const [results] = await db.query(
      `UPDATE beverages SET name = ?, description = ?, sugar_level = ?, price = ?, calories = ?, beverage_img = ?, is_popular = ?, is_featured = ?, is_available = ?, category = ?, sub_categories = ? WHERE beverage_id = ?`,
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
        beverage.category,
        JSON.stringify(beverage.subCategories),
        beverageId,
      ]
    );

    if (results.affectedRows === 0) {
      return {
        status: 404,
        message: `Beverage was not found.`
      }
    }

    return {
      status: 200,
      message: "Beverage details have been updated"
    }

  } catch (err) {
    return {
      status: 500, // Internal Server Error
      message: "An error occurred while updating the beverage. Please try again later."
    };
  }
};

exports.deleteBeverage = async (beverageId) => {
  try {
    const [results] = await db.query(
      `DELETE FROM beverages WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.affectedRows === 0) {
      return {
        status: 404,
        message: "Beverage was not found.",
      };
    }

    return {
      status: 200,
      message: "Beverage deleted successfully."
    }
  } catch (err) {
    if (err.errno === 1451) {
      return {
        status: 409,
        message: "Unable to delete. Beverage has been ordered already."
      }
    } else {
      return {
        status: 500, // Internal Server Error
        message: "An error occurred while deleting the beverage. Please try again later."
      };
    }
  }
};

exports.patchAvailable = async (beverageId) => {
  try {
    const [results] = await db.query(
      `UPDATE beverages SET is_available = true WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.affectedRows === 0) {
      return {
        status: 404,
        message: "Beverage was not found."
      }
    }

    return {
      status: 200,
      message: "Beverage is now available.",
    };

  } catch (err) {
    return {
      status: 500, // Internal Server Error
      message: "An error occurred while patching the beverage. Please try again later."
    };
  }
};

exports.patchUnavailable = async (beverageId) => {
  try {
    const [results] = await db.query(
      `UPDATE beverages SET is_available = false WHERE beverage_id = ?`,
      [beverageId]
    );

    if (results.affectedRows === 0) {
      return {
        status: 404,
        message: "Beverage was not found."
      }
    }

    return {
      status: 200,
      message: "Beverage is now unavailable.",
    };
  } catch (err) {
    return {
      status: 500, // Internal Server Error
      message: "An error occurred while patching the beverage. Please try again later."
    };
  }
};

exports.readPopularBeverages = async () => {
  try {
    const [results] = await db.query(
      `SELECT b.beverage_id, b.name, b.description, b.price, b.calories, b.beverage_img, b.is_popular, b.is_featured, b.is_available, b.category, COUNT(ob.beverage_id) AS order_count
       FROM order_beverages ob
       INNER JOIN beverages b ON ob.beverage_id = b.beverage_id
       GROUP BY b.beverage_id
       ORDER BY order_count DESC
       LIMIT 10`
    );

    const popularBeverages = results.map((beverage) => {
      beverage.price = JSON.parse(beverage.price);
      beverage.calories = JSON.parse(beverage.calories);
      beverage.category = JSON.parse(beverage.category);

      return {
        id: beverage.beverage_id,
        name: beverage.name,
        description: beverage.description,
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
        orderCount: beverage.order_count,
      };
    });

    return {
      status: 200,
      popularBeverages
    }

  } catch (err) {
    return {
      status: 500, // Internal Server Error
      message: "An error occurred while retrieving the beverages. Please try again later."
    };
  }
};
