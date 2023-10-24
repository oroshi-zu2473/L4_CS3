require 'bcrypt'

signup_password = BCrypt::Password.create("sanriko")
puts 'sanriko : ' + signup_password

#user = User.find_by(uid: params[:uid])

#login_password = BCrypt::Password.new(user.pass)

login_password = BCrypt::Password.new(signup_password)

puts 'sanriko : ' + login_password

#if signup_password == login_password #params[:pass]
#    puts "OK"
#end