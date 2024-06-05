// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract Bidding{
    struct Auction{
        uint id;
        address payable seller; //it can receive Ether
        string name;
        string description;
        uint min;
        uint bestOfferId;
        uint [] offerIds;
    }

    struct Bid{
        uint id;
        uint auctionId;
        address payable buyer;
        uint price;
    }

    
}