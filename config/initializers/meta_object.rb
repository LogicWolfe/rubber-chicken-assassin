require 'meta_object'

ActiveRecord::Base.send(:include, Meta)
String.send(:include, Meta)
Hash.send(:include, Meta)
Array.send(:include, Meta)
