using Test

include("wordy.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.5.0

println("\n"^2, "-"^60, "\n"^3)



@testset "Just a number" begin
    @test answer("What is 5?") == 5
end
println()

@testset "Addition" begin
    @test answer("What is 1 plus 1?") == 2
end
println()

@testset "More addition" begin
    @test answer("What is 53 plus 2?") == 55
end
println()

@testset "Addition with negative numbers" begin
    @test answer("What is -1 plus -10?") == -11
end
println()

@testset "Large addition" begin
    @test answer("What is 123 plus 45678?") == 45801
end
println()

@testset "Subtraction" begin
    @test answer("What is 4 minus -12?") == 16
end
println()

@testset "Multiplication" begin
    @test answer("What is -3 multiplied by 25?") == -75
end
println()

@testset "Division" begin
    @test answer("What is 33 divided by -3?") == -11
end
println()

@testset "Multiple additions" begin
    @test answer("What is 1 plus 1 plus 1?") == 3
end
println()

@testset "Addition and subtraction" begin
    @test answer("What is 1 plus 5 minus -2?") == 8
end
println()

@testset "Multiple subtraction" begin
    @test answer("What is 20 minus 4 minus 13?") == 3
end
println()

@testset "Subtraction then addition" begin
    @test answer("What is 17 minus 6 plus 3?") == 14
end
println()

@testset "Multiple multiplication" begin
    @test answer("What is 2 multiplied by -2 multiplied by 3?") == -12
end
println()

@testset "addition and multiplication" begin
    @test answer("What is -3 plus 7 multiplied by -2?") == -8
end
println()

@testset "Multiple division" begin
    @test answer("What is -12 divided by 2 divided by -3?") == 2
end
println()

@testset "Unknown operation" begin
    @test_throws ErrorException answer("What is 52 cubed?")
end
println()

@testset "Non-math question" begin
    question = "Who is the President of the United States?"
    @test_throws ErrorException answer(question)
end
println()

@testset "Reject problem missing an operand" begin
    @test_throws ErrorException answer("What is 1 plus?")
end
println()

@testset "Reject problem with no operands or operators" begin
    @test_throws ErrorException answer("What is?")
end
println()

@testset "Reject two operations in a row" begin
    @test_throws ErrorException answer("What is 1 plus plus 2?")
end
println()

@testset "Reject two numbers in a row" begin
    @test_throws ErrorException answer("What is 1 plus 2 1?")
end
println()

@testset "Reject postfix notation" begin
    @test_throws ErrorException answer("What is 1 2 plus?")
end
println()

@testset "Reject prefix notation" begin
    @test_throws ErrorException answer("What is plus 1 2?")
end
println()

# Additional tests for this track

@testset "Missing operation" begin
    @test_throws ErrorException answer("What is 2 2 minus 3?")
end
println()

@testset "Missing number" begin
    @test_throws ErrorException answer("What is 7 plus multiplied by -2?")
end
println()
