

vunnit = false
tries = 0

puts "Vad heter du?"

namn = gets().chomp!

puts "Hej #{namn}, gissa på ett nummer mellan 1-10"
korrekt = Random.new.rand(1..10)

while !vunnit && tries != 3

gissning = gets()

gissning = gissning.to_i

if gissning == korrekt
    vunnit = true
    break
end

puts "Fel gissning, försök igen"
tries += 1

end

if tries == 3
    puts "Sopa"
    exit()
end


puts "Korrekt gissat, du vann!"