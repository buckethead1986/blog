class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.save
    redirect_to @page
  end

  def edit
  end

  def update
    @page.update(page_params)
    redirect_to @page
  end

  def destroy
    @page.destroy
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :slug)
  end

# DRY refactoring for repeated @page finding. used in the before_action method so that it doesnt need to be explicitly called in any method.
  def set_page
    @page = Page.find_by(id: params[:id])
  end
end
