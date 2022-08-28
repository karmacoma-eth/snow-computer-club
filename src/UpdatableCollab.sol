// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import {ISnowV1Program} from "./ISnowV1Program.sol";

interface SnowV1 {
    function programs(uint256 tokenId) external view returns (ISnowV1Program);
}

contract UpdatableCollab is ISnowV1Program {
    address public constant SNOW_COMPUTER = 0xF53D926c13Af77C53AFAe6B33480DDd94B167610;

    /// @dev delegates all draw operations to this program
    ISnowV1Program public program;

    function updateProgram(uint256 accessKey, ISnowV1Program _program) external {
        // check that the sender owns this accessKey
        require(IERC721(SNOW_COMPUTER).ownerOf(accessKey) == msg.sender, "You do not own this accessKey");

        // this is an open group, anyone who delegates their access key to this contract can update the program
        require(SnowV1(SNOW_COMPUTER).programs(accessKey) == this, "Must delegate to this contract");

        program = _program;
    }

    function name() external view returns (string memory) {
        return "UpdatableCollab";
    }

    function run(uint256[64] calldata canvas, uint8 lastUpdatedIndex) external returns (uint8 index, uint256 value) {
        // placeholder value if program has not been set yet
        if (address(program) == address(0)) {
            index = lastUpdatedIndex;

            // just scramble the previous update
            value = canvas[lastUpdatedIndex] ^ uint256(keccak256(abi.encodePacked(canvas[lastUpdatedIndex])));
        } else {
            return program.run(canvas, lastUpdatedIndex);
        }
    }
}
