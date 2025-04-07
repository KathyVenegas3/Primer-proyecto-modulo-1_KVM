Algoritmo Sistema_calculodecostos	
	
	//Definir constantes 
	definir Descuento_Cupon, Descuento_cantidad, IVA, Peso_paquete, Destino_providencia, Destino_nunoa, Destino_santiagocentro  Como Real
	Descuento_Cupon <- 0.05
	Descuento_cantidad <- 0.1
	IVA <- 0.19
	Peso_paquete <- 500
	Destino_santiagocentro  <- 2500
	Destino_providencia <- 3000
	Destino_nunoa <- 3500
	
	
	//Definir variables segun casuistica
	Definir nombreProducto,comunaDestino, cuponDescuento como cadena
	Definir precioUnitario, cantidad, descuentoCupon, descuentoCantidad, subtotal,totalConDescuentos, totalIVA, totalFinal, sumaEnvio Como Real
	Definir i Como Entero
	Definir destinoEncontrado, destinoCobertura Como Logico // variable es cuando no se ingresa un destino en la zona de cobertura

	//Iniciar variables de arrelgos
	sumaEnvio <- 0 // contador parte en 0
	destinoEncontrado <- falso // esto es cuando no hemos encontrado los destinos validos
	destinoCobertura <- falso
	dimension destinodespacho[3]
	destinodespacho[1] <- "Santiagocentro"
	destinodespacho[2] <- "Providencia"
	destinodespacho[3] <- "Nunoa"
	
	//Solicitar datos a usuario
	Escribir "Favor ingresar nombre del producto a comprar: "
	leer nombreProducto
	Escribir "Favor ingresar precio del producto a comprar: "
	leer precioUnitario
	Escribir "Favor ingresar cantidad del producto a comprar: "
	leer cantidad
	escribir "Favor ingresar comuna para el despacho de la compra (Solo comunas Validas: Santiagocentro, Providencia y Nunoa) : " 
	leer comunaDestino
	
	// Validar si comunas ingresadas estan dentro de la zona de cobertura
	Mientras NO destinoCobertura Hacer
		destinoEncontrado <- Falso
		para i <- 1 hasta 3 Hacer
				Si destinodespacho[i] = comunaDestino Entonces
					destinoCobertura <- Verdadero
					destinoEncontrado <- Verdadero
					Segun comunaDestino Hacer
						Caso "Santiagocentro":
							sumaEnvio <- Destino_santiagocentro + cantidad * Peso_paquete
						Caso "Providencia":
							sumaEnvio <- Destino_providencia + cantidad * Peso_paquete
						Caso "Nunoa":
							sumaEnvio <- Destino_nunoa + cantidad * Peso_paquete
					FinSegun
				FinSi
		FinPara
		Si No destinoCobertura Entonces
			Escribir "Comuna ingresada esta fuera de la zona de cobertura. Las compras solo pueden ser enviadas a SantiagoCentro, Providencia y Nunoa"
			Escribir "Ingresar comuna de destino con el siguiente formato: Santiagocentro, Providencia y Nunoa"
			Leer comunaDestino
		FinSi
	FinMientras
	
	// Solicitar cupon de descuento a cliente
	Escribir "Ingrese cupon de descuento, en caso de no tener dejar en blanco: "
	Leer cuponDescuento
	
	//Calcular subotal de la compra (Sin iva y sin envios)
	subtotal <- precioUnitario * cantidad
	
	//Calcular descuento por cupon
	descuentoCupon <- 0
	si cuponDescuento = "Regalo5" Entonces
		descuentoCupon <- subtotal * Descuento_Cupon
		escribir "Tienes un 5% de descuento en tu compra correspondiente a $ " subtotal * Descuento_Cupon
	Sino
		escribir "No tienes cupon valido para descuento"
	FinSi
	
   //Calcular descuento por cantidad 
	descuentoCantidad <- 0
	si cantidad >= 2 Entonces
		descuentoCantidad <- (subtotal - descuentoCupon) * Descuento_cantidad
		escribir "Tu descuento adicional por compras superiores a 2 articulos es de $ ", (subtotal - descuentoCupon) * Descuento_cantidad
	sino 
		Escribir "No hay descuentos adicionales por cantidad de compra"
	FinSi
	
	//Calcular total con descuentos
	totalConDescuentos <- subtotal - descuentoCupon - descuentoCantidad
	
	//Calcular Iva 
	totalIVA <- totalConDescuentos * IVA
	
	//Calcular total final
	totalFinal <- totalConDescuentos + totalIVA + sumaEnvio 
	
	//Mostrar resultados finales
	
	Escribir "El costo total de envio a la comuna seleccionada ", comunaDestino, " es de $ ", sumaEnvio
	Escribir "El iva de la compra es de: $" totalIVA
	Escribir "El total final de tu compra es de: $", totalfinal
	Escribir "Muchas gracias por tu compra"
	
FinAlgoritmo
