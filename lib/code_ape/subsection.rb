module CodeApe
  REGEX_SUBSECTION = /\A(\d{2})\z/i

  class Subsection
    attr_reader :key, :label

    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    def classes
      @classes ||= CLASSES.select { |e| e.subsection_id == @key }
    end

    def groups
      @groups ||= GROUPS.select { |e| classes.map(&:group_id).include?(e.key) }
    end

    def divisions
      @divisions ||= DIVISIONS.select { |e| classes.map(&:division_id).include?(e.key) }
    end

    def section
      @section ||= SECTIONS.find { |e| e.key == classes[0]&.section_id }
    end

    def to_h
      {label: @label}
    end
  end

  SUBSECTIONS = NAF_REV2[:subsections].map { |k, v| Subsection.new(k, v) }.freeze
end
