class RolesController < ApplicationController

  def index
    @roles = Role.all

  end

  def show
    @role = Role.find_by(:id => params[:id])
  end

  def new
    @actors = Actor.all.order(:name)
    @movie = Movie.find_by(id: params[:movie_id])
  end

  def create
    @role = Role.new
    @role.name = params[:name]
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]

    if @role.save
      redirect_to movie_url(params[:movie_id])
    else
      render 'new'
    end
  end

  def edit
    @role = Role.find_by(:id => params[:id])
  end

  def update
    @role = Role.find_by(:id => params[:id])
    @role.name = params[:name]
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]

    if @role.save
      redirect_to roles_url
    else
      render 'new'
    end
  end

  def destroy
    @role = Role.find_by(:id => params[:id])
    @role.destroy
    redirect_to roles_url
  end
end
