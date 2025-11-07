pragma solidity ^0.8.17;

import './cropW_D.sol';
import './crop.sol';
import './cropD_C.sol';

contract Distributor {
    
    mapping(address => address[]) public cropsAtDistributor;
    mapping(address => address[]) public cropDtoC;
    mapping(address => address) public cropDtoCTxContract;
    
    function cropRecievedAtDistributor(
        address _address, 
        address cid
        ) public {
            
        uint rtype = crop(_address).receivedcrop(msg.sender);
        if(rtype == 2){
            cropsAtDistributor[msg.sender].push(_address);
            if(crop(_address).getWDC()[0] != address(0)){
                cropW_D(cid).receiveWD(_address, msg.sender);
            }
        }
    }


    function transfercropDtoC(
        address _address,
        address transporter,
        address receiver
    ) public {
        cropD_C dp = new cropD_C(
            _address,
            msg.sender,
            transporter,
            receiver
        );
        cropDtoC[msg.sender].push(address(dp));
        cropDtoCTxContract[_address] = address(dp);
    }

}