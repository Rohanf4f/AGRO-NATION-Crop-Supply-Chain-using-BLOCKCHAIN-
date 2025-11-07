pragma solidity ^0.8.17;

import './cropD_C.sol';

contract Customer {
    
    mapping(address => address[]) public cropBatchAtCustomer;
    mapping(address => salestatus) public sale;

    enum salestatus {
        notfound,
        atcustomer,
        sold,
        expired,
        damaged
    }

    event cropStatus(
        address _address,
        address indexed Customer,
        uint status
    );

    function cropRecievedAtCustomer(
        address _address,
        address cid
    ) public {
        cropD_C(cid).receiveDC(_address, msg.sender);
        cropBatchAtCustomer[msg.sender].push(_address);
        sale[_address] = salestatus(1);
    }

    function updateSaleStatus(
        address _address,
        uint Status
    ) public {
        sale[_address] = salestatus(Status);
        emit cropStatus(_address, msg.sender, Status);
    }

    function salesInfo(
        address _address
    ) public
    view
    returns(
        uint Status
    ){
        return uint(sale[_address]);
    }

}