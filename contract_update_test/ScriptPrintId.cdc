// import TestContract from 0xf8d6e0586b0a20c7

// pub fun main(): String {


// let countCap = publicAccount.getCapability<&{HasCount}>(/public/hasCount)

// // Borrow the capability to get a reference to the stored counter.
// //
// // This borrow succeeds, i.e. the result is not `nil`,
// // it is a valid reference, because:
// //
// // 1. Dereferencing the path chain results in a stored object
// //    (`/public/hasCount` links to `/storage/counter`,
// //    and there is an object stored under `/storage/counter`)
// //
// // 2. The stored value is a subtype of the requested type `{HasCount}`
// //    (the stored object has type `Counter` which conforms to interface `HasCount`)
// //
// let countRef = countCap.borrow()!


//     //let collectionRef = getAccount(0xf8d6e0586b0a20c7).getCapability(/public/TestResourceStorage).borrow<&{TestContract.ReturnId}>() ?? panic("Could not borrow capability from public resouce")
//     let collectionRef = getAccount(0xf8d6e0586b0a20c7).getCapability<&{TestContract.ReturnId}>(/public/TestResourceStorage).borrow<&AnyResource>() ?? panic("Could not borrow capability from public resouce")
  
//     return collectionRef.getType().identifier
// }

import TestContract from 0xf8d6e0586b0a20c7

pub fun main(): Int {
  let countRef = getAccount(0xf8d6e0586b0a20c7).getCapability(/public/hasCount).borrow<&TestContract.Counter>()!
  //return countRef.count 
  return countRef.count
}


 