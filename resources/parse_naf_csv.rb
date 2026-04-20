require "csv"
require "json"

FILE = "naf2025.csv"
OUTPUT_FILE = "../lib/naf_rev2.1.json"

hash_section = {}
hash_subsection = {}
hash_division = {}
hash_group = {}
hash_class = {}

global_hash = {}

csv = CSV.parse(File.read(FILE), headers: true, col_sep: ";", quote_char: "\"")
csv.each do |row|
  value = row["NAF 2025 sous-classes"] || row["NACE Rev.2.1"]

  case value
  when /\A(\d{2})\.?(\d{2})([A-Z])\z/i
    if !row["NACE Rev.2.1"].nil? && row["NACE Rev.2.1"] != "" && !row["NAF 2025 sous-classes"].nil? && row["NAF 2025 sous-classes"] != ""
      hash_group[row["NACE Rev.2.1"].to_sym] ||= row["Intitulés"].capitalize
    end

    hash_class[value.to_sym] ||= {
      label: row["Intitulés"].capitalize,
      group: hash_group.to_a.last.first,
      division: hash_division.to_a.last.first,
      subsection: hash_subsection.to_a.last.first,
      section: hash_section.to_a.last.first
    }
  when /\A(\d{2})\.?(\d{2})\z/i
    hash_group[value.to_sym] ||= row["Intitulés"].capitalize
  when /\A(\d{2})\.?(\d{1})\z/i
    hash_division[value.to_sym] ||= row["Intitulés"].capitalize
  when /\A(\d{2})\z/i
    hash_subsection[value.to_sym] ||= row["Intitulés"].capitalize
  when /\A([A-Za-z])\z/i
    hash_section[value.to_sym] ||= row["Intitulés"].capitalize
  end
end

global_hash[:sections] = hash_section.sort_by { |k, _| k }.to_h
global_hash[:subsections] = hash_subsection.sort_by { |k, _| k }.to_h
global_hash[:divisions] = hash_division.sort_by { |k, _| k }.to_h
global_hash[:groups] = hash_group.sort_by { |k, _| k }.to_h
global_hash[:classes] = hash_class.sort_by { |k, _| k }.to_h

# puts global_hash.inspect
f = File.new(OUTPUT_FILE, "w")
f.write(JSON.pretty_generate(global_hash))
f.write("\n")
f.close
