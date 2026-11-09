class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.includes(:category).order(:name)

    if params[:category_id].present?
      @attractions = @attractions.where(category_id: params[:category_id])
    end

    if params[:search].present?
      search_term = "%#{params[:search]}%"

      @attractions = @attractions.where(
        "name LIKE ? OR description LIKE ? OR address LIKE ?",
        search_term, search_term, search_term
      )
    end

    @per_page = 12
    @total_count = @attractions.count
    @total_pages = [(@total_count.to_f / @per_page).ceil, 1].max

    @page = params[:page].to_i
    @page = 1 if @page < 1
    @page = @total_pages if @page > @total_pages

    @attractions = @attractions.offset(
      (@page - 1) * @per_page
    ).limit(@per_page)
  end

  def show
    @attraction = Attraction.includes(:category).find(params[:id])
  end

end