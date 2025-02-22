# SnowTrails

## Descripcion general
SnowTrails es una plataforma intuitiva para que los usuarios puedan acceder fácilmente a información sobre rutas de montaña. Esta aplicación está diseñada para ayudar a los senderistas a visualizar rutas y combinarlas, permitiendo planificar trayectos de forma eficiente y segura.

## Instalación
1. Clona el repositorio: git clone https://github.com/AnaGanfornina/SnowTrails.git
2. Abre el proyecto en tu IDE (Xcode )
3. Pulsa el botón de play

## Funcionalidades Completadas

Las funcionalidades completadas pertenecen a la práctica obligatoria, las correspondientes a la parte complementaria están esbozadas pero no implementadas. 

He podido implementar funcionalidades como el login,  visualización de las rutas, añadir y eliminar usuarios  así como la estructura de menus.

<img width="887" alt="Captura de pantalla 2025-02-16 a las 14 03 16" src="https://github.com/user-attachments/assets/5c7681c4-090b-4cc8-9b70-45593bcbd731" />



## Dificultades.

Las mayores dificultades que he tenido a lo largo de la elaboración han sido las referentes a la estructura y división de responsabilidades. Puesto que me llevó gran parte del tiempo elaborar una estructura para el acceso de datos y que tuviera sentido a la hora de la entrada y salidas de los diferentes menus.

Por otro lado a pesar de que en un principio  no le veía la utilidad, acabé por encontrarle parte del sentido de uso a los Logger.

Por último me gustaría remarcar la importancia que ha tenido en mi proyecto la ayuda de mis compañeros pues sus comentarios y consejos han sido clave para superar todas las dificultades que planteaba el proyecto.

## Dudas

Una de las dudas que se me queda por resolver es realmente como desacomplar el flujo del programa en la funcion run, dentro de la clase App. Es decir, no he sido capaz de poder aplicar el tratamiento de errores en las clases MenuController y todas las que heredan de esta. Esto se debe a que cuando intenté hacerlo con una posible funcion displáy para esos menus, toda la estructura de bucles anidados dejaba de funcionar o mejor dicho no sabía como recomponer ese flujo que había creado.

Por otro lado en los ultimos momentos antes de entregar la practica me pregunté si no debían ser static todas las funciones de esos MenuControllers, por lo tanto creo que aún me falta comprender de verdad cuando me conviene tener una función de clase o de instancia.
