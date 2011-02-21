
function configatron(key) {
	var config = {"javascripts":["https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js","rails","jquery.ezCookie_0.7.01","configatron","application"],"api":{"key":"b39ee8d5f05d0f566a0080b4c310ceddf5dc5f7606a616f53","base_path":"http://beta.wordnik.com/api/"},"desirable_relation_types":["antonym","same-context","synonym"],"mode_keys":["antonymy","synonymy","rhyme","free_association"],"modes":{"antonymy":"is the opposite of","synonymy":"is another word for","rhyme":"rhymes with","free_association":"makes me think of"}};
	var keys = key.split('.');
	var obj = config;
	for (var i=0; i<keys.length; i++) { obj = obj[keys[i]] };
	return obj;
}