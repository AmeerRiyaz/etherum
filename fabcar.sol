
pragma solidity >=0.7.0 <0.9.0;
import "./testing.sol";
contract Fabcar is Test{
    struct Car {
        string make;
        string owner;
    }
     event logger1(address location1 , uint index1 );  
    Car[] public cars ;
    mapping(address => uint) carToWork;
    function createCar(string memory _make, string memory _owner)public {
        address owner = msg.sender;
        cars.push(Car(_make,_owner));
        uint id = cars.length -1;
           emit logger1(msg.sender , id);
carToWork[owner] = id;
pushData(_owner,id);
    }
    function getCarOwner() public view returns(string memory){
        address owner = msg.sender;
        uint id = carToWork[owner];
        return cars[id - 1].owner;
        getData();
    }
    function getCarType() public view returns(string memory){
        address owner = msg.sender;
        uint id = carToWork[owner];
        return cars[id - 1].make;
        getData();
    }
    function changeOwner(string memory _owner , string memory _newowner)public{
           string memory _make= getCarType();
           string memory validate = getCarOwner();
           require( keccak256(abi.encodePacked(_owner)) == keccak256(abi.encodePacked(validate)));
        address owner = msg.sender;
       
        _owner= _newowner;
       cars.push(Car(_make,_owner));
        //cars.push(Car(_owner,_make));
        uint id = cars.length -1;
           emit logger1(msg.sender , id);
carToWork[owner] = id;


    }
}

// //new version 

// pragma solidity >=0.7.0 <0.9.0;
// contract Simple {
// struct Car {
//         string make;
//         string owner;
//     }mapping (string => Car) cars;
//     function Simple()    public
//     {
//         createCar("CAR0","Ford","ameer");
//         createCar("CAR1","Toyota","riyaz");
//         createCar("CAR2","Hyundai","rajath");
//     }
//     function createCar(string key, string make, string owner)public
//     {
//         cars[key] = Car(make,owner);
//     }
//     function changeCarOwner(string key, string newOwner) public
//     {
//         cars[key].owner = newOwner;
//     }    
//     function queryCar(string key)  public view returns (string memory, string memory)
//     {
//         return (cars[key].make, cars[key].owner);
//     }
// }
