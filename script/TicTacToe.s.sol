// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {TicTacToe} from "src/TicTacToe.sol";

contract TicTacToeDeploy is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new TicTacToe();
    }
}
