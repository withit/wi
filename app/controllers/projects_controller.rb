class ProjectsController < ApplicationController
  before_filter :authorize, :except => [:show, :index, :helped]
  before_filter :load_page, :except => :helped
  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 4, :order => 'position')
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create!(params[:project])
    flash[:notice] = t('flash.project.create')
    redirect_to projects_path
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes!(params[:project])
    flash[:notice] = t('flash.project.update')
    redirect_to projects_path
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = t('flash.project.delete')
    redirect_to projects_path
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def helped
    @page = Page.find_by_permalink 'who_we_helped'
    @projects = Project.who_we_helped
  end
  
  protected
  
  def load_page
    @page = Page.find_by_permalink 'websites'
  end
end
