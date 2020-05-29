class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def trunc_pad(str, len=20, pad = true)
    if str.length > len - 1
      return str[0...len] + "..."
    end

    return str.ljust(len, "-") if pad
    str
  end
end
