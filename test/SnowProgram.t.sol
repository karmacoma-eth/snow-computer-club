// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/SnowComputerClub.sol";
import "src/TicTacToe.sol";

contract SnowProgramTest is Test {
    uint256 public gasPerRun = 50_000;

    SnowComputerClub public club;
    TicTacToe public tictactoe;

    function setUp() public {
       club = new SnowComputerClub();
       tictactoe = new TicTacToe();
    }

    function testClubCanBeStored() public {
        uint256[64] memory buffer;
        (uint8 index, uint256 value) = club.run{gas: gasPerRun}(buffer, 0);
        require(index < 64, "Should return index");
        require(buffer[index] != value, "Should update value");
    }

    function testTicTacToeOutput() public {
        uint256[64] memory canvas;
        uint256 index;
        uint256 value;

        // with a blank canvas, we paint the first tile
        (index, value) = tictactoe.run(canvas, 0);
        assertEq(index, 40);
        assertEq(value, 0x0001000108090c11046106410281010107810c4118213011001100010001ffff);

        // if the first tile has been painted, we paint the second one
        canvas[index] = value;
        (index, value) = tictactoe.run(canvas, 0);
        assertEq(index, 41);
        assertEq(value, 0x8001800183f18611841198099009b011a011a011a031906198c187818001ffff);

        // if the first tile has been stomped on, it gets repainted
        canvas[40] = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        (index, value) = tictactoe.run(canvas, 0);
        assertEq(index, 40);
        assertEq(value, 0x0001000108090c11046106410281010107810c4118213011001100010001ffff);
    }
}
