require 'yaml'

require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

emoticons.each do |english_word, emoticon_set|
  emoticon_hash[english_word] = Hash.new
  emoticon_hash[english_word][:english] = emoticon_set.first
  emoticon_hash[english_word][:japanese] = emoticon_set.last
  end
  emoticon_hash
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)

  emoticon_hash.each do |key, language|
    if emoticon == emoticon_hash[key][:japanese]
      emoticon_hash[key]
    else
      "Sorry, that emoticon was not found"
  end
end
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)

  emoticon_hash.each do |key, language|
    if emoticon == emoticon_hash[key][:english]
      emoticon_hash[key][:japanese]
    else
      "Sorry, that emoticon was not found"
  end
end
binding.pry 
end