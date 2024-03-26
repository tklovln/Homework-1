// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console} from "../../lib/forge-std/src/Test.sol";
import {IStudentV1, IStudentV2, IStudentV3} from "../../test/Classroom/Classroom.t.sol";

/* Problem 1 Interface & Contract */
contract StudentV1 is IStudentV1{
    // Note: You can declare some state variable
    bool public isRegistrationOpen = false;
    function register() external returns (uint256) {
        // TODO: please add your implementaiton here
        if(!isRegistrationOpen){
            isRegistrationOpen = true;
            return uint256(1111);
        } else {
            return uint256(123);
        }
        
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2{
    // IClassroomV2 sender;
    function register() external view returns (uint256) {
        if(!IClassroomV2(msg.sender).isEnrolled()){
            return uint256(1111);
        } else {
            return uint256(123);
        }
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here

        uint gas_left = gasleft();
        console.log(gas_left);
        if(gas_left>5000){
            return uint256(1111);
        } else {
            return uint256(123);
        }
    }
    
}
