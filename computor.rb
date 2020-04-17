#methods (functions)

def quadratic(terms)

    a = 0
    b = 0
    c = 0
    
    d2 = terms.select{ |item| item.include?("x^2")}
    d2.each { |i|
        i.slice! " * x^2"
        i.slice! " "
        a = a + i.to_i
    }

    d1 = terms.select{ |item| item.include?("x^1")}
    d1.each { |j|
        j.slice! " * x^1"
        j.slice! " "
        b = b + j.to_i
    }
    
    d0 = terms.select{ |item| item.include?("x^0")}
    d0.each { |k|
        k.slice! " * x^0"
        k.slice! " "
        c = c + k.to_i
    }
    discriminant = (b*b) - (4*a*c)
    if discriminant >= 0
        if a != 0 && b != 0 && c != 0
            puts "Discriminant in strictly posistive, the two solutions are :"
            x1 = (-b + Math.sqrt(discriminant))/(2*a)
            x2 = (-b - Math.sqrt(discriminant))/(2*a)
            puts x1
            puts x2
        else 
            puts "Discriminant is postive with only one solution :"
            x1 = (-b + Math.sqrt(discriminant))/(2*a)
            x2 = (-b - Math.sqrt(discriminant))/(2*a)
            if x1 == 0
                puts x2
            else 
                puts x1
            end
        end
        
    else 
        puts "Discriminant is negative with complex solutions"
    end
end

def linear(terms)
    puts "Polynomial degree: 1"
end

def reduced(terms)

    highest_degree = 0
    term_count = terms.length

    if (terms.last != "= 0")
        if terms.last.include?("-")
            placeholder  = terms.last
            placeholder = placeholder.gsub("-", "+")
            terms[term_count - 2] = placeholder
            terms[term_count - 1] = " = 0"
        else
            placeholder = terms.last
            placeholder = placeholder.gsub("=", "-")
            terms[term_count - 1] = placeholder
            terms.push(" = 0")
        end
    end
  
    # test = terms.select{ |item| !item.include?("x^2")  && !item.include?("x^1") && !item.include?("x^0") && !item.include?("= 0")}
    terms.each { |i|
        grab_deg = i.scan(/\d+/)
        to_degree = grab_deg.last.to_i
        if highest_degree <= to_degree
            highest_degree = to_degree
        end  
    }

    # output the reduced form
    x = highest_degree
    while x >= 0
        sym = terms.select{ |item| item.scan(/\d+/).last.to_i == x}
        sym.each { |j|
            j.slice! " "
            puts j
        }
        x -= 1
    end
    # terms.each { |j|
    #     x = highest_degree
    # }

    puts "Polynomial Degree: #{highest_degree}"
    if highest_degree == 2
        quadratic(terms)
    elsif highest_degree == 1
        linear(terms)
    elsif highest_degree > 2
        puts "The polynomial degree is greater than 2. Can't compute."
    end
end




#entry point of programme
if ARGV.length > 1
    puts "Too many arguments"
    exit
elsif ARGV.length < 1
    puts "No auguments"
    exit
end

terms = ARGV[0].split(/(?=[-+=])\s*/)
reduced(terms)
puts terms

# print "Reduced form: "
# terms.each { |term|
#     print term
#     if term == terms.last
#     print "\n"
#     end
# }


#finding the solution 
# terms.each { |term|
#     if term.include?("x^2")
#         quadratic(terms)
#         break
#     end
# }