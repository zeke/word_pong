class StaticController < ApplicationController

  def index
    # Find some words. Only gonna use the first one, but get extras in case the first doesn't
    # fit the criteria below..
    letter = ('a'..'z').to_a.sort_by{rand}.pop
    @words = wordnik.search(
      "*#{letter}*",
      :maxCorpusCount => 500_000 + (rand*500_000).to_i,
      :includePartOfSpeech => 'adjective',
      :limit => 20
    ).map{ |word| word['wordstring'] }

    # Filter out lame or capitalized words..
    @words = @words.select {|word| !word.starts_with? "un" }
    @words = @words.select {|word| !word.ends_with? "ed" }
    @words = @words.select {|word| !word.ends_with? "ing" }
    @words = @words.select {|word| word.downcase == word }

    # Choose first word as the ping
    @ping_pong = PingPong.new(:ping => @words.first)
  end

end