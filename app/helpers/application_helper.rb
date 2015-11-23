module ApplicationHelper

  def auth_token
    html = <<-HTML
      <input type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML

    html.html_safe
  end

  def session_button
    if current_user
      html = <<-HTML
        #{current_user.username}
        #{button_to "Logout", session_url, method: :delete}
      HTML
    else
      html = <<-HTML
        #{link_to "Sign In", new_session_url} or
        #{link_to "Sign Up", new_user_url}
      HTML
    end
    html.html_safe
  end
end
