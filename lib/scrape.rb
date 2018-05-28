require 'nokogiri'
require 'open-uri'
require 'pry'

root_imdb = "https://www.imdb.com/movies-coming-soon/"
imdb_html = open(root_imdb + "2018-06/?ref_=cs_dt_pv")

imdbDoc = Nokogiri::HTML(imdb_html)


#titles = imdbDoc.css(".overview-top h4 a")
#dates = imdbDoc.xpath(//h4[@class="li_group"])
titles = imdbDoc.css("div.list.detail h4")
'''
titles.each do |title|
  puts "#{title.text}"
end

dates.each do |date|
  puts "#{date.text}"
end
'''
class Movies 
  attr_accessor :date, :name
  @@all = []
  def initialize(date, name)
    @date = date
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
end

date = ""

titles.each do |node|
  #binding.pry
  if node.attributes["class"] == nil
    movie = "Movie: #{node.text}"

  else
    if node.attributes["class"].value == "li_group"
      date = "Date: #{node.text}"
    end
  end
  m = Movies.new(date, movie)  
end

Movies.all.each do |movie|
  puts "#{movie.name} #{movie.date}"
end