#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

district_16 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/16th_Congress_of_the_Philippines',
  after: '//span[@id="District_representatives"]',
  before: '//span[@id="Party-list_representatives"]',
  xpath: '//table[.//th[.="Representative"]]//tr//td[position() = last() - 3]//a[not(@class="new")]/@title',
)

district_17 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/17th_Congress_of_the_Philippines',
  after: '//span[@id="District_representatives"]',
  before: '//span[@id="Party-list_representatives"]',
  xpath: '//table[.//th[.="Representative"]]//tr//td[position() = last() - 3]//a[not(@class="new")]/@title',
)

party_list_16 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/16th_Congress_of_the_Philippines',
  after: '//span[@id="Party-list_representatives"]',
  before: '//span[@id="Current_composition_2"]',
  xpath: '//table[.//th[.="Representative"]]//tr//td[position() = last() - 2]//a[not(@class="new")]/@title',
)

party_list_17 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/17th_Congress_of_the_Philippines',
  after: '//span[@id="Party-list_representatives"]',
  before: '//span[@id="References"]',
  xpath: '//table[.//th[.="Representative"]]//tr//td[position() = last() - 2]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: district_16 | party_list_16 | district_17 | party_list_17 })

