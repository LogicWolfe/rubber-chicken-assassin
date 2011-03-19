require 'ostruct'

module Meta
  class OpenStruct < ::OpenStruct
    def to_s
      self.to_json
    end
    
    def to_json
      @table.to_json
    end
  end
  
  def meta
    @__meta ||= Meta::OpenStruct.new
  end
end