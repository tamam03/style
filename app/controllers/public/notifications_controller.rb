class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.order(created_at: :DESC).page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

end
