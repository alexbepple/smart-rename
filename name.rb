class Name < String

  def initialize name
    super name
    @consecutive_words = /\p{Word}[\p{Word}\s,]*/u
  end

  def author
    @consecutive_words.match self
    $&.strip
  end
  def year
    /\d{4}/.match self
    $& or ''
  end
  def title
    remainder = remove author, year
    @consecutive_words.match remainder
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

