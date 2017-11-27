# govsolidity
implementation of some ideas in solidity


## some schemas

![government](docs/drawio_out_1.png)

In this schema. we can see that for a given transaction, some values (ether right now) are withdrawn from the initial transfer.
These funds will be available to an entity (government here)

The government SC will enable some people registered in a registry to manage the funds (allocation, etc) in a consensus-determined way. (vote? weight?)

Healthcare smart contract would enable people to get benefits to doctors smart contract for example. Depending of their stats in the proxy payment SC.

Retirement funds could enable people to withdraw some cuts in some certain amount of time.

Etc.


## automatic VAT withdrawal contract

in `Proxyfier.sol`

## Some questions

- why tx variable `tx.nonce` doesn't exist in solidity? could be interesting for LE
