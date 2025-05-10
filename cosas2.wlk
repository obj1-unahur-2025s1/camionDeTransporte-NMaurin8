
object knightRider{
    method peso() = 500
    method peligro() = 10

    method bulto() = 1
    method consecuenciaCarga(){

    }
} 

object bumblebee{
    var esRobot = false
    method transformarEnRobot(){
        esRobot = true
    }
    method transformarEnAuto(){
        esRobot = false
    }

    method peso() = 800

    method peligro() = if(esRobot) 30 else 15

    method bulto() = 2
    method consecuenciaCarga(){
        self.transformarEnRobot()
    }
}

object ladrillos{
    var cantidadLadrillos = 2
    method cantidadLadrillos(unaCantidad){
        cantidadLadrillos = unaCantidad
    }

    method peso() = cantidadLadrillos * 2

    method peligro() = 2

    method bulto() = if(cantidadLadrillos <= 100) 1 else if(cantidadLadrillos.between(101, 300)) 2 else 3
    method consecuenciaCarga(){
        self.cantidadLadrillos(cantidadLadrillos + 12)
    }
}

object arena{
    var property peso = 3
    method peligro() = 1

    method bulto() = 1
    method consecuenciaCarga(){
        self.peso(0.max(peso-10))
    }
}

object bateria{
    var estaConMisiles = false
    method cargarMisiles(){
        estaConMisiles = true
    }
    method descargarMisiles(){
        estaConMisiles = false
    }

    method peso() = if(estaConMisiles) 300 else 200
    method peligro() = if(estaConMisiles) 100 else 0

    method bulto() = if(estaConMisiles)2 else 1
    method consecuenciaCarga(){
        self.cargarMisiles()
    }
}

object contenedor{
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }

    method peso() = 100 + carga.sum({cosa => cosa.peso()})
    method peligro() = if(carga.isEmpty()) 0 else carga.max({cosa => cosa.peligro()}).peligro() 

    method bulto() = 1 + carga.sum({cosa => cosa.bulto()})
    method consecuenciaCarga(){
        carga.forEach({cosa => cosa.consecuenciaCarga()})
    }
}

object residuos{
    var property peso = 5
    method peligro() = 200

    method bulto() = 1
    method consecuenciaCarga(){
        self.peso(peso + 15)
    }
    
}

object embalaje{
    var envuelto = ladrillos
    method envolver(unaCosa){
        envuelto = unaCosa
    }

    method peso() = envuelto.peso()
    method peligro() = envuelto.peligro() / 2

    method bulto() = 2
    method consecuenciaCarga(){
        
    }
}
