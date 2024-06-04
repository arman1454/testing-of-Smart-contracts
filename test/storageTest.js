const StorageTesting = artifacts.require("Storage");

contract("Storage",()=>{
    before(async()=>{
        console.log("Hi");
        const storageTest = await StorageTesting.deployed();
    })
    it("should return an Item",async()=>{
        await storageTest.set("an Item");
        const result = await storageTest.get();
        assert(result === "an Item");
    })
})