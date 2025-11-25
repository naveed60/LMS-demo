module ApplicationHelper
  NAV_SCOPES = %i[admin teacher student].freeze

  def nav_courses_path
    case controller_path
    when /^admin\//
      admin_courses_path
    when /^teacher\//
      courses_teacher_dashboard_index_path
    when /^student\//
      display_all_courses_student_dashboard_index_path
    else
      root_path
    end
  end

  def nav_dashboard_path
    case controller_path
    when /^admin\//
      admin_dashboard_index_path
    when /^teacher\//
      teacher_dashboard_index_path
    when /^student\//
      student_dashboard_index_path
    else
      root_path
    end
  end

  def nav_signed_in_scope
    NAV_SCOPES.find { |scope| respond_to?("#{scope}_signed_in?") && send("#{scope}_signed_in?") }
  end

  def nav_signed_in?
    nav_signed_in_scope.present?
  end

  def nav_current_account
    scope = nav_signed_in_scope
    scope ? send("current_#{scope}") : nil
  end

  def nav_path_helper(prefix, suffix)
    scope = nav_signed_in_scope
    return unless scope

    helper_name = "#{prefix}_#{scope}_#{suffix}_path"
    respond_to?(helper_name) ? send(helper_name) : nil
  end

  def nav_edit_registration_path
    nav_path_helper('edit', 'registration')
  end

  def nav_logout_path
    nav_path_helper('destroy', 'session')
  end
end
