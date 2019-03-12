require 'code_ape/version'

require 'yaml'

module CodeApe
  NAF_REV2     ||= YAML.load_file(File.join(File.dirname(__FILE__), 'naf_rev2.yml'))

  #DEPRECATED
  DIVISION_APE ||= YAML.load_file(File.join(File.dirname(__FILE__), 'division_ape.yml'))
  CODE_APE     ||= YAML.load_file(File.join(File.dirname(__FILE__), 'code_ape.yml'))

  def self.ape(code)
    if NAF_REV2.key?(code.to_s)
      NAF_REV2[code.to_s]
    else
      nil
    end
  end

  # DEPRECATED
  def self.division(code)
    if DIVISION_APE.key?(code)
      DIVISION_APE[code]
    else
      nil
    end
  end

  #DEPRECATED
  def self.activity(code)
    if CODE_APE.key?(code)
      CODE_APE[code]
    else
      nil
    end
  end

end
