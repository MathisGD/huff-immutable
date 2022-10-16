// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleImmutableTest is Test {
    /// @dev Address of the SimpleImmutable contract.
    SimpleImmutable public simpleImmutable;

    /// @dev Setup the testing environment.
    function setUp() public {
        address deployedAddress;

        // The bytecode given by huffc is:      60248060093d393df360003560e01c806320965255146100165760006000fd5b602080380360003960206000f3
        // We concatenate with 32 (in hexa):    60248060093d393df360003560e01c806320965255146100165760006000fd5b602080380360003960206000f30000000000000000000000000000000000000000000000000000000000000020
        // Then we change a little bit the beginning, in order for it to return the new bigger runtime bytecode:
        //     OPCODE                   STACK
        // 0x60: PUSH1
        // 0x44: 68                 [size]
        // 0x80: DUP1               [size, size]
        // 0x60: PUSH1
        // 0x09: 9                  [offset, size, size]
        // 0x3d: RETURNDATASIZE     [destOffset, offset, size, size]
        // 0x39: CODECOPY           [size]
        // 0x3d: RETURNDATASIZE     [offset, size]
        // 0xf3: RETURN             []

        bytes memory initBytecode = hex"60448060093d393df360003560e01c806320965255146100165760006000fd5b602080380360003960206000f30000000000000000000000000000000000000000000000000000000000000020"; // prettier-ignore

        assembly {
            deployedAddress := create(
                0,
                add(initBytecode, 0x20),
                mload(initBytecode)
            )
        }
        simpleImmutable = SimpleImmutable(deployedAddress);
    }

    /// @dev Ensure that you can get the right "immutable" value.
    function testGetValue() public {
        assertEq(simpleImmutable.getValue(), 32);
    }
}

interface SimpleImmutable {
    function getValue() external returns (uint256);
}
