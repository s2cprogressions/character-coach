# frozen_string_literal: true
module ApplicationHelper
  def markdown(text, options = {})
    options.reverse_merge!(autolink: true, tables: true)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(text).html_safe
  end
end
