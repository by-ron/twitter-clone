require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup info should be invalid" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'foo@bar', password: 'foo', password_confirmation: 'bar'} }
    end
    assert_template 'users/new'
  end

  test "valid signup info" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Byron Pearce', email: 'byron@pearce.com', password: 'goodbye', password_confirmation: 'goodbye'} }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
