// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract EOBImmutableTest is Test {
    /// @dev Address of the EOBImmutable contract.
    EOBImmutable public eobImmutable;

    /// @dev Setup the testing environment.
    function setUp() public {
        eobImmutable = EOBImmutable(
            HuffDeployer.deploy_with_args("EOBImmutable", abi.encode(32))
        );
    }

    /// @dev Ensure that you can get the right "immutable" value.
    function testGetValue() public {
        assertEq(eobImmutable.getValue(), 32);
    }
}

interface EOBImmutable {
    function getValue() external returns (uint256);
}
