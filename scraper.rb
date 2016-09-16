#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

district = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/16th_Congress_of_the_Philippines',
  after: '//span[@id="District_representatives"]',
  before: '//span[@id="Party-list_representatives"]',
  xpath: '//table[.//th[.="Representative"]]//tr//td[position() = last() - 3]//a[not(@class="new")]/@title',
)

party_list = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/16th_Congress_of_the_Philippines',
  after: '//span[@id="Party-list_representatives"]',
  before: '//span[@id="Current_composition_2"]',
  xpath: '//table[.//th[.="Representative"]]//tr//td[position() = last() - 2]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: district | party_list })

