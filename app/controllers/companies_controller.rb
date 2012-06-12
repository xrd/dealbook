class CompaniesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    respond_with(@companies)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    respond_with(@company)
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new
    respond_with(@company)
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = 'Company was successfully created.'
    end
    respond_with(@company, :location => companies_url)
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = 'Company was successfully updated.'
    end
    respond_with(@company)
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = 'Company was successfully deleted.'
    respond_with(@company)
  end
end






