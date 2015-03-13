module ApplicationHelper
  def csrf_token
    (<<-HTML).html_safe
      <input type="hidden"
            name="authenticity_token"
            value="#{ form_authenticity_token }">
    HTML
  end

  def the_url(obj)
    Rails.application.routes.url_helpers.send(obj.class.name.parameterize + "_path", obj.id)
  end
end
