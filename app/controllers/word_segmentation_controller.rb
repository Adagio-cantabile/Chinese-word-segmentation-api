class WordSegmentationController < ApplicationController
  require 'bosonnlp'
  
  def tag
    optimal = params[:optimal]
    nlp = Bosonnlp.new("1zfpyjAs.14787.R6pgq5cZAba5")
    result = nlp.c_tag([params[:word]])
    #change into result1, result2, result3
    unless optimal.to_i == 2
      history_record = HistoryRecord.new(data: params[:word], before_change: result.first, user_id: @current_user.id)
      history_record.save!
    end
    render json: result, status: 200
  end

  def modify
    unless HistoryRecord.last.after_change.empty?
      render json: {"message": "nothing to modify"}, status: 200
    else
#    puts HistoryRecord.last.inspect
    modifiers = params[:modify]
    result = {"tag": params[:tag], "word": params[:word]}
    history_record = HistoryRecord.last
    history_record.after_change = result
    history_record.save

#    puts modifiers
    #detect new words
    nlp = Bosonnlp.new("1zfpyjAs.14787.R6pgq5cZAba5")
    modifiers.each do |modifier|
#      puts modifier
      word = params[:word][modifier.to_i]
      type = params[:word][modifier.to_i]
#      puts nlp.c_tag([word])
#      if nlp.c_tag([word])["word"].size != 1
#        new_word = NewWord.new(word: word, type: type, user_id: @current_user.id)
#        new_word.save!
#        puts "new word"
#      end
    end
    
    render json: {"message": "successfully modified"}, status: 200
    end
  end
end
