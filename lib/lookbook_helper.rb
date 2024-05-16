# lib/lookbook_helper.rb
module LookbookHelper
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def add_param_annotation(param, type, options = {}, description = "")
      annotation = "# @param #{param} #{type} {"
      options.each do |key, value|
        annotation += " #{key}: #{value.inspect},"
      end
      annotation.chomp!(',') # Remove the trailing comma
      annotation += " } \"#{description}\""
      annotation
    end

    def theme_param_annotation
      add_param_annotation(:theme, "select", { choices: %w[primary secondary danger warning info light dark link] }, "Default bootstrap themes")
    end
  end
end
