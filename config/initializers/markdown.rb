MarkdownRails.configure do |config|
  class Pygmentize < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language,
        :options => {:linenos => true}
        )
    end
  end
  pygmentized = Pygmentize.new(
    :filter_html => true,
    :hard_wrap => true
    )
  markdown = Redcarpet::Markdown.new(
    pygmentized,
    :fenced_code_blocks => true,
    :autolink => true
    )
  config.render do |markdown_source|
    markdown.render(markdown_source)
  end
end