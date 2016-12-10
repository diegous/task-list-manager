class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.find(current_browser_lists).last(5)
    @list = List.new
  end

  def show
    # Mark Temporary tasks as expired
    @list.tasks.each do |task|
      if task.has_expired?
        task.update(state: State.find_by(name: 'expired'))
      end
    end

    @tasks = @list.tasks.order(priority_id: :desc)
    @slug_link = url_for controller: 'lists', action: 'show', only_path: false
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

  # def destroy
  #   @list.destroy
  #   respond_to do |format|
  #     redirect_to lists_url, notice: 'List was successfully destroyed.'
  #   end
  # end

  private
    def set_list
      @list = List.find_by(slug: params[:id])
    end

    def list_params
      params.require(:list).permit(:title)
    end
end
