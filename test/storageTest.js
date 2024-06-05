const StorageTesting = artifacts.require("Storage");

contract("Storage",()=>{
    let storageTest = null;
    before(async()=>{
        console.log("running before");
        storageTest = await StorageTesting.deployed();
    })
    it("should return an Item",async()=>{
        await storageTest.set("an Item");
        const result = await storageTest.get();
        assert(result === "an Item");
    })
})