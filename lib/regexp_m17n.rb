module RegexpM17N
  def self.non_empty?(str)
    str.encode!("US-ASCII") if str.encoding.dummy?
    str =~ NON_EMPTY_REGEXPS[encoding_name(str)]
  end

private

  NON_EMPTY_REGEXPS = Hash.new do |h, key|
    h[key] = Regexp.new('^.+$'.encode(key))
  end
  private_constant :NON_EMPTY_REGEXPS

  def self.encoding_name(str)
    if str.encoding.ascii_compatible? 
      return "US-ASCII"
    else
      return str.encoding.name
    end
  end
end
