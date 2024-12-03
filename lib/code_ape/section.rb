module CodeApe
  # Represent section of ape code (A letter assigned to a subdivision grouping not represented in the final ape code)
  class Section
    attr_reader :key, :label

    # Creates a new {Section}
    # @param key [Symbol, String] The section key of ape code
    # @param label [String] The section label of ape code
    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    # @return [Array<CodeApe::Class>] the classes associated with section of this ape code
    def classes
      @classes ||= CLASSES.select { |e| e.section_key == @key }
    end

    # @return [Array<CodeApe::Group>] the groups associated with section of this ape code
    def groups
      @groups ||= GROUPS.select { |e| classes.map(&:group_key).include?(e.key) }
    end

    # @return [Array<CodeApe::Division>] the divisions associated with section of this ape code
    def divisions
      @divisions ||= DIVISIONS.select { |e| classes.map(&:division_key).include?(e.key) }
    end

    # @return [Array<CodeApe::Subsection>] the subsections associated with section of this ape code
    def subsections
      @subsections ||= SUBSECTIONS.select { |e| classes.map(&:subsection_key).include?(e.key) }
    end

    # @return [Hash] the hash representation of section label
    def to_h
      {label: @label}
    end
  end

  # List of ape code sections
  SECTIONS = NAF_REV2[:sections].map { |k, v| Section.new(k, v) }.freeze
end
