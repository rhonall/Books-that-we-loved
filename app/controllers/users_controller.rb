class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action -> { check_auth(User) }
end
