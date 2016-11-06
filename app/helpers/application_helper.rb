# frozen_string_literal: true
module ApplicationHelper
  def markdown(text, options = {})
    options.reverse_merge!(autolink: true, tables: true)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(text).html_safe
  end

  def next_button(text, path)
    link_to text, path,
              class: "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent next-button"
  end
end
