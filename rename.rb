def rename original_name
  /\w+/.match original_name
  author = $&
  /\d{4}/.match original_name
  year = $&

  remainder = original_name.gsub author, ''
  remainder = remainder.gsub year, ''

  /\w+/.match remainder
  work = $&

  return "#{author} (#{year})  #{work}"
end
