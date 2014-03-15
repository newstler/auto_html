AutoHtml.add_filter(:text_link) do |text|
  text.gsub(/^_https?:\/\//) do |match|
    %|<div>#{match.to_s[1..-1]}</div>|
  end
end