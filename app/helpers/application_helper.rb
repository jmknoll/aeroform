module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then "ui error message"
    end
  end
end
