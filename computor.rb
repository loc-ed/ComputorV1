def quadratic(terms)

    a = 0
    b = 0
    c = 0
    
    d2 = terms.select{ |item| item.include?("x^2")}
    d2.each { |i|
        i.slice! " * x^2"
        i.slice! " "
        a = (a + i.to_f).round(2)
    }

    d1 = terms.select{ |item| item.include?("x^1")}
    d1.each { |j|
        j.slice! " * x^1"
        j.slice! " "
        b = (b + j.to_f).round(2)
    }
    
    d0 = terms.select{ |item| item.include?("x^0")}
    d0.each { |k|
        k.slice! " * x^0"
        k.slice! " "
        c = (c + k.to_f).round(2)
    }

    if b > 0 && c > 0
        puts "Reduced form : " + a.to_s + " * x^2  + " + b.to_s + " * x^1  + " + c.to_s + " * x^0 = 0"
    elsif b > 0
        puts "Reduced form : " + a.to_s + " * x^2  + " + b.to_s + " * x^1 " + c.to_s + " * x^0 = 0"
    elsif c > 0
        puts "Reduced form : " + a.to_s + " * x^2   " + b.to_s + " * x^1  + " + c.to_s + " * x^0 = 0"
    end
    
    discriminant = (b*b) - (4*a*c)
    if discriminant > 0
        if a != 0 && b != 0 && c != 0
            puts "Discriminant in strictly posistive, the two solutions are :"
            x1 = (-b + Math.sqrt(discriminant))/(2*a)
            x2 = (-b - Math.sqrt(discriminant))/(2*a)
            puts x1.round(2)
            puts x2.round(2)
        end
    elsif discriminant == 0
        puts "Discriminant is postive with only one solution :"
        x1 = (-b + Math.sqrt(discriminant))/(2*a)
        x2 = (-b - Math.sqrt(discriminant))/(2*a)
        if x1 == 0
            puts x2.round(2)
        else 
            puts x1.round(2)
        end 
    else 
        x1 = (-b/(2*a)).round(2)
        x2 =  (Math.sqrt(discriminant * -1)/(2*a)).round(2)
        puts "Discriminant is negative with complex solutions :"
        puts x1.to_s  + " + "  + x2.to_s  + " i "
        puts x1.to_s  + " - "  + x2.to_s  + " i "
    end
end

def linear(terms)

    a = 0
    b = 0
    solution = 0
    
    d1 = terms.select{ |item| item.include?("x^1")}
    d1.each { |j|
        j.slice! " * x^1"
        j.slice! " "
        a = (a + j.to_f).round(2)
    }
    
    d0 = terms.select{ |item| item.include?("x^0")}
    d0.each { |k|
        k.slice! " * x^0"
        k.slice! " "
        b = (b + k.to_f).round(2)
    }

    if a != 0 && b < 0
        puts "Reduced form : " + a.to_s + " * x^1 " + b.to_s + " * x^0 = 0"
    elsif a != 0 &&  b > 0
        puts "Reduced form : " + a.to_s + " * x^1  + " + b.to_s + " * x^0 = 0"
    end

    if b < 0
        solution = ((-1 * b)/a).round(2)
    else
        solution = ((b/a)).round(2)
    end
    puts "The solution is : #{solution}"

end

def sort(terms)

    highest_degree = 0
    term_count = terms.length
    counter = 0

    terms.each { |k|
        if k.include?("=")
            break
        else 
            counter += 1
        end
    }
    diff = term_count - counter
    if diff < counter

        while diff != 0

            placeholder = terms.last
            if (placeholder != "= 0")
                
                if placeholder.include?("=")
                    if placeholder.include?("-")
                        placeholder = placeholder.slice! "= ".gsub("-", "+")
                    else
                        placeholder = placeholder.gsub("=", "-")
                    end
                elsif terms.last.include?("-") 
                    placeholder = placeholder.gsub("-", "+")
                elsif terms.last.include?("+") 
                    placeholder = placeholder.gsub("+", "-")
                end

                i = term_count - 1
                while i >= 1
                    terms[i] = terms[i - 1]
                    i -= 1
                end
            end
            
            terms[0] = placeholder
            diff -= 1

        end

    #if there are more terms on the RHS
    else
        while counter != 0
            placeholder = terms.first
            if placeholder.include?("-")
                placeholder = placeholder.gsub("-", "+")
            else 
                placeholder = "- " +  placeholder
            end

            for i in 0..(term_count - 2)
                terms[i] = terms[i + 1]
            end

            terms[term_count - 1] = placeholder
            counter -= 1
        end

        placeholder = terms.first
        if placeholder.include?("=")
            
            placeholder = placeholder.gsub("= ", '')
            terms[0] = placeholder
        end
    end

    # get the degree
    terms.each { |i|
        grab_deg = i.scan(/\d+/)
        to_degree = grab_deg.last.to_i
        if highest_degree <= to_degree
            highest_degree = to_degree
        end  
    }

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

if terms.length == 2
    x = terms.last.gsub("= ", '')
    y = terms.first
    if x == y
        puts "There is no solution / Solution is all real numbers"
    else 
        puts "Invalid equation"
    end
else
    sort(terms)
end