class SearchesController < ApplicationController

  # def new
  #   @search = Search.new
  #   @subjects = Course.uniq.pluck(:subject)
  #   @code = Course.uniq.pluck(:code)
  # end
  #
  # def create
  #   @search = Search.create(params.permit[:search])
  #   redirect_to @search
  # end
  #
  # def show
  #   @search = Search.find(params[:id])
  # end
  #
  # private
  #
  # def search_params
  #   params.permit(:search).permit(:keywords, :subjects, :code)
  # end

  def new
    @search = Search.new
    @code = Course.uniq.pluck(:code)
    
    @subject = Subject.uniq.pluck(:subject)
  end

  def create
    @search = Search.create!(allowed_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def allowed_params
    params.require(:search).permit!
  end

end
