const Sploot = artifacts.require("./Sploot.sol");

contract("Sploot", accounts => {
  it("...should store the value 100.", async () => {
    const SplootInstance = await Sploot.deployed();

    // Get stored value
    const maxSupply = await SplootInstance.maxSupply.call();

    assert.equal(maxSupply, 100, "The value 100 was not stored.");
  });
});
