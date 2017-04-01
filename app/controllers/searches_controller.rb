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
    @subject = Subject.all.pluck(:name)
  end

  def index
    @searches = Search.paginate(:page => params[:page], :per_page => 15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
      format.js
    end
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
