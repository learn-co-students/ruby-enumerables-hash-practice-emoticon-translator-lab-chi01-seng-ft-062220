require "yaml"
require "pry"
def load_library(file_path)
 #code goes here
  library = YAML.load_file(file_path)
  emoticons = {}
  library.each do |name,arrays|
      emoticons[name] ||= {}
      emoticons[name][:english] = arrays[0]
      emoticons[name][:japanese] = arrays[1]
  end
emoticons
end

def get_english_meaning(file_path, japan_emo)
#code goes here
  translation = ""
  new_hash = load_library(file_path)
  new_hash.each do |name, language|
      if language[:japanese] == japan_emo
      translation = name
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else
      return translation
    end
end

def get_japanese_emoticon(file_path, eng_emo)
#code goes here
  translation = ""
  new_hash = load_library(file_path)
  new_hash.each do |name, language|
      if language[:english] == eng_emo
      translation = language[:japanese]
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else
      return translation
    end
end
