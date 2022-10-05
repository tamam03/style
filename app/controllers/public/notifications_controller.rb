class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.order(created_at: :DESC).page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
    @current_user_notice = @notifications.where.not(visitor_id: current_user.id)
  end

end
