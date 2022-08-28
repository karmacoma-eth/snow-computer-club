// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ISnowV1Program} from "./ISnowV1Program.sol";

contract SnowProgram is ISnowV1Program {
    function name() external view returns (string memory) {
        return "SnowProgram";
    }

    /// @dev value is interpreted as a 16*16 canvas of black and white pixels, examples:
    /// @dev    0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff is an all white square
    /// @dev    0x0000000000000000000000000000000000000000000000000000000000000000 is an all black square (will be rejected by SnowV1.storeProgram() though)
    /// @dev    ~canvas[lastUpdatedIndex] inverts the colors of the last updated square
    /// @dev sprites can be hardcoded as uint256 and generated at https://snow.computer/operators
    function run(uint256[64] calldata canvas, uint8 lastUpdatedIndex) external returns (uint8 index, uint256 value) {
        index = 42;
        value = 42;
    }
}
