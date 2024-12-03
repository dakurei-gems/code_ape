require "code_ape/version"

require "code_ape/constants"

require "code_ape/section"
require "code_ape/subsection"
require "code_ape/division"
require "code_ape/group"
require "code_ape/class"

# All CodeApe functionality
module CodeApe
  # Takes a ape code and returns data if possible
  # @param code [String] The ape code to search
  # @return [CodeApe::Subsection, CodeApe::Division, CodeApe::Group, CodeApe::Class, nil] the ape code data
  def self.ape(code)
    upcased_code = code&.upcase

    case upcased_code
    when REGEX_SUBSECTION
      SUBSECTIONS.find { |e| e.key == upcased_code }
    when REGEX_DIVISION
      DIVISIONS.find { |e| e.key == upcased_code || e.key.delete(".") == upcased_code }
    when REGEX_GROUP
      GROUPS.find { |e| e.key == upcased_code || e.key.delete(".") == upcased_code }
    when REGEX_CLASS
      CLASSES.find { |e| e.key == upcased_code || e.key.delete(".") == upcased_code }
    end
  end

  # Takes a section code and returns data if possible
  # @param code [String] The section code to search
  # @return [CodeApe::Section, nil] the section code data
  def self.section(code)
    SECTIONS.find { |e| e.key == code&.upcase }
  end
end
