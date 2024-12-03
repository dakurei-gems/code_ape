module CodeApe
  # Regex to parse ape code subsection (notably in {CodeApe#ape})
  REGEX_SUBSECTION = /\A(\d{2})\z/i

  # Represent subsection of ape code (first 2 digits)
  class Subsection
    attr_reader :key, :label

    # Creates a new {Subsection}
    # @param key [Symbol, String] The subsection key of ape code
    # @param label [String] The subsection label of ape code
    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    # @return [Array<CodeApe::Class>] the classes associated with subsection of this ape code
    def classes
      @classes ||= CLASSES.select { |e| e.subsection_key == @key }
    end

    # @return [Array<CodeApe::Group>] the groups associated with subsection of this ape code
    def groups
      @groups ||= GROUPS.select { |e| classes.map(&:group_key).include?(e.key) }
    end

    # @return [Array<CodeApe::Division>] the divisions associated with subsection of this ape code
    def divisions
      @divisions ||= DIVISIONS.select { |e| classes.map(&:division_key).include?(e.key) }
    end

    # @return [CodeApe::Section] the section of this ape code
    def section
      @section ||= SECTIONS.find { |e| e.key == classes[0]&.section_key }
    end

    # @return [Hash] the hash representation of subsection label
    def to_h
      {label: @label}
    end
  end

  # List of ape code subsections
  SUBSECTIONS = NAF_REV2[:subsections].map { |k, v| Subsection.new(k, v) }.freeze
end
