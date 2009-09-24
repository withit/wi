class NewsLettersController < ApplicationController
  # GET /news_letters
  # GET /news_letters.xml
  before_filter :load_page
  def index
    @news_letters = NewsLetter.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_letters }
    end
  end

  # GET /news_letters/1
  # GET /news_letters/1.xml
  def show
    @hide_extras = true  
    @news_letter = NewsLetter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_letter }
    end
  end

  # GET /news_letters/new
  # GET /news_letters/new.xml
  def new
    @news_letter = NewsLetter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_letter }
    end
  end

  # GET /news_letters/1/edit
  def edit
    @news_letter = NewsLetter.find(params[:id])
  end

  # POST /news_letters
  # POST /news_letters.xml
  def create
    @news_letter = NewsLetter.new(params[:news_letter])

    respond_to do |format|
      if @news_letter.save
        flash[:notice] = 'NewsLetter was successfully created.'
        format.html { redirect_to(@news_letter) }
        format.xml  { render :xml => @news_letter, :status => :created, :location => @news_letter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_letter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_letters/1
  # PUT /news_letters/1.xml
  def update
    @news_letter = NewsLetter.find(params[:id])

    respond_to do |format|
      if @news_letter.update_attributes(params[:news_letter])
        flash[:notice] = 'NewsLetter was successfully updated.'
        format.html { redirect_to(@news_letter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_letter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_letters/1
  # DELETE /news_letters/1.xml
  def destroy
    @news_letter = NewsLetter.find(params[:id])
    @news_letter.destroy

    respond_to do |format|
      format.html { redirect_to(news_letters_url) }
      format.xml  { head :ok }
    end
  end

  protected
  
  def load_page
    @page = Page.find_by_permalink 'email-campaigns'
  end
end
