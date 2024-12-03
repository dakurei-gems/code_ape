module CodeApe
  # Regex to parse ape code division (notably in {CodeApe#ape})
  REGEX_DIVISION = /\A(\d{2})\.?(\d{1})\z/i

  # Represent division of ape code (first 3 digits)
  class Division
    attr_reader :key, :label

    # Creates a new {Division}
    # @param key [Symbol, String] The division key of ape code
    # @param label [String] The division label of ape code
    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    # @return [Array<CodeApe::Class>] the classes associated with division of this ape code
    def classes
      @classes ||= CLASSES.select { |e| e.division_key == @key }
    end

    # @return [Array<CodeApe::Group>] the groups associated with division of this ape code
    def groups
      @groups ||= GROUPS.select { |e| classes.map(&:group_key).include?(e.key) }
    end

    # @return [CodeApe::Subsection] the subsection of this ape code
    def subsection
      @subsection ||= SUBSECTIONS.find { |e| e.key == classes[0]&.subsection_key }
    end

    # @return [CodeApe::Section] the section of this ape code
    def section
      @section ||= SECTIONS.find { |e| e.key == classes[0]&.section_key }
    end

    # @return [Hash] the hash representation of division label
    def to_h
      {label: @label}
    end
  end

  # List of ape code divisions
  DIVISIONS = NAF_REV2[:divisions].map { |k, v| Division.new(k, v) }.freeze
end
