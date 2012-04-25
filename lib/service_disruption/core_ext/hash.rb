class Hash

  def rubyfy_keys!
    keys.each do |key|
      self[(key.underscore rescue key) || key] = delete(key)
    end
    self
  end

  def recursive_rubyfy_keys!
    rubyfy_keys!
    values.each{|h| h.recursive_rubyfy_keys!  if h.is_a?(Hash) }
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_rubyfy_keys! if h.is_a?(Hash) }
    self
  end

  def recursive_symbolize_keys!
    symbolize_keys!
    values.each{|h| h.recursive_symbolize_keys!  if h.is_a?(Hash) }
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end

  def recursive_rubyfy_and_symbolize_keys!
    recursive_rubyfy_keys!
    recursive_symbolize_keys!
    self
  end

end
