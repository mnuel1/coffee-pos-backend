class Beverage {
  constructor(
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
    category
  ) {
    this.idNo = idNo;
    this.name = name;
    this.description = description;
    this.sugarLevel = sugarLevel;
    this.price = price;
    this.calories = calories;
    this.beverageImg = beverageImg;
    this.isPopular = isPopular;
    this.isFeatured = isFeatured;
    this.isAvailable = isAvailable;
    this.category = category;
  }
}

module.exports = Beverage;
