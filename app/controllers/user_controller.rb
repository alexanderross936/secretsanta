class UserController < ApplicationController
def new
  @user = User.new
end  
def index
	@users = User.all
end

def create
    @user = User.new
if @user.save
  redirect_to "http://localhost:3000/user/new"
else
  render 'new'
end
end
def results
end
end