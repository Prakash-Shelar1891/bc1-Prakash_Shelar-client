const JPM_Token = artifacts.require("JPM_Token");

module.exports = function (deployer) {
  deployer.deploy(JPM_Token, 'JPM_Token','JPM','1000');
};
