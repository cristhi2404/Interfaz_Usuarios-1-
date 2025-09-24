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
                fila.style.width = "100%"
                fila.style.height = "3.5vh"
                fila.style.display = "grid"
                fila.style.gridTemplateColumns = "5.5fr 5.6fr 1.1fr 1fr"
                fila.style.filter = "drop-shadow(0px 4px 6px rgba(0,0,0,0.2))"
                fila.style.borderRadius = "3px";
        //------------------ div nombre ---------------------
                const divnombre = document.createElement("div");
                divnombre.classList.add("nombre");
                divnombre.style.display = "flex";
                //  div iamgen-------------------------------------------------
                const imgnombre = document.createElement("div");
                imgnombre.style.width = "8%";
                imgnombre.style.height = "100%";
                imgnombre.display = "flex";
                imgnombre.style.justifyContent = "center";
                imgnombre.style.alignItems = "center";
                imgnombre.style.marginRight = "5px";
                const nombreimg = document.createElement("img");
                nombreimg.src = "../img/user.png";
                nombreimg.style.width = "13px";
                nombreimg.style.height = "13px";
                imgnombre.appendChild(nombreimg);
                divnombre.appendChild(imgnombre);
                // div nombre-------------------------------------------------
                const textnombre = document.createElement("div");
                textnombre.height = "100%";
                textnombre.style.fontSize = "11px";
                textnombre.style.display = "flex";
                textnombre.style.alignItems = "center";
                textnombre.style.fontWeight = "600";
                textnombre.textContent = usuario.nombre;
                divnombre.appendChild(textnombre);
                fila.appendChild(divnombre);
        //------------------ div cedula ----------------------
                const divcedula = document.createElement("div");
                divcedula.classList.add("cedula");
                divcedula.style.display = "flex";
                const imgcedula = document.createElement("div");
                imgnombre.style.width = "8%";
                imgnombre.style.height = "100%";
                imgnombre.display = "flex";
                imgnombre.style.justifyContent = "center";
                imgnombre.style.alignItems = "center";
                imgnombre.style.marginRight = "5px";
                const cedulaimg = document.createElement("img");
                nombreimg.src = "../img/user.png";
                nombreimg.style.width = "13px";
                nombreimg.style.height = "13px";
                imgcedula.appendChild(cedulaimg);
                divcedula.appendChild(imgcedula);
                const textcedula = document.createElement("div");
                textcedula.height = "100%";
                textcedula.style.fontSize = "11px";
                textcedula.style.display = "flex";
                textcedula.style.alignItems = "center";
                textcedula.style.fontWeight = "600";
                textcedula.textContent = usuario.cedula;
                divcedula.appendChild(textcedula);
                fila.appendChild(divcedula);
        //------------------ div Indicador de accion ----------------------
                const divIndicador = document.createElement("div");
                divIndicador.classList.add("Indicacdor");
                divIndicador.style.display = "flex";
                divIndicador.style.justifyContent = "center";
                divIndicador.style.alignItems = "center";
                const indicadoraccion = document.createElement("div");
                indicadoraccion.style.width = "10px";
                indicadoraccion.style.height = "10px";
                indicadoraccion.style.borderRadius = "50%";
                indicadoraccion.style.outline ="1px solid"
                indicadoraccion.style.background = usuario.estado === "Activo" ? "green" : "red";
                divIndicador.appendChild(indicadoraccion);
                fila.appendChild(divIndicador);
        //------------------ div botones ----------------------
                const divbotones = document.createElement("div");
                divbotones.style.display = "grid";
                divbotones.style.gridTemplateColumns = "1fr 1fr";
                fila.appendChild(divbotones);
                const botoneditar = document.createElement("button");
                botoneditar.innerHTML = '<img src="../img/ojo-abierto.svg" alt="Editar" style="width:18px; height:16px; cursor:pointer;">';
                botoneditar.classList.add("botoneditar");
                divbotones.appendChild(botoneditar);
                const botoneliminar = document.createElement("button");
                botoneliminar.innerHTML = '<img src="../img/editar.svg" alt="Eliminar" style="width: 13px; height:13px; cursor:pointer;">';
                botoneliminar.classList.add("botoneliminar");
                divbotones.appendChild(botoneliminar);
                tablaContenido.appendChild(fila);
        })
}    