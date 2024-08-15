// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PokeDIO is ERC721{

struct Pokemom{
string name;
uint level;
string img;}



Pokemom[] public pokemons;
address public gameOwner;

constructor () ERC721 ("PokeDIO", "PKD"){
    gameOwner = msg.sender;}


modifier onlyOwnerOf (uint _monsterId){
    require(ownerOf(_monsterId) == msg.sender, "Apenas o pode batalhar com este pokemom");
    _;}


function battle(uint _attackingPokemom, uint _defendingPokemom) public  onlyOwnerOf(_attackingPokemom){
Pokemom storage attacker = pokemons[_attackingPokemom];
Pokemom storage defender = pokemons[_defendingPokemom];

    if (attacker.level >= defender.level) {
    attacker.level += 2;
    defender.level += 1;
   }else{
    attacker.level += 1;
    defender.level += 2;}

}

function createNewPokemom(string memory _name, address _to, string memory _img) public{
require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos pokemons.");
uint id = pokemons.length;
pokemons.push(Pokemom(_name, 1, _img));
_safeMint(_to,id);


}

}