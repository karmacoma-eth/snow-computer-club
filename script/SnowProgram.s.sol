// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {SnowProgram} from "src/SnowProgram.sol";

contract SnowProgramDeploy is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new SnowProgram();
    }
}
