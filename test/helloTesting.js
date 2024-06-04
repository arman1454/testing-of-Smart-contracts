const HelloTesting = artifacts.require("HelloTesting");

contract("Hello Testing",()=>{
    it("should return hello testing",async()=>{
        const helloTesting = await HelloTesting.deployed();
        const result = await helloTesting.print();
        // console.log("It prints "+result);
        assert(result === "Hello Testing");
    })
    it("should return 1",async()=>{
        const helloTesting = await HelloTesting.deployed();
        const result = await helloTesting.printNum();
        // console.log("It prints "+result);
        assert(result.toNumber()=== 1);
    })
})