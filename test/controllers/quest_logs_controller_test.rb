require 'test_helper'

class QuestLogsControllerTest < ActionController::TestCase
  setup do
    @quest_log = quest_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_log" do
    assert_difference('QuestLog.count') do
      post :create, quest_log: { description: @quest_log.description, title: @quest_log.title }
    end

    assert_redirected_to quest_log_path(assigns(:quest_log))
  end

  test "should show quest_log" do
    get :show, id: @quest_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_log
    assert_response :success
  end

  test "should update quest_log" do
    patch :update, id: @quest_log, quest_log: { description: @quest_log.description, title: @quest_log.title }
    assert_redirected_to quest_log_path(assigns(:quest_log))
  end

  test "should destroy quest_log" do
    assert_difference('QuestLog.count', -1) do
      delete :destroy, id: @quest_log
    end

    assert_redirected_to quest_logs_path
  end
end
