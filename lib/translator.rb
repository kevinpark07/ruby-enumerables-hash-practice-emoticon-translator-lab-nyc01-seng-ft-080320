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
  emoticon_meaning = ""

  emoticon_hash.each do |key, language|
    if emoticon == emoticon_hash[key][:japanese]
     emoticon_meaning = emoticon_hash[key]
    else
      emoticon_meaning = "Sorry, that emoticon was not found"
  end
end
emoticon_meaning
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  japanese_emoticon = ""

  emoticon_hash.each do |key, language|
    if emoticon == emoticon_hash[key][:english]
      japanese_emoticon = emoticon_hash[key][:japanese]
    else
      japanese_emoticon = "Sorry, that emoticon was not found"
  end
end
japanese_emoticon
end