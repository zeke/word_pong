WordPong
========

A word association game, powered by the [Wordnik API](http://developer.wordnik.com)

Go play at [wordpong.heroku.com](http://wordpong.heroku.com)

To Do
-----

* When resorting to a random word response, ensure the random word is an adjective
* Keep Pings within a certain level of accessibility (corpus frequency)
* Add an "I Don't Know" option
* Anagram mode
* Add a "Gimme a hint" option
* update layout centering when switching play modes
* Store the blacklist in a cookie (maybe ezcookie supports arrays?), not a param.


http://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=true&includePartOfSpeech=adjective&minCorpusCount=10000

r = Wordnik::Request.new(:get, "word/{word}/related", :params => {:word => "old", :partOfSpeech => "adjective", :type => "antonym"})

http://api.wordnik.com/v4/word.json/old/related?partOfSpeech=adjective&

http://api.wordnik.com/v4/word.json/old/related?partOfSpeech=adjective&type=synonym