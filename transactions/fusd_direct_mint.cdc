import FungibleToken from 0xf8d6e0586b0a20c7
import FUSD from 0xf8d6e0586b0a20c7


/*

AdminAccount can also directly mint tokens.

Basically, he can use his Adminstrator resource to create another Minter resource, and use the mint function
inside that resource to mint tokens.

while the Minter resource needs to be either saved somewhere or destroyed.

As in the FUSD contract, this Minter Resource is not created.


*/


transaction(recipientAddress: Address, amount: UFix64) {

    let tokenReceiver: &{FungibleToken.Receiver}

    prepare(adminAccount: AuthAccount) {

      self.tokenReceiver = getAccount(recipientAddress)
          .getCapability(/public/fusdReceiver)!
          .borrow<&{FungibleToken.Receiver}>()
          ?? panic("Unable to borrow receiver reference")

      // Create a reference to the admin resource in storage.
      let tokenAdmin = adminAccount.borrow<&FUSD.Administrator>(from: FUSD.AdminStoragePath)
          ?? panic("Could not borrow a reference to the admin resource")

      // Create a new minter resource and a private link to a capability for it in the admin's storage.
      let minter <- tokenAdmin.createNewMinter()

      let mintedVault <- minter.mintTokens(amount: amount)
      self.tokenReceiver.deposit(from: <-mintedVault)

      destroy minter

    }

}




