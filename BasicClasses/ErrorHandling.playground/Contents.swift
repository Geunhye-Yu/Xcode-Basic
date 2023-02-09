import UIKit

enum CheckAdult: Error{
    case negativeNumber
    case zero
    case teenagers(age:Int)
}

class Member{

    func checkAge(_ number:Int) throws -> String{
        guard number > 0 else{
            guard number != 0 else{
                throw CheckAdult.zero
            }
            throw CheckAdult.negativeNumber
        }
        guard number >= 19 else{
            throw CheckAdult.teenagers(age: number)
        }
        return "you are an adult"
    }
    
}

var member: Member = Member()

var insertedAge: Int = 22
do{
    let msg = try member.checkAge(insertedAge)
    print(msg)
}catch{
    switch error{
    case CheckAdult.negativeNumber:
        print("Negative Age")
    case CheckAdult.zero:
        print("Age cannot be 0")
    case CheckAdult.teenagers:
        print("You are teenagers")
    default:
        print("Not sorted")
    }
}

