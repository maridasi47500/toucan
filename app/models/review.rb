class Review < ApplicationRecord
has_many :reviewimages
has_many :images, through: :reviewimages

belongs_to :client
def self.oftenreview
Review.group('reviews.note').order('reviews.note desc').count.to_a[0][0]
end
def visitedthisyear
visited.year == DateTime.now.year
end
def self.notemoytoutes
a=all.pluck(:note).sum.to_f
a > 0 ? (a/Review.nbreviews).to_s[0..2] : "Pas de notes"
end
def self.bypage(p,sortby=nil,note=nil)
all.sortby(sortby).bynote(note).each_slice(50).to_a[(p.to_i - 1)]
end
def self.bynote(i)
if i
where('reviews.note = ?',i)
else
select('*')
end
end
def self.sortby(i)
case i
when 'mostrelevant'
select('*').order('reviews.created_at asc')
when 'oldest'
select('*').order('reviews.created_at desc')
when 'highest'
select('*').order('reviews.note desc')
when 'lowest'
select('*').order('reviews.note asc')
else
select('*').order('reviews.created_at asc')
end
end
def self.nbreviews
group('reviews.id').where('reviews.id is not null').length
end
def self.grouptwo
all.last(4).each_slice(2).to_a
end
  def images=(files)
  photos =[]
files.each do |file|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      photos.push({name: filename})
      loc='image'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
    `mv #{pathfile} #{abs}`
end
  newphotos=self.images.new(photos) #valeur temporaire de user_id
  #.add authors here

end

end
