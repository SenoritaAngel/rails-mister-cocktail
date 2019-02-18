class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    params[:dose][:ingredient_id].each do |ingredient_id|
      @dose = Dose.new(ingredient_id: ingredient_id)
      @dose.plant = @cocktail
      @dose.save
    end
    redirect_to cocktail_path(@cocktail.id)
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:name, :description, :image_url)
  end
end
