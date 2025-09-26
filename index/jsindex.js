// simulacion de los divs 
const usuarios = [
        { nombre: "Cristhian Manuel Ferrer Ortega", cedula: "1005026389", estado: "Activo" },
        { nombre: "María González", cedula: "1001234567", estado: "Activo" },
        { nombre: "Pedro Ramírez", cedula: "1007654321", estado: "Activo" }
];
const tablaContenido = document.querySelector(".contenido_tabla");
const inputBuscar = document.querySelector(".inputbuscar");

let usuarioaeliminar= null;
//cargar usersrs________________________________________________

function cargarUsuarios(Listausers) {
        tablaContenido.innerHTML = ""; // Limpiar el contenido anterior
        Listausers.forEach((usuario, index) => {
                const fila = document.createElement("div");
                fila.classList.add("filas");
        //------------------ div nombre ---------------------
                const divnombre = document.createElement("div");
                divnombre.classList.add("nombre");
                //  div iamgen-------------------------------------------------
                const imgnombre = document.createElement("div");
                imgnombre.classList.add("imgnombre");
                const nombreimg = document.createElement("img");
                nombreimg.src = "img/usuario.svg";
                nombreimg.alt = "Usuario";
                nombreimg.style.width = "13px";
                nombreimg.style.height = "13px";
                imgnombre.appendChild(nombreimg);
                divnombre.appendChild(imgnombre);
                // div nombre-------------------------------------------------
                const textnombre = document.createElement("div");
                textnombre.classList.add("textnombre");
                textnombre.textContent = usuario.nombre;
                divnombre.appendChild(textnombre);
                fila.appendChild(divnombre);
        //------------------ div cedula ----------------------
                const divcedula = document.createElement("div");
                divcedula.classList.add("cedula");
                const imgcedula = document.createElement("div");
                imgcedula.classList.add("imgcedula");
                const cedulaimg = document.createElement("img");
                cedulaimg.src = "img/tarjeta-de-identificacion-removebg-preview_1.svg";
                cedulaimg.alt = "Cédula";
                cedulaimg.style.width = "13px";
                cedulaimg.style.height = "13px";
                imgcedula.appendChild(cedulaimg);
                divcedula.appendChild(imgcedula);
                const textcedula = document.createElement("div");
                textcedula.classList.add("textcedula");
                textcedula.textContent = usuario.cedula;
                divcedula.appendChild(textcedula);
                fila.appendChild(divcedula);
        //------------------ div Indicador de accion ----------------------
                const divIndicador = document.createElement("div");
                divIndicador.classList.add("Indicador");
                const indicadoraccion = document.createElement("div");
                indicadoraccion.classList.add("indicadoraccion");
                // Cambia la clase según el estado
                if (usuario.estado === "Activo") {
                        indicadoraccion.classList.add("activo");
                } else {
                        indicadoraccion.classList.add("inactivo");
                }
                divIndicador.appendChild(indicadoraccion);
                fila.appendChild(divIndicador);
        //------------------ div botones ----------------------
                const divbotones = document.createElement("div");
                divbotones.classList.add("divbotones");
                fila.appendChild(divbotones);
                const botoneditar = document.createElement("button");
                botoneditar.classList.add("botoneditar");
                botoneditar.innerHTML = '<img src="img/ojo-abierto.svg" alt="Editar" style="width:15px; height:16px; ">';
                botoneditar.classList.add("botoneditar");
                divbotones.appendChild(botoneditar);
                botoneditar.addEventListener("click", () => {
                        usuarioaeliminar = index;
                        document.getElementById("modaleditar").style.display = "flex";
                });
                const botoneliminar = document.createElement("button");
                botoneliminar.classList.add("botoneliminar");
                botoneliminar.innerHTML = '<img src="img/tacho-de-reciclaje.svg" alt="Eliminar" style="width: 13px; height:13px;">';
                
                divbotones.appendChild(botoneliminar);
                botoneliminar.addEventListener("click", () => {
                        usuarioaeliminar = index;
                        document.getElementById("modalEliminar").style.display = "flex";
                });
                tablaContenido.appendChild(fila);
        })
}    
cargarUsuarios(usuarios);
// funciones de los Botones---------------------------------------
const botonesEditar = document.querySelectorAll(".botoneditar");
const botonesEliminar = document.querySelectorAll(".botoneliminar");
//funbcion boton eliminar---------------------------------------
document.getElementById("confirmarEliminar").addEventListener("click", () => {
        if (usuarioaeliminar !== null) {
                if (usuarios[usuarioaeliminar].estado === "Activo") {
                        usuarios[usuarioaeliminar].estado = "Inactivo";
                } else {
                        usuarios[usuarioaeliminar].estado = "Activo";
                }

        cargarUsuarios(usuarios); // recargamos la tabla
        usuarioaeliminar = null;
        }
        document.getElementById("modalEliminar").style.display = "none";
});
document.getElementById("cancelarEliminar").addEventListener("click", () => {
        usuarioaeliminar = null; // olvidamos el índice seleccionado
        document.getElementById("modalEliminar").style.display = "none"; // cerramos el modal
});
document.getElementById("cancelareditar").addEventListener("click", () => {
         // olvidamos el índice seleccionado
        document.getElementById("modaleditar").style.display = "none"; // cerramos el modal
});
//Funcion boton editar perfil------------------------------------------
document.getElementById("confirmareditar").addEventListener("click", () => { 
        
});