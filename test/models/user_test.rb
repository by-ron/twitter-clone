require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Rheannon Pearce', email: 'rheannon@pearce.com',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  test "should be a valid user" do
    assert @user.valid?
  end

  test "name must be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email must be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "name cannot exceed 50 characters" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email cannot exceed 255 characters" do
    @user.email = 'a' * 256
    assert_not @user.valid?
  end

  test" email validation should accept valid addresses" do
    valid_addresses = %w(user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.ca)
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w(user@example,com user_at_foo.org user.name@example foo@bar_baz.com foo@bar+baz.ca hello@world..com)
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "password must be present/non-blank" do
    @user.password = @user.password_confirmation = (' ' * 6)
    assert_not @user.valid?
  end

  test "password must contain minimum length (6 characters)" do
    @user.password = @user.password_confirmation = ('a' * 5)
    assert_not @user.valid?
  end

  test "authenticated? should return false for user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
