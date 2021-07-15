import FUSD from 0xf8d6e0586b0a20c7


// error: cannot create resource type outside of containing contract: `FUSD.Administrator`
// that is what I expected

transaction{
  prepare(account: AuthAccount){

    destroy create FUSD.Administrator()

  }
}