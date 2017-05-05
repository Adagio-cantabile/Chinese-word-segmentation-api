class WordSegmentationController < ApplicationController
  require 'bosonnlp'
  
  def tag
    nlp = Bosonnlp.new("1zfpyjAs.14787.R6pgq5cZAba5")
    result = nlp.c_tag([params[:word]])
    render json: result, status: 200
  end
end
