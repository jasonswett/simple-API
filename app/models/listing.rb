class Listing < ActiveRecord::Base
  after_initialize :fix_slug

  def fix_slug
    self.slug = name.downcase.gsub! /\s*[^A-Za-z0-9]\s*/, '_'
  end
end
