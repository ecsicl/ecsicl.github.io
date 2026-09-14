require "yaml"

root = File.expand_path("..", __dir__)
config = YAML.safe_load_file(File.join(root, "_config.yml"))

unless Array(config["exclude"]).include?("assets/main.scss")
  abort "assets/main.scss must be excluded from GitHub Pages builds"
end

css_path = File.join(root, "assets", "main.css")
unless File.file?(css_path) && File.size(css_path) > 100_000
  abort "assets/main.css must contain the precompiled site stylesheet"
end

unless File.read(css_path).include?(".container-footer")
  abort "assets/main.css is missing the site theme styles"
end

puts "pages build assets: ok"
