//contracts are created by contract 

pragma solidity >=0.5.0 < 0.6.0

contract ZombieWorld {

    event NewZombie(uint zombieId, string name, uint dna);
    
    // start here
    uint myUnsignedInteger = 100;
    // unsigned integer

    uint dnaDigits = 16;

    //Math operations
    // + - / * ** 5
    unint dnaModulos = 10**dnaDigits;


    struct zombie {
    uint age;
    string name;
    }
    Zombie[] public zombies;

    mapping(uint => address) public zombieToOwner;
    mapping(address => uint) ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) internal {
        uint id  = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint){
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulos;

    }

    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }


}



