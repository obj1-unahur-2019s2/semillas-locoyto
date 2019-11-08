import semillas.*

class Parcelas {
	var property ancho
	var property largo
	var property horasDeSol
	var property plantasQueTiene = #{}
	
	
	method superficieDeLaParcela() {
		return ancho * largo
	}
	
	method  cantidadMaxima() {
		if (ancho > largo) { return self.superficieDeLaParcela() / 5}
		else { return self.superficieDeLaParcela() / 3 + largo}
	} 
	
	method tieneComplicaciones() {
		return plantasQueTiene.any {n => n.horasDeSolTolera() < horasDeSol }
	}
	
	method poderPlantarUnaPlanta(planta) {
		if ( self.cantidadMaxima() > self.cuantasPlantasTiene()	|| self.horasDeSol() - planta.horasDeSolTolera() < 2  ) 
		{ self.error("No Hay Lugar Para Mas Plantas")}
		
		plantasQueTiene.add {planta} 
	}
	
	method cuantasPlantasTiene() {
		return plantasQueTiene.size()
	}
	
}

class ParcelasEcologicas inherits Parcelas {
	method seAsociaBien(planta) { return
		not self.tieneComplicaciones() and planta.esIdeal(self)}

}