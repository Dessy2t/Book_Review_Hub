class UserBooksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @books = @user.books
    end
end
