pragma solidity ^0.4.4;


// VAT withdrawal
contract Proxyfier {
    
    address public admin;
    
    address public recipient;
    
	mapping (address => uint256) public balances;
	
	event Transaction(address _to, uint256 _value);

    uint256 public percentMax = 10**5;
    // percentMax percent cut
    uint256 public cut;
    
    modifier onlyAdmin {
        require(msg.sender == admin);
        _;
    }
    
    modifier correctCut(uint256 _c) {
        require(_c <= percentMax);
        _;
    }
    
    function Proxyfier(uint256 _cut) correctCut(_cut) {
        admin = msg.sender;
        recipient = msg.sender;
        cut = _cut;
    }
    
    function setAdmin(address _newAdmin) onlyAdmin public {
        admin = _newAdmin;
    }
    
    function setRecipient(address _newRecipient) onlyAdmin public {
        recipient = _newRecipient;
    }
    
    function __setCut(uint256 _cut) correctCut(_cut) public {
        cut = _cut;
    }
    
    function withdraw(address _sendto) public {
        uint256 _vtosend = balances[msg.sender];
        balances[msg.sender] = 0;
        require(_sendto.send(_vtosend));
    }
    
    // destinationValue in wei
    function sendTX(address _to, bytes _data, uint256 _destinationValue) public payable {
        uint256 vat = (msg.value * cut) / percentMax;
        uint256 newvalue = msg.value - vat;
        require(_destinationValue <= newvalue);
        balances[recipient] += vat;
        // WARNING: it is sending ethers right now.
        // TODO: turns this to an external function call
        require(_to.send(newvalue));
        Transaction(_to, newvalue);
    }

}
