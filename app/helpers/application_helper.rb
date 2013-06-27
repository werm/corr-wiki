module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(
        Pygmentize.new(:filter_html => true, :hard_wrap => true),
        :fenced_code_blocks => true,
        :autolink => true
        )
    markdown.render(text).html_safe
  end

end
