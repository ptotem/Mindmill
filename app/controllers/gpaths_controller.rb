class GpathsController < ApplicationController
  # GET /gpaths
  # GET /gpaths.json
  def index
    @gpaths = Gpath.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gpaths }
    end
  end

  # GET /gpaths/1
  # GET /gpaths/1.json
  def show
    @gpath = Gpath.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gpath }
    end
  end

  # GET /gpaths/new
  # GET /gpaths/new.json
  def new
    @gpath = Gpath.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gpath }
    end
  end

  # GET /gpaths/1/edit
  def edit
    @gpath = Gpath.find(params[:id])
  end

  # POST /gpaths
  # POST /gpaths.json
  def create
    @gpath = Gpath.new(params[:gpath])

    respond_to do |format|
      if @gpath.save
        format.html { redirect_to @gpath, notice: 'Gpath was successfully created.' }
        format.json { render json: @gpath, status: :created, location: @gpath }
      else
        format.html { render action: "new" }
        format.json { render json: @gpath.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gpaths/1
  # PUT /gpaths/1.json
  def update
    @gpath = Gpath.find(params[:id])

    respond_to do |format|
      if @gpath.update_attributes(params[:gpath])
        format.html {
            if request.xhr?
              # *** repond with the new value ***
              render :text => @gpath.markup
            else
              redirect_to(@user, :notice => 'User was successfully updated.')
            end
          }
      else
        format.html { render action: "edit" }
        format.json { render json: @gpath.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpaths/1
  # DELETE /gpaths/1.json
  def destroy
    @gpath = Gpath.find(params[:id])
    @gpath.destroy

    respond_to do |format|
      format.html { redirect_to gpaths_url }
      format.json { head :no_content }
    end
  end
end
