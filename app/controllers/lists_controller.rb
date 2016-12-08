class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.find(current_browser_lists).last(5)
    @list = List.new
  end

  def show
    @tasks = @list.tasks
    @created_date = @list.created_at.to_date.to_formatted_s(:long)
    @slug_link = url_for controller: 'lists', action: 'show', only_path: false

    modification_dates = @list.tasks.map { |task| task.updated_at }
    modification_dates << @list.updated_at
    @last_modified = modification_dates.reduce { |biggest, date| [biggest, date].max }
    @last_modified = @last_modified.to_date.to_formatted_s(:long)
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    if @list.save
      current_browser_lists << @list.id
      redirect_to @list, notice: 'List was successfully created.'
    else
      @lists = List.find(current_browser_lists).last(5)
      render :index
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :show
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_list
      @list = List.find_by(slug: params[:id])
    end

    def list_params
      params.require(:list).permit(:title)
    end
end
