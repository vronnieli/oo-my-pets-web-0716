require 'pry'

class Owner
  # code goes here
  attr_accessor :pets
  attr_reader :name, :species

  @@all_owners = []

  def initialize(species)
    @@all_owners << self
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all_owners
  end

  def self.reset_all
    @@all_owners.clear
  end

  def self.count
    @@all_owners.length
  end

  def name= (name)
    @name = name
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    self.pets[:cats][0].mood = "happy"
  end

  def feed_fish
    self.pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    self.pets[:fishes].collect do |fish_instance|
      fish_instance.mood = "nervous"
    end
    self.pets[:dogs].collect do |dog_instance|
      dog_instance.mood = "nervous"
    end
    self.pets[:cats].collect do |cat_instance|
      cat_instance.mood = "nervous"
    end
    self.pets.collect do |animal, animal_hash|
      animal_hash.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

end

# require_relative 'spec_helper.rb'
#
# describe Owner do
#
#
#
#     describe "#sell_pets" do
#       it 'can sell all its pets, which make them nervous' do
#         fido = Dog.new("Fido")
#         tabby = Cat.new("Tabby")
#         nemo = Fish.new("Nemo")
#         [fido, tabby, nemo].each {|o| o.mood = "happy" }
#         owner.pets = {
#           :dogs => [fido, Dog.new("Daisy")],
#           :fishes => [nemo],
#           :cats => [Cat.new("Mittens"), tabby]
#         }
#         owner.sell_pets
#         owner.pets.each {|type, pets| expect(pets.empty?).to eq(true) }
#         [fido, tabby, nemo].each { |o| expect(o.mood).to eq("nervous") }
#       end
#     end
#
#
