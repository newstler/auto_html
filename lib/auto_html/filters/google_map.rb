# encoding: UTF-8
AutoHtml.add_filter(:google_map).with(:width => 420, :height => 315, :style => "color:#000;text-align:left", :link_text => "View Larger Map") do |text, options|
  regex = /(https?):\/\/maps\.google\.([a-z\.]+)\/maps\?(.*)/
  text.gsub(regex) do
    domain_country = $2
    map_query = $3
    width = options[:width]
    height = options[:height]
    style = options[:style]
    
    %{<iframe width="#{width}" height="#{height}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.#{domain_country}/maps?f=q&amp;source=s_q&amp;#{map_query}&amp;output=embed"></iframe>}
  end
end
