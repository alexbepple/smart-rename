class Name < String

  def initialize name
    super name
    @consecutive_words = /\p{Alpha}[\p{Alpha}\s,]*/u
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
    $& and $&.strip
  end
  def clean
    return "#{author} (#{year})  #{title}" if author and year and title
    self
  end

private
  def remove *to_remove
    to_remove.inject(self) {|remainder, to_remove| remainder.sub(to_remove, '')}
  end
end

