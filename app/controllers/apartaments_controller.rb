class ApartamentsController < ApplicationController
    def index
        @apartaments = policy_scope(Apartament)
    end
end
