import parcelas.*

class Semillas {
	var property anioDeObtencion
	var property altura
	
	method horasDeSolTolera() 
	method espacioQueOcupa ()
	method daNuevasSemillas() { return self.esFuerte() }
	method esFuerte() { return self.horasDeSolTolera() > 10 }
	method parcelaIdeal(parcela)
}

class Menta inherits Semillas {
	
	override method horasDeSolTolera() = 6
	override method espacioQueOcupa() { return altura * 3 }
	override method daNuevasSemillas() { return super() || altura > 0.4}
	override method parcelaIdeal(parcela) { return parcela.superficieDeLaParcela() > 6}
	
}

class Soja inherits Semillas {
	
	override method horasDeSolTolera() = if (altura < 0.5) { 6}
											else if (altura.between(0.5,1)) { 7}
											else {9}
	override method espacioQueOcupa() { return altura / 2 }
	override method daNuevasSemillas() { return super() || altura > 1 and anioDeObtencion > 2007 }
	override method parcelaIdeal(parcela) { return parcela.horasDeSol() == self.horasDeSolTolera()}
	
}

class Quinio inherits Semillas {
	
	var property horasDeSolTolera
	override method espacioQueOcupa() { return 0.5 }
	override method daNuevasSemillas() { return super() || anioDeObtencion < 2005}
	override method parcelaIdeal(parcela) { return parcela.plantasQueTiene().any { n => n.altura() < 1.5}
	}
	
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() { return false}
	override method parcelaIdeal(parcela) {return parcela.cantidadMaxima() == 1
	}
}

class HierbaBuena inherits Menta {
	override method espacioQueOcupa()  { return super() * 2}
	
}

