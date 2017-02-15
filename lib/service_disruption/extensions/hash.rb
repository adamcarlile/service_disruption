class Hash

  def rubify_keys!
    keys.each do |key|
      self[(key.underscore rescue key) || key] = delete(key)
    end
    self
  end

  def recursively_rubify_keys!
    rubify_keys!
    values.each{|h| h.recursively_rubify_keys!  if h.is_a?(Hash) }
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursively_rubify_keys! if h.is_a?(Hash) }
    self
  end

  def recursively_symbolize_keys!
    symbolize_keys!
    values.each{|h| h.recursively_symbolize_keys!  if h.is_a?(Hash) }
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursively_symbolize_keys! if h.is_a?(Hash) }
    self
  end

  def recursively_rubify_and_symbolize_keys!
    recursively_rubify_keys!
    recursively_symbolize_keys!
    self
  end

end