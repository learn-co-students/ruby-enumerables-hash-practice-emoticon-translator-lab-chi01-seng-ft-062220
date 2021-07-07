require "yaml"

require 'pry'
def load_library(file)
  emoticon = YAML.load_file(file)
  english = Array.new.to_s
  japanese = Array.new.to_s
    emoticon.each_with_object({}) do |(words, array_symbols), symbols| 
      if !symbols[words]
        symbols[words] = {}
        end
      if !symbols[words][english] 
      symbols[words][:english] = array_symbols[0]
      end
    if !symbols[words][japanese] 
    symbols[words][:japanese] = array_symbols[1]
    end 
  symbols
  end
end

def get_japanese_emoticon(file, emoticon)
  referance = load_library(file)
  emoticon = referance.keys.find do |key|
    referance[key][:english] == emoticon
    end
    if emoticon
    referance[emoticon][:japanese]
    else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file, emoticon)
 referance = load_library(file)
  emoticon = referance.keys.find do |key|
    referance[key][:japanese] == emoticon
    end
    if emoticon
    emoticon
     else  
    "Sorry, that emoticon was not found"
  end
end