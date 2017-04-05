class SearchesController < ApplicationController

  def new
    @search = Search.new
    @subject = Subject.all.pluck(:name)

  end

  def create
    @search = Search.create!(allowed_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    @totalPages = @search.length
    @totalPages = @totalPages/15
    puts @totalPages

  end

  def results

    @page = 1
    @courses = Course.search(params[:keywords], params[:subjects][:name])
    @keywords = params[:keywords]
    @subjects = params[:subjects][:name]

    respond_to do |format|
      format.js
    end


  end

  def results1
    @page = params[:page].to_i
    @courses = Course.search(params[:keywords], params[:subjects])
    @keywords = params[:keywords]
    @subjects = params[:subjects]
    render 'results'
  end

  private

  def allowed_params
    params.require(:search).permit!
  end

end
