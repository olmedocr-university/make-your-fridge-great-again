class FoodsController < ApplicationController
  before_action only: [:options]

  def options
    if params[:category_id]
      foods = Food.where(category_id: params[:category_id])
      options = foods.collect {|food| "\"#{food.id}\" : \"#{food.title}\""}
    else
      categories = Category.all
      options = categories.collect {|category| "\"#{category.id}\" : \"#{category.title}\""}
    end

    render json: "{#{options.join(",")}}"
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def foods_params

    params.require(:category_id)
  end
end
