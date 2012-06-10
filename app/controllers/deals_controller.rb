class DealsController < ApplicationController
  load_and_authorize_resource

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deals }
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/new
  # GET /deals/new.json
  def new
    @deal = Deal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/1/edit
  def edit
    @deal = Deal.find(params[:id])
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(params[:deal])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to deals_path, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deals/1
  # PUT /deals/1.json
  def update
    @deal = Deal.find(params[:id])
    @deal.verified = false

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def verify
    @deal = Deal.find(params[:id])
    @deal.verified = true

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was marked as verified.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def unverify
    @deal = Deal.find(params[:id])
    @deal.verified = false

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was marked as unverified.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end
end


