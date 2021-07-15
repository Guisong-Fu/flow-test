import FUSD from 0xf8d6e0586b0a20c7

transaction {

// todo: again, check when to use prepare, and when to use execute?

    prepare(adminAccount: AuthAccount) {

        let minter_proxy <- FUSD.createMinterProxy()
        adminAccount.save(<- minter_proxy, to: FUSD.MinterProxyStoragePath)

        adminAccount.link<&FUSD.MinterProxy{FUSD.MinterProxyPublic}>(
            FUSD.MinterProxyPublicPath,
            target: FUSD.MinterProxyStoragePath
        ) ?? panic("Could not link minter proxy")

    }

}
