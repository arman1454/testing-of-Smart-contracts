const Migrations = artifacts.require("HelloTesting");

module.exports = function(deployer){
    deployer.deploy(Migrations)
}