pragma solidity ^0.8.17;

import './cropW_D.sol';
import './crop.sol';

contract Wholesaler {
    
    mapping(address => address[]) public cropsAtWholesaler;
    mapping(address => address[]) public cropWtoD;
    mapping(address => address) public cropWtoDTxContract;
    
    constructor() public {}
    
    function cropRecievedAtWholesaler(
        address _address
    ) public {

        uint rtype = crop(_address).receivedcrop(msg.sender);
        if(rtype == 1){
            cropsAtWholesaler[msg.sender].push(_address);
        }
    }
    
    function transfercropWtoD(
        address _address,
        address transporter,
        address receiver
    ) public {
        
        cropW_D wd = new cropW_D(
            _address,
            msg.sender,
            transporter,
            receiver
        );
        cropWtoD[msg.sender].push(address(wd));
        cropWtoDTxContract[_address] = address(wd);
    }
}