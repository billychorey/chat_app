# app/helpers/application_helper.rb
module ApplicationHelper
  def logged_in?
    current_user.present?
  end
end
