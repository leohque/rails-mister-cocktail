class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = []
    Ingredient.all.each do |ingredient|
      @ingredients << ingredient.name
    end
    @ingredients.sort!
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.where(name: params[:dose][:ingredient])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient[0]

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail_id
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
