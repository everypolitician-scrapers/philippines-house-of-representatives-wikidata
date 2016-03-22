#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = WikiData::Category.new('Category:Members of the House of Representatives of the Philippines', 'es').member_titles
EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })

