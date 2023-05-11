require "jekyll"

Jekyll::Hooks.register :site, :post_write do |page|
    puts "Jag funkar!"
end    
