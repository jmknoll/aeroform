module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then "ui error message"
    end
  end

  def syntax_highlight(text)
    # initialized in rouge_highlighter.rb
    html = HighlightSource.render(text)
    html.html_safe
  end
end
