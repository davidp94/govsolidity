pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Proxyfier.sol";

contract TestProxyfier {

  function testInitialBalanceUsingDeployedContract() {
    Proxyfier pxy = Proxyfier(DeployedAddresses.Proxyfier());

    uint expected = 0;

    Assert.equal(pxy.balance, expected, "contract should have empty balance");
  }

}
