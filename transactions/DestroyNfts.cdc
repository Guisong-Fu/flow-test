import NonFungibleToken from 0x01cf0e2f2f715450
import ExampleNFT from 0x179b6b1cb6755e31

// This script uses the NFTMinter resource to mint a new NFT
// It must be run with the account that has the collector resource
// stored in /storage/NFTMinter

transaction() {

    // local variable for storing the collector reference
    let collector: &ExampleNFT.Collection

    prepare(signer: AuthAccount) {

        // borrow a reference to the NFTMinter resource in storage
        self.collector = signer.borrow<&ExampleNFT.Collection>(from: /storage/NFTCollection)
            ?? panic("Could not borrow a reference to the NFT collector")

        destroy signer.load<@ExampleNFT.Collection>(from: /storage/NFTCollection)
    }

    execute {
        // Borrow the recipient's public NFT collection reference

        // Mint the NFT and deposit it to the recipient's collection
        
    }
}
