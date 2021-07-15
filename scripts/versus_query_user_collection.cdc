// Mainnet
import Art from 0xd796ff17107bbff6
import Versus from 0xd796ff17107bbff6
import FungibleToken from 0xf233dcee88fe0abe
import NonFungibleToken from 0x1d7e57aa55817448

// pub fun main(): UInt64 {

//     //return Art.totalSupply
//     return Versus.totalDrops

//     
// }


pub struct AddressStatus {

  pub(set) var address:Address
  pub(set) var balance: UFix64
  pub(set) var art: [Art.ArtData]
  init (_ address:Address) {
    self.address=address
    self.balance= 0.0
    self.art= []
  }
}

/*
  This script will check an address and print out its FT, NFT and Versus resources
 */
// pub fun main() : AddressStatus {

//     // get the accounts' public address objects
//     let account = getAccount(0xa9a82c6a04d6df2b)
//     let status= AddressStatus(0xa9a82c6a04d6df2b)
    
//     if let vault= account.getCapability(/public/flowTokenBalance).borrow<&{FungibleToken.Balance}>() {
//        status.balance=vault.balance
//     }

//     status.art= Art.getArt(address: 0xa9a82c6a04d6df2b)
    
//     return status

// }




// This transaction returns an array of all the nft ids in the collection

pub fun main(): [UInt64] {

    let collectionRef = getAccount(0xa9a82c6a04d6df2b)
        .getCapability(Art.CollectionPublicPath)
        .borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    
    return collectionRef.getIDs()
}
 