#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

@pages = [
  'Category:Members of the House of Representatives of the Philippines'
]

@pages.map { |c| WikiData::Category.new(c, 'en').wikidata_ids }.flatten.uniq.each_with_index do |id, i|
  puts i if (i % 100).zero?
  data = WikiData::Fetcher.new(id: id).data('en') or next
  # puts "%s %s" % [data[:id], data[:name]]
  ScraperWiki.save_sqlite([:id], data)
end
