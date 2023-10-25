require 'bcrypt'

class TopController < ApplicationController
    def main
        if session[:login_uid]!=nil
            render "main"
        else
            render "login"
        end
    end
    
    def login
        
        user = User.find_by(uid: params[:uid])
        
        if user
            
            if  BCrypt::Password.new(user.pass) == params[:pass]
                session[:login_uid]=params[:uid]
                redirect_to top_main_path
            else
                render "error"
            end
        else
            render "error"
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to top_main_path
    end
    
    #def new
        #render "create"
    #end
    
    def create
        hashed_password = BCrypt::Password.create(params[:pass])
        user = User.new(uid: params[:uid], pass: hashed_password)
        user.save
        redirect_to top_main_path  #"/"
    end
end