require File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../test_helper'
require '<%= file_path %>_controller'

# Re-raise errors caught by the controller.
class <%= class_name %>Controller; def rescue_action(e) raise e end; end

class <%= class_name %>ControllerTest < Test::Unit::TestCase
  def setup
    @controller = <%= class_name %>Controller.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_show
    get(:show, {}, {})
    assert_response(:success)
    assert_template('show')
    assert_nil(flash[:alert])
    assert_nil(flash[:notice])
  end
end
