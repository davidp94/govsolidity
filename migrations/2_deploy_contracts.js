// var ConvertLib = artifacts.require("./ConvertLib.sol");
var Proxyfier = artifacts.require("./Proxyfier.sol");

module.exports = function(deployer) {
  deployer.deploy(Proxyfier);
  // deployer.deploy(ConvertLib);
  // deployer.link(ConvertLib, MetaCoin);
  // deployer.deploy(MetaCoin);
};
