import Foundation

// Función para imprimir una matriz
func printMatriz(_ matriz: [[String]]) {
    for col in 0..<matriz.count {
        var line = ""
        for ren in 0..<matriz[col].count {
            line += "\(matriz[ren][col]) "
        }
        print(line)
    }
}

// Función para determinar si una matriz está vacía
func isMatrixEmpty(_ matriz: [[String]]) -> Bool{
    for col in 0..<matriz.count {
        for ren in 0..<matriz[col].count {
            if matriz[ren][col] != "0" {
                return false
            }
        }
    }

    return true
}

// Variables globales
let n = 4
let m = 4
var aviones = [(2,0,"v"),(1,1,">"),(3,1,"<"),(2,2,"^")]
var originalBoard = [[String]](repeating: [String](repeating: "0", count: m), count: n)
var step = 0
var colisiones = 0
var aviones_pasaron_bien = 0

// Añadir los aviones a la matriz original
for avion in aviones {
    originalBoard[avion.0][avion.1] = avion.2
}

// Imprimir matriz original
print("Matriz original:")
printMatriz(originalBoard)

// Bucle principal
while(!isMatrixEmpty(originalBoard)) {
    step += 1
    var newBoard = [[String]](repeating: [String](repeating: "0", count: m), count: n)

    // Mover aviones
    for i in 0..<m {
        for j in 0..<n {
            let dir = originalBoard[i][j]

            if dir != "0" && dir != "X" {
                var newCoords: (x: Int, y: Int) = (x: i, y: j)

                switch dir {
                case "v":
                    newCoords = (i, j+1)
                case ">":
                    newCoords = (i+1, j)
                case "<":
                    newCoords = (i-1, j)
                case "^":
                    newCoords = (i, j-1)
                default:
                    break
                }

                // Comprobar si hay colisión
                if newBoard[newCoords.x][newCoords.y] != "0" {
                   
                    newBoard[newCoords.x][newCoords.y] = "X"
                    
                } else {
                    newBoard[newCoords.x][newCoords.y] = dir
                }

            }
        }
    }

    //colisiones += 1

    // Comprobar si algún avión llegó al final
    for i in 0..<n {
        if newBoard[i][m-1] != "0" {
            aviones_pasaron_bien += 1
            newBoard[i][m-1] = "0"
        }
    }
    

    // Actualizar matriz original
    originalBoard = newBoard

     for col in 0...n-1 { //x
        for ren in 0...m-1 { //y
            if newBoard[col][ren] == "X" {
                colisiones += 1
                newBoard[col][ren] = "0"
            }
        }
    }

    // Imprimir matriz actual
    print("Matriz en el paso \(step):")
    printMatriz(originalBoard)
}

// Imprimir resultado final
print("Número de colisiones: \(colisiones)")
print("Número de aviones que pasaron bien: \(aviones_pasaron_bien)")
print("Número de pasos necesarios: \(step)")