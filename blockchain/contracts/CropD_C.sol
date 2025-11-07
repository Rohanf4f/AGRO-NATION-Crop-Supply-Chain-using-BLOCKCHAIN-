pragma solidity ^0.8.17;

import './crop.sol';

contract cropD_C {

    address Owner;

    enum packageStatus { atcreator, picked, delivered }

    address medAddr;
    address sender;
    address transporter;
    address receiver;
    packageStatus status;

    constructor(
        address _address,
        address Sender,
        address Transporter,
        address Receiver
    ) public {
        Owner = Sender;
        medAddr = _address;
        sender = Sender;
        transporter = Transporter;
        receiver = Receiver;
        status = packageStatus(0);
    }

    function pickDC(
        address _address,
        address transporterAddr
    ) public {
        require(
            transporter == transporterAddr,
            "Only Associated transporter can call this function."
        );
        status = packageStatus(1);

        crop(_address).sendDtoC(
            receiver,
            sender
        );
    }


    function receiveDC(
        address _address,
        address Receiver
    ) public {
        require(
            Receiver == receiver,
            "Only Associated receiver can call this function."
        );
        status = packageStatus(2);
        crop(_address).receivedDtoC(
            Receiver
        );
    }

    function get_addressStatus() public view returns(
        uint
    ) {
        return uint(status);
    }

}