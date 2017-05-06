class WordSegmentationController < ApplicationController
  require 'bosonnlp'
  
  def tag
    nlp = Bosonnlp.new("1zfpyjAs.14787.R6pgq5cZAba5")
    result = nlp.c_tag([params[:word]])
    history_record = HistoryRecord.new(data: params[:word], before_change: result.first, user_id: @current_user.id)
    history_record.save
    render json: result, status: 200
  end
end
