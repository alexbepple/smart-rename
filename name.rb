class Name < String
  def author
    /\w+/.match self
    $&
  end
  def year
    /\d{4}/.match self
    $&
  end
  def title
    remainder = self.remove author, year
    /\w+/.match remainder
    $&
  end
  def clean
    "#{author} (#{year})  #{title}"
  end
  def remove *to_remove
    to_remove.inject(self) {|remainder, to_remove| remainder.sub(to_remove, '')}
  end
end

def rename original_name
  Name.new(original_name).clean
end

