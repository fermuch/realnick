require 'unicode'

class String
  def downcase
    Unicode::downcase(self)
  end
end