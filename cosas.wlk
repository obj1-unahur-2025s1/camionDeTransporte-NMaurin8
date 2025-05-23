
object knightRider{
    method peso() = 500
    method peligro() = 10
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
}

object ladrillos{
    var cantidadLadrillos = 2
    method cantidadLadrillos(unaCantidad){
        cantidadLadrillos = unaCantidad
    }

    method peso() = cantidadLadrillos * 2

    method peligro() = 2
}

object arena{
    var property peso = 3
    method peligro() = 1
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
}

object residuos{
    var property peso = 5
    method peligro() = 200
}

object embalaje{
    var envuelto = ladrillos
    method envolver(unaCosa){
        envuelto = unaCosa
    }

    method peso() = envuelto.peso()
    method peligro() = envuelto.peligro() / 2
}
