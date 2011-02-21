namespace :configatron do
  desc "Export the configatron config to public/javascripts/configatron.js"
  task(:to_js => :environment) do
    js_filepath = Rails.root.join('public', 'javascripts', 'configatron.js')
    js = "
function configatron(key) {
	var config = #{configatron.to_hash.to_json};
	var keys = key.split('.');
	var obj = config;
	for (var i=0; i<keys.length; i++) { obj = obj[keys[i]] };
	return obj;
}"
    File.open(js_filepath, 'w') {|f| f.write(js) }
  end
  
end