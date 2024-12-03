module CodeApe
  require "json"

  # The content of naf_rev2.json (all ape code data)
  NAF_REV2 = JSON.parse(File.read(File.join(File.dirname(__FILE__), "../naf_rev2.json")), symbolize_names: true)
end
