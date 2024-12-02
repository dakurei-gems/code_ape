module CodeApe
  REGEX_GROUP = /\A(\d{2})\.?(\d{2})\z/i

  class Group
    attr_reader :key, :label

    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    def classes
      @classes ||= CLASSES.select { |e| e.group_id == @key }
    end

    def division
      @division ||= DIVISIONS.find { |e| e.key == classes[0]&.division_id }
    end

    def subsection
      @subsection ||= SUBSECTIONS.find { |e| e.key == classes[0]&.subsection_id }
    end

    def section
      @section ||= SECTIONS.find { |e| e.key == classes[0]&.section_id }
    end

    def to_h
      {label: @label}
    end
  end

  GROUPS = NAF_REV2[:groups].map { |k, v| Group.new(k, v) }.freeze
end
