require 'yaml'

require "code_ape/version"

module CodeApe
  DIVISION_APE ||= YAML.load_file(File.join(File.dirname(__FILE__), 'division_ape.yml'))
  CODE_APE ||= YAML.load_file(File.join(File.dirname(__FILE__), 'code_ape.yml'))

  def self.division(code)
    if DIVISION_APE.key?(code)
      DIVISION_APE[code]
    else
      nil
    end
  end

  def self.activity(code)
    if CODE_APE.key?(code)
      CODE_APE[code]
    else
      nil
    end
  end

end
