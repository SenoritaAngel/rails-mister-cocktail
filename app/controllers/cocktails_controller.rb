class CocktailsController < ApplicationController
  def home
  end

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url)
  end
end
