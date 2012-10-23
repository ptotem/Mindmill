class GnodesController < ApplicationController
  # GET /gnodes
  # GET /gnodes.json
  def index
    @gnodes = Gnode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gnodes }
    end
  end

  # GET /gnodes/1
  # GET /gnodes/1.json
  def show
    @gnode = Gnode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gnode }
    end
  end

  # GET /gnodes/new
  # GET /gnodes/new.json
  def new
    @gnode = Gnode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gnode }
    end
  end

  # GET /gnodes/1/edit
  def edit
    @gnode = Gnode.find(params[:id])
  end

  # POST /gnodes
  # POST /gnodes.json
  def create
    @gnode = Gnode.new(params[:gnode])

    respond_to do |format|
      if @gnode.save
        format.html { redirect_to @gnode, notice: 'Gnode was successfully created.' }
        format.json { render json: @gnode, status: :created, location: @gnode }
      else
        format.html { render action: "new" }
        format.json { render json: @gnode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gnodes/1
  # PUT /gnodes/1.json
  def update
    @gnode = Gnode.find(params[:id])

    respond_to do |format|
      if @gnode.update_attributes(params[:gnode])
        format.html { redirect_to @gnode, notice: 'Gnode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gnode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gnodes/1
  # DELETE /gnodes/1.json
  def destroy
    @gnode = Gnode.find(params[:id])
    @gnode.destroy

    respond_to do |format|
      format.html { redirect_to gnodes_url }
      format.json { head :no_content }
    end
  end
end
