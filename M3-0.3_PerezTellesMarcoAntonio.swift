import Foundation

var expresion = ""

var operaciones = [String]()
var numeros = [Int]()

let operacionesAceptadas = ["*", "/", "+", "-"]

var temporal = ""

print("Ingrese la expresión a resolver")
expresion = readLine()! 

for caracter in expresion{
    if operacionesAceptadas.contains(String(caracter)){

        operaciones.append(String(caracter))
        numeros.append(Int(temporal)!)
        temporal = ""
    }else{

        temporal += String(caracter)
    }

}

if !temporal.isEmpty{

    numeros.append(Int(temporal)!)
}

var resultado = numeros[0]

for (index,numero) in numeros.dropFirst().enumerated(){

  
    switch operaciones[index]{

        case "+":
            resultado += numero
        break

        case "-": 
            resultado -= numero
        break

        case "*":
            resultado *= numero
        break

        case "/":
            resultado /= numero
        break

        default: print("Opción no valida")
    }
}
 
print(resultado)

