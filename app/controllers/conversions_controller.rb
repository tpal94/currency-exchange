# frozen_string_literal: true

require 'net/http'
class ConversionsController < ApplicationController
  before_action :set_conversion, only: %i[show edit update destroy]

  # GET /conversions
  # GET /conversions.json
  def index
    @conversion = Conversion.new
    @conversions = Conversion.all
  end

  # GET /conversions/1
  # GET /conversions/1.json
  def show
    @array_datewise = fetch_data
    uri = URI("http://data.fixer.io/api/latest?access_key=90b760542e55ffc6a374fa98ca6f76a0&symbols=#{@conversion.target_currency}")
    res = JSON.parse(Net::HTTP.get(uri))
    @current_rate = res['rates'][@conversion.target_currency.to_s]
  end

  # GET /conversions/new
  def new
    @conversion = Conversion.new
  end

  # GET /conversions/1/edit
  def edit; end

  # POST /conversions
  # POST /conversions.json
  def create
    @conversion = Conversion.new(conversion_params)

    respond_to do |format|
      if @conversion.save
        format.html { redirect_to @conversion, notice: 'Conversion was successfully created.' }
        format.json { render :show, status: :created, location: @conversion }
      else
        format.html { render :new }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversions/1
  # PATCH/PUT /conversions/1.json
  def update
    respond_to do |format|
      if @conversion.update(conversion_params)
        format.html { redirect_to @conversion, notice: 'Conversion was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversion }
      else
        format.html { render :edit }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversions/1
  # DELETE /conversions/1.json
  def destroy
    @conversion.destroy
    respond_to do |format|
      format.html { redirect_to conversions_url, notice: 'Conversion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def fetch_data
    hash = {}
    @conversion.week_count.times do |n|
      date = (Date.today - (n + 1).weeks).strftime('%Y-%m-%d')
      uri = URI("http://data.fixer.io/api/#{date}?access_key=90b760542e55ffc6a374fa98ca6f76a0&symbols=#{@conversion.target_currency}")
      res = JSON.parse(Net::HTTP.get(uri))
      hash[date.to_s] = res['rates'][@conversion.target_currency.to_s]
    end
    hash
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_conversion
    @conversion = Conversion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def conversion_params
    params.require(:conversion).permit(:base_currency, :target_currency, :base_amount, :week_count)
  end
end
