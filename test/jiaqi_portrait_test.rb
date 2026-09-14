require "yaml"

root = File.expand_path("..", __dir__)
members = YAML.safe_load_file(File.join(root, "_data", "team_members.yml"))
jiaqi = members.find { |member| member["name"] == "Jiaqi Zhang" }

abort "Jiaqi Zhang is missing from team data" unless jiaqi

expected_photo = "jiaqi_zhang_2026.jpg"
unless jiaqi["photo"] == expected_photo
  abort "Jiaqi Zhang's portrait must use a cache-busting filename"
end

unless File.file?(File.join(root, "images", expected_photo))
  abort "Jiaqi Zhang's portrait file is missing"
end

puts "Jiaqi Zhang portrait: ok"
