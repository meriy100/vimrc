require 'json'
options = STDIN.read.split(/\s+/)

hash_ = options.each_with_object({}) do |value, hash|
  case [value[0], value[1..]]
  in '+', name
    hash[name] = true
  in '-', name
    hash[name] = false
  else
    raise "'value' is able not parsed"
  end
end

puts hash_.to_json
