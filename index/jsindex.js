// simulacion de los divs 
const usuarios = [
        { nombre: "Cristhian Manuel Ferrer Ortega", cedula: "1005026389", estado: "Activo" },
        { nombre: "María González", cedula: "1001234567", estado: "Inactivo" },
        { nombre: "Pedro Ramírez", cedula: "1007654321", estado: "Activo" }
];
const tablaContenido = document.querySelector(".contenido_tabla");
const inputBuscar = document.querySelector(".inputbuscar");


//cargar usersrs________________________________________________

function cargarUsuarios(Listausers) {
        tablaContenido.innerHTML = ""; // Limpiar el contenido anterior
        Listausers.forEach(usuario => {
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
                divbotones.style.display = "grid";
                divbotones.style.gridTemplateColumns = "1fr 1fr";
                fila.appendChild(divbotones);
                const botoneditar = document.createElement("button");
                botoneditar.innerHTML = '<img src="img/ojo-abierto.svg" alt="Editar" style="width:15px; height:16px; cursor:pointer;">';
                botoneditar.classList.add("botoneditar");
                divbotones.appendChild(botoneditar);
                const botoneliminar = document.createElement("button");
                botoneliminar.innerHTML = '<img src="img/tacho-de-reciclaje.svg" alt="Eliminar" style="width: 13px; height:13px; cursor:pointer;">';
                botoneliminar.classList.add("botoneliminar");
                divbotones.appendChild(botoneliminar);
                tablaContenido.appendChild(fila);
        })
}    
cargarUsuarios(usuarios);