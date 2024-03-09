pragma solidity ^0.5.0;

contract MarketPlace{
   string public name; 
   unit public productCount = 0;
   mapping(unit => Product) public products;

   struct Product{
    unit id;
    string name;
    unit price;
    address owner;
    bool purchased;
   }

      event ProductCreated(
        uint id,
        string name,
        uint price,
        address owner,
        bool purchased
    );

    constructor() public{
        name = 'Manthan making first appliaction';
    }

    function createProduct(string memory _name, uint _price) public {
        // Require a valid name
        require(bytes(_name).length > 0);
        // Require a valid price
        require(_price > 0);
        // Increment product count
        productCount ++;
        // Create the product
        products[productCount] = Product(productCount, _name, _price, msg.sender, false);
        // Trigger an event
        emit ProductCreated(productCount, _name, _price, msg.sender, false);
    }

}