module CodeApe
  require "json"

  NAF_REV2 = JSON.parse(File.read(File.join(File.dirname(__FILE__), "../naf_rev2.json")), symbolize_names: true)
end
