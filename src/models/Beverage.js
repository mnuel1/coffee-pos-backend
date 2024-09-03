class Beverage {
  constructor(
    name,
    description,
    sugarLevel,
    price,
    calories,
    beverageImg,
    isPopular,
    isFeatured,
    category
  ) {
    this.name = name;
    this.description = description;
    this.sugarLevel = sugarLevel;
    this.price = price;
    this.calories = calories;
    this.beverageImg = beverageImg;
    this.isPopular = isPopular;
    this.isFeatured = isFeatured;
    this.category = category;
  }
}

module.exports = Beverage;
