pub contract TestContract {
  
  // pub resource interface ReturnId {
  //   pub fun returnId() : String
  // }

  // pub resource TestResource : ReturnId {
    
  //   pub let id: String

  //   pub fun returnId(): String{
  //     return self.id
  //   }

  //   init() {
  //     self.id = "Hello1"
  //   }
    
  // }

  // init() {
  //       self.account.save(<-create TestResource(), to: /storage/TestResourceStorage)
  //       self.account.link<&AnyResource>(/public/TestResourceStorage, target: /storage/TestResourceStorage)
	// }


  // Declare a resource interface named `HasCount`, that has a field `count`
//

    // Declare a resource named `Counter` that conforms to `HasCount`
    //
    pub resource Counter{
        pub var count: Int

        pub init(count: Int) {
            self.count = count
        }
    }

    init(){
      self.account.save(<-create Counter(count: 42), to: /storage/counter)
      self.account.link<&TestContract.Counter>(/public/hasCount, target: /storage/counter)
    }

}
