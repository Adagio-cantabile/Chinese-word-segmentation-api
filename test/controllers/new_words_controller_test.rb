require 'test_helper'

class NewWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_word = new_words(:one)
  end

  test "should get index" do
    get new_words_url, as: :json
    assert_response :success
  end

  test "should create new_word" do
    assert_difference('NewWord.count') do
      post new_words_url, params: { new_word: { type: @new_word.type, user_id: @new_word.user_id, valid: @new_word.valid, word: @new_word.word } }, as: :json
    end

    assert_response 201
  end

  test "should show new_word" do
    get new_word_url(@new_word), as: :json
    assert_response :success
  end

  test "should update new_word" do
    patch new_word_url(@new_word), params: { new_word: { type: @new_word.type, user_id: @new_word.user_id, valid: @new_word.valid, word: @new_word.word } }, as: :json
    assert_response 200
  end

  test "should destroy new_word" do
    assert_difference('NewWord.count', -1) do
      delete new_word_url(@new_word), as: :json
    end

    assert_response 204
  end
end
