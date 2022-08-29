// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {SnowComputerClub} from "src/SnowComputerClub.sol";

contract SnowProgramDeploy is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new SnowComputerClub{salt: 0x000000000000000000000000000000000000000000000009000000000e4984a6}();
    }
}
