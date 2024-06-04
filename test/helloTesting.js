const HelloTesting = artifacts.require("HelloTesting");

contract("Hello Testing",()=>{
    it("should return hello testing",async()=>{
        const helloTesting = await HelloTesting.deployed();
        const result = await helloTesting.print();
        console.log("It prints "+result);
    })
})