require 'pry'
# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User
  attr_accessor :name, :comms, :jpgs
    @@all_users = []

    def initialize(name)
      @name = name
      @comms = []
      @jpgs =[]
      @@all_users << self
    end

    def self.all
      @@all_users
    end

    def photos
      Photo.all.select do |photo|
        photo.user == self
      end
    end
end


class Photo
    attr_accessor :user, :comms
     @@all = []

     def initialize
       @comms = []
       @@all << self
     end

     def self.all
       @all
     end

    def comments
      @comms
    end

    def make_comment(user_comment)
      self.comments << Comment.new(user_comment)
    end
end

class Comment
  attr_accessor :comm, :user, :jpgs
  @@all = []

  def initialize(comm)
      @comm = comm
      @@all << self
  end

  def self.all
    @@all
  end
end

binding.pry
sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name  #---ok
# => "Sophie"
user.photos  #---NameError: undefined local variable or method `user'
# => [#<Photo:0x00007fae2880b370>]

sandwich_photo.comments --ok
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments --ok
# => [#<Comment:0x00007fae28043700>]

Comment.all --ok
#=> [#<Comment:0x00007fae28043700>]
