numbers = Array.new(151, true)

numbers[0] = false
numbers[1] = false
p numbers
limit = Integer(Math.sqrt(150))

for i in 2..limit do
    if numbers[i]
        for j in (i*i..150).step(i) do
            numbers[j] = false
        end
    end
end

p numbers


p numbers[103]