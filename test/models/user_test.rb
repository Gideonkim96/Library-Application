require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'test@example.com', password: 'password')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: 'password')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'email must be unique' do
    User.create!(email: 'test@example.com', password: 'password')
    user = User.new(email: 'test@example.com', password: 'password')
    refute user.valid?
  end

  test 'password required' do
    user = User.new(email: 'test@example.com')
    refute user.valid?
  end
end