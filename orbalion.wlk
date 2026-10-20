class Equipos {
  const nombre
  const energiaBase
  var   entrenador
  const property tecnologias = []
  
  method energiaBase() = energiaBase
  method energiasComplementarias() = tecnologias.filter({t => t.activa()}).sum({t => t.valorEnergetico()})
  method energiaTotal() = energiaBase + self.energiasComplementarias()
  method esDePrestigioUniversal()

}

class EquipoLuminico inherits Equipos {
    const radiacionCapturada
    const property cristalesSolares = []
    override method energiaTotal() =
     if(radiacionCapturada <= 5000){
      super() * 1.10
     } else {
      super()
     }

 override method esDePrestigioUniversal() = cristalesSolares.size() >= 3 && entrenador.esDeElite() && tecnologias.any({t => t.activa()})

}

class EquipoSintetico inherits Equipos {
   var procesamientoCentral
   var modulosActivos
   var unidadEstable

   override method energiaTotal() = if(modulosActivos > 5){
    super() * 0.80
   } else {
    super()
   }
   
   method unidadEstable() = unidadEstable

   override method esDePrestigioUniversal() = unidadEstable && modulosActivos > 3 && tecnologias.all({t => t.activa()})
 } 

class EquipoEterico inherits Equipos {
   const nivelDeFluctuacion
   var   portalesAbiertos

  override method esDePrestigioUniversal() = nivelDeFluctuacion > 75 && portalesAbiertos >= 2 && tecnologias.count({t => t.activa()}) >= 2
    
    override method energiaTotal() = if(self.esDePrestigioUniversal()){
      super() * 1.15
    } else {
      super()
    }
}
  

class Entrenador {
  var ciclosSolares
  var enSintonia
  var precision
  var rol
  const property roles =  ["Estratega Cuantico", "Arquitecto De Energia", "Guia Mental"]
 
  method asignarRol(unRol){
   if(!roles.contains(unRol)){
    self.error("Rol no homologado por la FOZ")
   } else {
    rol = unRol
   }
  }

  method cumpleCondicionSegunSuRol() = if(rol == "Estratega Cuantico"){
     precision > 80
  } else if (rol == "Arquitecto De Energia"){
    enSintonia
  } else {
    true
  }

  method esDeElite() = ciclosSolares > 10 && self.cumpleCondicionSegunSuRol()

}

class Tecnologia{
  const nombre
  const valorEnergetico 
  var   activa

  method activa() = activa
  method valorEnergetico() = valorEnergetico
}