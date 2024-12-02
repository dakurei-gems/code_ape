module CodeApe
  REGEX_DIVISION = /\A(\d{2})\.?(\d{1})\z/i

  class Division
    attr_reader :key, :label

    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    def classes
      @classes ||= CLASSES.select { |e| e.division_id == @key }
    end

    def groups
      @groups ||= GROUPS.select { |e| classes.map(&:group_id).include?(e.key) }
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

  DIVISIONS = NAF_REV2[:divisions].map { |k, v| Division.new(k, v) }.freeze
end
