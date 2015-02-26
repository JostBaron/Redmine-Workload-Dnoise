# -*- encoding : utf-8 -*-
module WorkloadFiltersHelper
  def get_option_tags_for_userselection(usersToShow, selectedUsers)

    result = '';

    usersToShow.each do |user|
      selected = selectedUsers.include?(user) ? 'selected="selected"' : ''

      result += "<option value=\"#{h(user.id)}\" #{selected}>#{h(user.firstname)} #{h(user.lastname)} (#{h(user.name)})</option>"
    end

    return result.html_safe
  end

  def group_params_nil?
    if params.nil?
      return true
    elsif params[:workload].nil?
      return true
    elsif params[:workload][:groups].nil?
      return true
    else
      return false
    end
  end

end
