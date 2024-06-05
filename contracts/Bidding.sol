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

    mapping(uint=>Auction) private auctions;
    mapping(address=>uint[]) private auctionList;
    uint private newAuctionId = 1;

    function createAuction(string calldata _name, string calldata _description, uint _min) external{
        require(_min>0,"minimum must be greater than 0");
        uint[] memory offerIds = new uint[](0);

        auctions[newAuctionId] = Auction(newAuctionId,payable(msg.sender),_name,_description,_min,0,offerIds);
        auctionList[msg.sender].push(newAuctionId);
        newAuctionId++;
    }


}