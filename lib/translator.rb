# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  translated_hash = Hash.new
  emoticons_data = YAML.load_file(file)
  emoticons_data.map { |k, v|
  translated_hash[k] = {:english => v[0], :japanese => v[1]}
  }
translated_hash
end


def get_english_meaning(file, emoticon_to_find)
  # code goes here
  emoticons = load_library(file)
  meaning = ""
  emoticons.map { |k, v| 
  if v[:japanese] == emoticon_to_find
  meaning << k
  end
  }
  if meaning == ""
    return "Sorry, that emoticon was not found"
  else
    return meaning
  end
end




def get_japanese_emoticon(file, emoticon_to_find)
  # code goes here
  emoticons = load_library(file)
  japanese_version = ""
  emoticons.map { |k, v|
  if v[:english] == emoticon_to_find
    japanese_version << v[:japanese]
  end
  }
  if  japanese_version == ""
    return "Sorry, that emoticon was not found"
  else
    return japanese_version
  end
end




