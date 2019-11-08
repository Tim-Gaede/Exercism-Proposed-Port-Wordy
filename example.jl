function answer(question::String)
    text = replace(question, "?"  => "")
    words = split(text)


    if length(words) < 3
        throw(ErrorException("I don't know what you asked."))
    end

    if words[1] != "What"  ||  words[2] != "is"
        throw(ErrorException("Did you ask something?"))
    end

    try
        val_last = parse(Int, last(words))
    catch
        throw(ErrorException("What?"))
    end


    res = nothing
    try
        res = parse(Int, words[3])
    catch
        throw(ErrorException("What was that?"))
    end

    for i = 3 : length(words)-1
        if is_an_integer(words[i])  &&  is_an_integer(words[i+1])
            throw(ErrorException("You are using back-to-back numbers."))
        end
    end


    i = 4
    while i ≤ length(words) - 1
        if words[i] == "plus"
            try
                res += parse(Int, words[i + 1])
            catch
                throw(ErrorException("Huh?"))
            end


        elseif words[i] == "minus"
            try
                res -= parse(Int, words[i + 1])
            catch
                throw(ErrorException("What?"))
            end

        elseif words[i] == "multiplied"  &&  words[i + 1] == "by"
            try
                res *= parse(Int, words[i + 2])
            catch
                throw(ErrorException("Eh?"))
            end

        elseif words[i] == "divided" && words[i + 1] == "by"
            try
                res /= parse(Int, words[i + 2])
            catch
                throw(ErrorException("What was that?"))
            end
        end


        i += 1
    end




    if res == nothing
        throw(ErrorException("I couldn't figure out what you said."))
    end


    return res
end


function is_an_integer(s::SubString{String})
    try
        parse(Int, s)
        return true
    catch ErrorException
        return false
    end
end
