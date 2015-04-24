require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Example User",
                                             email: "user@example.com",
                                             password: "showme",
                                             password_confirmation: "showme" }
    end
    assert_template 'static_pages/home'
    @user = User.find_by(email: 'user@example.com')
    @user.update_attribute(:activated, true)
    log_in_as(@user)
    assert is_logged_in?
  end
  

  
  # test "the truth" do
  #   assert true
  # end
end
