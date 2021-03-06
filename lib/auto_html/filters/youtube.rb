AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil, :autoplay => false, :hide_related => false) do |text, options|
  regex = /https?:\/\/(www.)?(youtube\.com\/embed\/|youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
  text.gsub(regex) do
    youtube_id = $3
    
    youtube_json = result = JSON.parse(open("http://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_id}&format=json").read)
    
    width = youtube_json["width"]
    height = youtube_json["height"]
    
    #width = options[:width]
    #height = options[:height]
    frameborder = options[:frameborder]
	wmode = options[:wmode]
    autoplay = options[:autoplay]
    hide_related = options[:hide_related]
	src = "//www.youtube.com/embed/#{youtube_id}"
    params = []
	params << "wmode=#{wmode}" if wmode
    params << "autoplay=1" if autoplay
    params << "rel=0" if hide_related
    src += "?#{params.join '&'}" unless params.empty?
    %{<div class="video-container youtube"><iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe></div>}
  end
end
