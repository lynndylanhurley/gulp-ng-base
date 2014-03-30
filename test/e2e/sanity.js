var chai = require('chai');
var chaiAsPromised = require('chai-as-promised');

chai.use(chaiAsPromised);
var expect = chai.expect;

describe('testing sanity', function() {
  it('should be sane', function() {
    expect(1).to.equal(1);
    expect(true).to.equal(true);
  });

  describe('protractor library', function() {
    it('should expose the correct global variables', function() {
      expect(protractor).to.exist;
      expect(browser).to.exist;
      expect(by).to.exist;
      expect(element).to.exist;
      expect($).to.exist;
    });

    it('should wrap webdriver', function() {
      browser.get('/');
      expect(browser.getTitle()).to.eventually.equal('defsynth site');
    });
  });
});
