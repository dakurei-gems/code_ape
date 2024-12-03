module CodeApe
  # Regex to parse ape code class (notably in {CodeApe#ape})
  REGEX_CLASS = /\A(\d{2})\.?(\d{2})([A-Z])\z/i

  # Represent final ape code (all digits + letter)
  class Class
    attr_reader :key, :label
    attr_reader :group_key, :division_key, :subsection_key, :section_key

    # Creates a new {Class}
    # @param key [Symbol, String] The class key of ape code
    # @param label [String] The class label of ape code
    # @param section_key [Symbol, String] The section key of ape code
    # @param subsection_key [Symbol, String] The subsection key of ape code
    # @param division_key [Symbol, String] The division key of ape code
    # @param group_key [Symbol, String] The group key of ape code
    def initialize(key, label, section_key, subsection_key, division_key, group_key)
      @key = key.to_s
      @label = label
      @section_key = section_key.to_s
      @subsection_key = subsection_key.to_s
      @division_key = division_key.to_s
      @group_key = group_key.to_s
    end

    # @return [CodeApe::Group] the group of this ape code
    def group
      @group ||= GROUPS.find { |e| e.key == @group_key }
    end

    # @return [CodeApe::Division] the division of this ape code
    def division
      @division ||= DIVISIONS.find { |e| e.key == @division_key }
    end

    # @return [CodeApe::Subsection] the subsection of this ape code
    def subsection
      @subsection ||= SUBSECTIONS.find { |e| e.key == @subsection_key }
    end

    # @return [CodeApe::Section] the section of this ape code
    def section
      @section ||= SECTIONS.find { |e| e.key == @section_key }
    end

    # @return [Hash] the hash representation of class label
    def to_h
      {label: @label}
    end
  end

  # List of ape code classes
  CLASSES = NAF_REV2[:classes].map { |k, v| Class.new(k, v[:label], v[:section], v[:subsection], v[:division], v[:group]) }.freeze
end
