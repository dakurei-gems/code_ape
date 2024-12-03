require "csv"
require "json"

FILE = "naf2008.csv"
OUTPUT_FILE = "../lib/naf_rev2.json"

hash_section = {}
hash_subsection = {}
hash_division = {}
hash_group = {}
hash_class = {}

global_hash = {}

csv = CSV.parse(File.read(FILE), headers: true, col_sep: ";", quote_char: "\"")
csv.each do |row|
  hash_section[row["Code Section"].to_sym] ||= row["Section"]
  hash_subsection[row["Code Sous-section"].to_sym] ||= row["Sous-section"]
  hash_division[row["Code Division"].to_sym] ||= row["Division"]
  hash_group[row["Code Groupe"].to_sym] ||= row["Groupe"]
  hash_class[row[0].to_sym] ||= {
    label: row["Classe"],
    group: row["Code Groupe"],
    division: row["Code Division"],
    subsection: row["Code Sous-section"],
    section: row["Code Section"]
  }
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
