const WrappedToken = artifacts.require("WrappedToken");

module.exports = function(deployer) {
  
  // deploy all bridged tokens
  // deployer.deploy(WrappedToken, "Wrapped SMTH", "WSMTH", 8);
  deployer.deploy(WrappedToken, "Wrapped ACME", "WACME", 8);

};