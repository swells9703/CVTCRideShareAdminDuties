class RideRequestMailer < ActionMailer::Base
  
  default from: "noreply@cvtcrideshare.com"
  
  #req field for mailer setup:
  #table ride_requests
  #id      :int, unique ride_request id
  #ride_id :int, the rides id in the ride table
  #user_id :int, requestors id
  #RideRequestMailer.ride_request(@ride_owner,@req_user,ride_id).deliver
  def ride_request(ride,)
    @ride_owner = User.find(ride.user_id)
    @req_user   = req_user
    @ride       = Ride.find(ride_id)
    @token      = Digest::SHA1.hexdigest(@ride.id + @req_user.id)
    
    #change to first name or something in the future
    mail(to: @ride_owner.email, subject: "Ride request from #{@req_user.email}")
  
  end
  
end