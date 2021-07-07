# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  result = {}
  emoticons.each do |name, value|
    result[name] = { english: value[0], japanese: value[1] }
  end
  result
end

def get_japanese_emoticon(file_path, search)
  # code goes here
  result = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |name, values|
    if values[:english] == search
      result = emoticons[name][:japanese]
    end
  end
  result
end

def get_english_meaning(file_path, search)
  # code goes here
  result = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each  do |name, values |
    if values[:japanese] == search
      result = name
    end
  end
  result
end

# get_japanese_emoticon('./lib/emoticons.yml', ":)")
