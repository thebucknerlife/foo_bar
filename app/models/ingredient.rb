class Ingredient < ActiveRecord::Base

  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

  def quantity(recipe)
    return self.ingredient_recipes.find_by(recipe: recipe).quantity
  end

end
