
pragma solidity >=0.7.0 <0.9.0;

//import "../hardhat/console.sol";
contract Test {
    //uint value = 100;
 
  event logger(address location , uint inde );   
  struct test {
        string name ;
        uint value;
    }
    uint value = 100;
    // emit logger(value);
  //console.log("something");
    // require("value is ", value);
    test []public testing;
     mapping(address => uint) ownerToTest;
    function pushData(string  memory _name , uint _value) public 
    {
        address owner = msg.sender;
 //uint id = testing.push(test(_name,_value));
 testing.push(test(_name,_value));
 uint id = testing.length -1;
      emit logger(msg.sender , id);
 ownerToTest[owner]=id;
//  uint id = testing.length -1;
//  return id;    }
    }

//  function getData() public view  returns(string memory){
//        address owner = msg.sender;
//          uint id = ownerToTest[owner];
//      return test[id - 1].name;

//  }
    function getData() public view returns (string memory){
       address owner = msg.sender;
       uint id = ownerToTest[owner];
       return testing[id - 1].name;
   }
}