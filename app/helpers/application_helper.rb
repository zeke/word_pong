module ApplicationHelper
  
  def page_title
    out = []
    out << "WordPong"
    out.join(" / ")
  end

	def javascripts
	  javascript_include_tag(configatron.javascripts)
    # out = []
    # out << javascript_include_tag(configatron.javascripts)
    # out.join("\n")
	end
	
  def enable_typekit(kit_id)
    raw "<script type=\"text/javascript\" src=\"http://use.typekit.com/#{kit_id}.js\"></script>
    <script type=\"text/javascript\">try{Typekit.load();}catch(e){}</script>"
  end

end
