class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to add_ingredients_path(@recipe.id)
    else
      flash[:danger] = @recipe.errors.full_messages
      render :new
    end
  end

  def add_ingredients
    @recipe = Recipe.find(params[:id])
  end

  def create_ingredients
    @recipe = Recipe.find(params[:id])
    # Reset, this is more advanced
    # @recipe.ingredient_ids = params[:ingredients]

    ingredients = params[:ingredients]

    ingredients.each do |ingredient_id|
      i = Ingredient.find(ingredient_id)
      # Need to << into the collection, not just the object.
      @recipe.ingredients << i
    end

    redirect_to recipe_path(@recipe)
  end

private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients: [] )
  end 
end