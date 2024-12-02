module CodeApe
  class Section
    attr_reader :key, :label

    def initialize(key, label)
      @key = key.to_s
      @label = label
    end

    def classes
      @classes ||= CLASSES.select { |e| e.section_id == @key }
    end

    def groups
      @groups ||= GROUPS.select { |e| classes.map(&:group_id).include?(e.key) }
    end

    def divisions
      @divisions ||= DIVISIONS.select { |e| classes.map(&:division_id).include?(e.key) }
    end

    def subsections
      @subsections ||= SUBSECTIONS.select { |e| classes.map(&:subsection_id).include?(e.key) }
    end

    def to_h
      {label: @label}
    end
  end

  SECTIONS = NAF_REV2[:sections].map { |k, v| Section.new(k, v) }.freeze
end
