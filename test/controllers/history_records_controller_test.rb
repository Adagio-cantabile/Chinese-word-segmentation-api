require 'test_helper'

class HistoryRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_record = history_records(:one)
  end

  test "should get index" do
    get history_records_url, as: :json
    assert_response :success
  end

  test "should create history_record" do
    assert_difference('HistoryRecord.count') do
      post history_records_url, params: { history_record: { after_change: @history_record.after_change, before_change: @history_record.before_change, data: @history_record.data, user_id: @history_record.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show history_record" do
    get history_record_url(@history_record), as: :json
    assert_response :success
  end

  test "should update history_record" do
    patch history_record_url(@history_record), params: { history_record: { after_change: @history_record.after_change, before_change: @history_record.before_change, data: @history_record.data, user_id: @history_record.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy history_record" do
    assert_difference('HistoryRecord.count', -1) do
      delete history_record_url(@history_record), as: :json
    end

    assert_response 204
  end
end
