module CodeApe
  REGEX_CLASS = /\A(\d{2})\.?(\d{2})([A-Z])\z/i

  class Class
    attr_reader :key, :label
    attr_reader :group_id, :division_id, :subsection_id, :section_id

    def initialize(key, label, group, division, subsection, section)
      @key = key.to_s
      @label = label
      @group_id = group
      @division_id = division
      @subsection_id = subsection
      @section_id = section
    end

    def group
      @group ||= GROUPS.find { |e| e.key == @group_id }
    end

    def division
      @division ||= DIVISIONS.find { |e| e.key == @division_id }
    end

    def subsection
      @subsection ||= SUBSECTIONS.find { |e| e.key == @subsection_id }
    end

    def section
      @section ||= SECTIONS.find { |e| e.key == @section_id }
    end

    def to_h
      {label: @label}
    end
  end

  CLASSES = NAF_REV2[:classes].map { |k, v| Class.new(k, v[:label], v[:group], v[:division], v[:subsection], v[:section]) }.freeze
end
