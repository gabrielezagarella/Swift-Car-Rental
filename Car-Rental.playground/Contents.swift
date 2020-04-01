import UIKit

/* Comment Kdoc
 @author Gabriele Zagarella
 @project Car rental
 
 Un AutoNoleggio ti richiede di creargli un’applicazione per la gestione delle
 sue auto. Per semplicità d’esercizio:
 ▪ Un’Auto è composta dagli attributi: codice e prenotata. codice è
 una semplice Stringa e prenotata è un Bool di default a false.
 ▪ L’ AutoNoleggio contiene il riferimento ad ogni auto (in un array).
 Un utente deve essere in grado di prenotare un’auto libera utilizzando una
 funzione. Se non ci sono più auto libere deve dare un messaggio d’errore.
 L’utente deve poter prenotare l’auto anche per più giorni
 Aggiungere il costo della prenotazione al giorno
 Un secondo utente che vuole prenotare un’auto prenotata per più giorni
 mostrare il messaggio “Auto prenotata per x giorni”
*/

class Car {
    var brand: String;
    var code: String;
    var booking: Bool = false;
    
    var brandCar: String {
           get {
               return self.brand
           }
           set(brand) {
               self.brand = brand
           }
       }
    
    var codeCar: String {
        get {
            return self.code
        }
        set(code) {
            self.code = code
        }
    }
    
    var newBooking: Bool {
        get {
            return self.booking
        }
        set(booking) {
            self.booking = booking
        }
    }
    
    init(brand:String, code: String) {
        self.brand = brand;
        self.code = code
    }
    
    func toString() -> String{
        return "Brand: \(brand), code: \(code)"
    }
}

class CarRental {
    var name: String;
    var freeCars: [Car] = [];
    var cost: Int = 30;
    var bookedCar: [Car] = [];
    
    var newName: String {
           get {
               return self.name
           }
           set(name) {
               self.name = name
           }
       }
    
    var newFreeCars: [Car] {
        get {
            return self.freeCars
        }
        set(freeCars) {
            self.freeCars = freeCars
        }
    }
    
    var newCost: Int {
        get {
            return self.cost
        }
        set(cost) {
            self.cost = cost
        }
    }
    
    var newBookedCar: [Car] {
        get {
            return self.bookedCar
        }
        set(bookedCar) {
            self.bookedCar = bookedCar
        }
    }
    
    init(name: String) {
        self.name = name;
    }
    
    init(freeCar: [Car], name: String) {
           self.freeCars = freeCar;
           self.name = name;
       }
    
    func insertCar (car: [Car]) -> CarRental {
        let insert = CarRental(freeCar: car, name: self.newName);
        return insert;
    }
    
    func getFreeCar(){
        print("Car rental: \(self.newName)");
        for car in freeCars {
            print("Free car is: \(car.toString())");
        }
        if freeCars.count == 0 {
            print("No free machine present");
        }
    }
    
    func getBookinCar(){
        print("Car rental: \(self.newName)");
        for car in newBookedCar {
            print("Booking car is: \(car.toString())");
        }
        if newBookedCar.count == 0 {
            print("No reserved car present");
        }
    }
    
    func carBooking(code: String, numberDay: Int) {
        if newFreeCars.count == 0 {
            print("No car for booking");
        }
        for (index, car) in newFreeCars.enumerated() {
            if car.newBooking == true && code == car.codeCar {
                print("Car already booked, into other car rental");
            }
            else if code == car.codeCar {
                let totCost: Int = numberDay * self.newCost;
                print("Booking car \(car.brandCar), for \(numberDay) days, cost: \(totCost), into car rental \(newName)");
                car.newBooking = true;
                newFreeCars.remove(at: index);
                newBookedCar.append(car);
            }else {
                print("Code not present for free machines");
            }
            return;
        }
    }
}

"*...Created car object...*"
let car1 = Car.init(brand: "Mini", code: "1");
let car2 = Car.init(brand: "BMW", code: "2");
let car3 = Car.init(brand: "Citroën", code: "3");
let car4 = Car.init(brand: "Lamborghini", code: "4");

"*...Created car rental object...*"
let carRental = CarRental(name: "By Luis");
print("Car rental: \(carRental.newName)");

"*...Inserted car into freeCar...*"
let insertCar = carRental.insertCar(car: [car1, car2]);

print("*...List cars free...*");
insertCar.getFreeCar();
print();

print("*...Added cars into car rental...*");
insertCar.carBooking(code: "1", numberDay: 2);
insertCar.carBooking(code: "2", numberDay: 2);
print();

print("*...List cars free...*");
insertCar.getFreeCar();
print();

print("*...List cars rental...*");
insertCar.getBookinCar();
print();

print("*...Car insertion already inserted in the same car rental...*");
insertCar.carBooking(code: "4", numberDay: 2);
print();


"*...Created car rental object...*"
let carRental1 = CarRental(name: "By Marck");
print("Car rental: \(carRental1.newName)");

"*...Inserted car into freeCar...*"
let insertCar1 = carRental1.insertCar(car: [car3, car4, car1]);

print("*...List cars free...*");
insertCar1.getFreeCar();
print();

print("*...Added cars into car rental...*");
insertCar1.carBooking(code: "3", numberDay: 2);
insertCar1.carBooking(code: "4", numberDay: 2);
print();

print("*...List cars free...*");
insertCar1.getFreeCar();
print();

print("*...List cars rental...*");
insertCar1.getBookinCar();
print();

print("*...Car insertion already inserted in other car rental...*");
insertCar1.carBooking(code: "1", numberDay: 2);


