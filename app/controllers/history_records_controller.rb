class HistoryRecordsController < ApplicationController
  require 'json'
  before_action :set_history_record, only: [:show, :update, :destroy]

  # GET /history_records
  # GET /history_records.json
  def index
    history_records = HistoryRecord.where(user_id: @current_user.id)#.where.not(after_change: [nil, ''])
    render json: history_records, status: 200
  end

  # GET /history_records/1
  # GET /history_records/1.json
  def show
  end

  # POST /history_records
  # POST /history_records.json
  def create
    @history_record = HistoryRecord.new(history_record_params)

    if @history_record.save
      render :show, status: :created, location: @history_record
    else
      render json: @history_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /history_records/1
  # PATCH/PUT /history_records/1.json
  def update
    if @history_record.update(history_record_params)
      render :show, status: :ok, location: @history_record
    else
      render json: @history_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /history_records/1
  # DELETE /history_records/1.json
  def destroy
    @history_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_record
      @history_record = HistoryRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_record_params
      params.require(:history_record).permit(:before_change, :after_change, :data, :user_id)
    end
end
