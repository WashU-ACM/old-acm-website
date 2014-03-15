require 'sanitize'
module ProjectsHelper
  def sanitize(text)
  	 Sanitize.clean(text, Sanitize::Config::RELAXED)
  end
  def markdown(text)
    Redcarpet.new(sanitize(text)).to_html.html_safe
  end
end
