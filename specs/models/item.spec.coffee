Item = require '../../coffeescripts/models/item'
describe "Item  Model", ->
  it "should exist", ->
  expect(Item).toBeDefined()
  describe "Attributes", ->
    item = new Item "0ca3304d.a811038d.0ca3304e.80024f1e"
    it "should have default attributes", ->
      expect(item.affiliateId).toBeDefined()
      expect(item.affiliateId).toEqual "0ca3304d.a811038d.0ca3304e.80024f1e"
