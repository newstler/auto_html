# For Slideshare we have to introspect the page and get the swf file in order to create the object/embed tags
 
AutoHtml.add_filter(:slideshare).with(:width => 650, :height => 528) do |text, options|
  text.gsub(/http:\/\/(www.)?slideshare\.net\/[A-Za-z0-9._%-]*\/([A-Za-z0-9._%-]*)[&\w;=\+_\-]*/) do |s|
    doc = Hpricot(open(s))
    swf = doc.to_s.match(/http:\/\/static.slidesharecdn.com\/swf\/ssplayer2\.swf\?doc\=([A-Za-z0-9._%-]*)[&\w;=\+_\-]*/)[0]
    %{<object style="margin:0px" width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="#{swf}" /><param name="allowFullScreen" value="true"/><param name="allowScriptAccess" value="always"/><embed src="#{swf}" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="#{options[:width]}" height="#{options[:height]}"></embed></object>}
  end
end