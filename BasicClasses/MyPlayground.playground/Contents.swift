
print("hello world")

class Spaceship{
    var fuelLevel = 100
    var name = ""
    
    func thrust(){
        print("Rocket thrusting initiated for \(name)")
    }
    
    func cruise(){
        print("Cruise initiated for \(name)")
    }
}

var mySpaceship:Spaceship = Spaceship()
mySpaceship.name = "Renee"
print(mySpaceship.fuelLevel)
mySpaceship.cruise()
mySpaceship.thrust()
