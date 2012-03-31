class Name < String
  def author
    /[\w\s,]+/.match self
    $&.strip
  end
  def year
    /\d{4}/.match self
    $& or ''
  end
  def title
    remainder = remove author, year
    /\w[\w\s]*/.match remainder
    $&.strip
  end
  def clean
    "#{author} (#{year})  #{title}"
  end

private
  def remove *to_remove
    to_remove.inject(self) {|remainder, to_remove| remainder.sub(to_remove, '')}
  end
end

def rename original_name
  Name.new(original_name).clean
end

