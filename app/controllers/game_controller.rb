# We need to generate a random number - DONE!
# We need to make sure we have values that persist, even if we submit forms or reload the page - DONE!
# We need to keep track of attempts... - DONE!
# We need to accept a guess... - DONE!
# Check if guess is right, high, or low... - DONE!
# Handle LOSS! (Out of guesses...)
# Handle WIN! (Correct guess!)
# Restart if WIN or LOSS...

class GameController < ApplicationController
    before_action :initialize_game, only: [:ask]

    def ask
        @rand_num = session[:random_number]
        @remaining_attempts = session[:remaining_attempts]
    end

    def answer
        @rand_num = session[:random_number]
        @remaining_attempts = session[:remaining_attempts]

        # Check our guess... (from our form submission!)
        @guess = params[:guess].to_i

        if @guess == session[:random_number]
            # Game is won!
            @message = 'You win! Click the link below to start a new game!'
            reset_session
        else
            # Wrong!!!
            if @guess > session[:random_number]
                @message = 'Too high!'
            else
                @message = 'Too low!'
            end

            if session[:remaining_attempts] <= 0
                @message = 'You lost! Click the link below to start a new game!'
                reset_session
            else
                # Each guess, subtract an attempt:
                session[:remaining_attempts] -= 1
            end
        end
    end

    private

    def initialize_game
        # If there is no random num in sess', set to new one.
        session[:random_number] ||= rand(1..100)
        session[:remaining_attempts] ||= 5
    end

end
