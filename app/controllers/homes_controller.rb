class HomesController < ApplicationController
 def index
 @user = User.find(params[:id])
 @books = Book.all
 @user = current_user
 end
end
