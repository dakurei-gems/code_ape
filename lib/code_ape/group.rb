module CodeApe
  # Regex to parse ape code group (notably in {CodeApe#ape})
  REGEX_GROUP = /\A(\d{2})\.?(\d{2})\z/i

  # Represent group of ape code (all digits)
  class Group
    attr_reader :key, :label

    # Creates a new {Group}
    # @param key [Symbol, String] The group key of ape code
    # @param label [String] The group label of ape code
    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    # @return [Array<CodeApe::Class>] the classes associated with group of this ape code
    def classes
      @classes ||= CLASSES.select { |e| e.group_key == @key }
    end

    # @return [CodeApe::Division] the division of this ape code
    def division
      @division ||= DIVISIONS.find { |e| e.key == classes[0]&.division_key }
    end

    # @return [CodeApe::Subsection] the subsection of this ape code
    def subsection
      @subsection ||= SUBSECTIONS.find { |e| e.key == classes[0]&.subsection_key }
    end

    # @return [CodeApe::Section] the section of this ape code
    def section
      @section ||= SECTIONS.find { |e| e.key == classes[0]&.section_key }
    end

    # @return [Hash] the hash representation of group label
    def to_h
      {label: @label}
    end
  end

  # List of ape code groups
  GROUPS = NAF_REV2[:groups].map { |k, v| Group.new(k, v) }.freeze
end
