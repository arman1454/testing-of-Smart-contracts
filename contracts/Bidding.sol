// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract Bidding{
    struct Auction{
        uint id;
        address payable seller; //it can receive Ether
        string name;
        string description;
        uint min;
        uint bestBidId; // id
        uint [] bidIds; //[id1,id2,id3,...]
    }

    struct Bid{
        uint id;
        uint auctionId;
        address payable buyer;
        uint price;
    }

    mapping(uint=>Auction) private auctions;
    mapping(uint=>Bid) private bids;

    mapping(address=>uint[]) private auctionList;
    mapping(uint=>uint[]) private bidList;

    uint private newAuctionId = 1;

    uint private newBidId = 1;

    function createAuction(string calldata _name, string calldata _description, uint _min) external{
        require(_min>0,"minimum must be greater than 0");
        uint[] memory bidIds = new uint[](0);

        auctions[newAuctionId] = Auction(newAuctionId,msg.sender,_name,_description,_min,0,offerIds);
        auctionList[msg.sender].push(newAuctionId); 
        newAuctionId++;
    }

    function bid(uint _auctionId) external payable auctionExists(_auctionId){
        Auction storage auction = auctions[_auctionId];
        Bid storage bestBid = bids[auction.bestBidId];

        require(msg.value>=auction.min && msg.value>bestBid.price,"bid must be greater than the minimum and the best offer");
        auction.bestBidId = newBidId;
        auction.bidIds.push(newBidId);

        bids[newBidId] = Bid(newBidId,_auctionId,msg.sender,msg.value);

        bidList[msg.sender].push(newBidId);

        newBidId++;

    }

    function transaction(uint _auctionId) external auctionExists(_auctionId){
        Auction storage auction = auctions[_auctionId];

        Bid storage bestBid = bids[auction.bestBidId];

        for(uint i=0; i<auction.bidIds.length; i++){
            if(auction.bidIds[i]!= auction.bestBidId){
                Bid storage bid = bids[bidId]
            }
        }
    }   

    modifier auctionExists(uint _auctionId){
        require(_auctionId>0 && _auctionId<newAuctionId,"Auction does not exist");
        _;
    }




}