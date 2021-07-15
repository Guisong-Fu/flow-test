import FUSD from 0xf8d6e0586b0a20c7

transaction {

    let resourceStoragePath: StoragePath
    let capabilityPrivatePath: CapabilityPath

    prepare(adminAccount: AuthAccount) {

        // These paths must be unique within the FUSD contract account's storage
        self.resourceStoragePath = /storage/minter_01
        self.capabilityPrivatePath = /private/minter_01

        // todo: this is used to unlink/revoke the capability
        //adminAccount.unlink(self.capabilityPrivatePath)

        // todo: this is used to link again.
        adminAccount.link<&FUSD.Minter>(
            self.capabilityPrivatePath,
            target: self.resourceStoragePath
        ) ?? panic("Could not link minter")

    }


}
