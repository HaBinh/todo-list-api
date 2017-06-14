class ListsController < ApplicationController
    before_action :get_list, only: [:show, :update, :destroy]
    
    def index
        @lists = List.search(params[:search])
    end

    def create
        @list = List.new(list_params)
        if @list.save
          render json: @list, status: :created, location: @list
        else
          render json: @list.errors, status: :unprocessable_entity
        end
    end

    def show
        @tasks = @list.tasks
    end

    def update
        @list.update_attribute(:title, params[:list][:title])
        head :ok
    end

    def destroy 
        @list.destroy
        head :ok
    end

  private 
    def list_params
      params.permit(:title)
    end

    def get_list
      @list = List.find(params[:id])
    end
end
