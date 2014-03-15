AutoHtml.add_filter(:text_link) do |text|
  text.gsub(/^_https?:\/\//) do |match|
    %|#{match.to_s[1..-1]}<span class="hide"></span>|
  end
end