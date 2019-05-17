class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktails_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
