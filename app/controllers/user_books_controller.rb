class UserBooksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
       @pagy, @books = pagy(@user.books.order(created_at: :desc))
    end
end
