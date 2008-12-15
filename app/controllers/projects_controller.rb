class ProjectsController < ApplicationController
  before_filter :authorize, :except => [:show, :index]
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create!(params[:project])
    flash[:notice] = "Project was successfully created"
    redirect_to projects_path
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes!(params[:project])
    redirect_to projects_path
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  
  def show
    @project = Project.find(params[:id])
  end
end
