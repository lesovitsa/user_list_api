class UsersController < ApplicationController

    def add_user
        @user = User.create(user_params)

        if @user.valid?
            Rails.logger.info "User added"
            render json: { user: @user }, status: 200
        else
            Rails.logger.warn "Failed to add user"
            render json: { error: "Failed to add user" }, status: 500
        end
    end

    def update_user
        @user = User.find_by(find_params)

        if !@user
            Rails.logger.warn "Couldn't find user"
            render json: { error: "Couldn't find user" }, status: 404
        else
            if @user.update(user_params)
                @user.reload
                Rails.logger.info "User updated successfully"
                render json: { user: @user }, status: 200
            else
                Rails.logger.warn "Failed to update user"
                render json: { error: "Failed to update user" }, status: 500
            end
        end
    end

    def delete_user
        @user = User.find_by(find_params)

        if !@user
            Rails.logger.warn "Couldn't find user"
            render json: { error: "Couldn't find user" }, status: 404
        else
            @user.destroy
            Rails.logger.info "User deleted successfully"
            render json: { user: @user }, status: 200
        end
    end

    def get_all_users
    end

    private

    def user_params
        params.permit(:name, :email, :phone)
    end

    def find_params
        params.permit(:id)
    end
end
