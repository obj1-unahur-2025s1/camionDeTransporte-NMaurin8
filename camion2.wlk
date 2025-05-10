object camion {
    const carga = []
    method carga() = carga
    method cargar(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuenciaCarga()
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }

    method pesoDeLaCarga() = carga.sum({cosa => cosa.peso()})

    method pesoTotal() = 1000 + self.pesoDeLaCarga()

    method pesosCargaPares() = carga.all({cosa => cosa.peso().even()})

    method algunaCosaPesa(unValor) = carga.any({cosa => cosa.peso() == unValor})

    method primerCosaConPeligro(unPeligro) = carga.find({cosa => cosa.peligro() == unPeligro})

    method cosasQueSuperanPeligro(unPeligro) = carga.filter({cosa => cosa.peligro() > unPeligro})

    method cosasQueSuperanElPeligroDeOtraCosa(unaCosa) = carga.filter({cosa => cosa.peligro() > unaCosa.peligro()})

    method estaExcedidoDePeso() = self.pesoTotal() > 2500
    
    method puedeCircular(nivelPeligro) = !self.estaExcedidoDePeso() and self.cosasQueSuperanPeligro(nivelPeligro).isEmpty()

    method algunaCosaPesaEntre(valorMinimo, valorMaximo) = carga.any({cosa => cosa.peso().between(valorMinimo, valorMaximo)})

    method cosaMasPesada() = carga.max({cosa => cosa.peso()})

    method totalBultos() = carga.sum({cosa => cosa.bulto()})
 }

