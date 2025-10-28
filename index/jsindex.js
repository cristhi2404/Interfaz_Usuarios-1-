let usuarios = [];
let usuariosFiltrados = [];
const tablaContenido = document.querySelector(".contenido_tabla");

let paginaActual = 1;
const usuariosPorPagina = 50;
let usuarioaeliminar= null;
let usuarioEditando= null;
const inputBuscar = document.querySelector(".inputbuscar") || document.getElementById("inputbuscar");
const btnBuscar = document.querySelector(".btnbuscar") || document.getElementById("btnbuscar");
// 🔻 Cargar los usuarios desde PHP/MySQL
fetch("/Interfaz_Usuarios-1-/obtener_users.php")
        .then(response => response.json())
        .then(data => {
                usuarios = data;
                usuariosFiltrados = [...usuarios];
                cargarUsuarios(usuariosFiltrados);
        })
        .catch(error => console.error("Error al cargar usuarios:", error));
//cargar inputs ________________________________________________
function abrirModalEdicion(usuario) {
        usuarioEditando = usuario;

    // Rellenar los campos del modal con la info actual
        document.getElementById('input-nombre').value = usuario.nombre;
        document.getElementById('input-cargo').value = usuario.cargo;
        document.getElementById('input-tipoDoc').value = usuario.id_tipo_documento;
        document.getElementById('input-docId').value = usuario.numero_documento;
        document.getElementById('input-correo').value = usuario.correo;
        document.getElementById('input-celular').value = usuario.celular;
        document.getElementById('input-lineafija').value = usuario.linea_fija;
        document.getElementById('input-ubicacion').value = usuario.ubicacion;

        // Actualizar la vista previa arriba
        document.getElementById('vp-nombre').textContent = usuario.nombre;
        document.getElementById('vp-cargo').textContent = usuario.cargo;
        document.getElementById('vp-tipoDoc').textContent = usuario.id_tipodocumento;
        document.getElementById('vp-docId').textContent = usuario.numero_documento;
        document.getElementById('vp-correo').textContent = usuario.correo;
        document.getElementById('vp-celular').textContent = usuario.celular;
        document.getElementById('vp-lineafija').textContent = usuario.linea_fija;
        document.getElementById('vp-ubicacion').textContent = usuario.ubicacion;
}
//cargar usersrs________________________________________________

function cargarUsuarios(Listausers) {
        tablaContenido.innerHTML = ""; // Limpiar el contenido anterior
        const inicio = (paginaActual - 1) * usuariosPorPagina;
        const fin = inicio + usuariosPorPagina;
        const usuariosPagina = Listausers.slice(inicio, fin);
        usuariosPagina.forEach((usuario, index) => {
                const fila = document.createElement("div");
                fila.classList.add("filas");
                fila.setAttribute("data-id", usuario.id_empleado);
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
                textcedula.textContent = usuario.numero_documento;
                divcedula.appendChild(textcedula);
                fila.appendChild(divcedula);
        //------------------ div Indicador de accion ----------------------
                const divIndicador = document.createElement("div");
                divIndicador.classList.add("Indicador");
                const indicadoraccion = document.createElement("div");
                indicadoraccion.classList.add("indicadoraccion");
                let estado = (usuario.estado ?? "").toString().trim().toLowerCase();
                // Cambia la clase según el estado
                if (estado === "activo") {
                        indicadoraccion.classList.add("activo");
                } else if(estado === "inactivo") {
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
                divbotones.appendChild(botoneditar);
                
                botoneditar.addEventListener("click", () => {
                        
                        abrirModalEdicion(usuario);
                        document.getElementById("modaleditar").style.display = "flex";

                });
                const botoneliminar = document.createElement("button");
                botoneliminar.classList.add("botoneliminar");
                botoneliminar.innerHTML = '<img src="img/tacho-de-reciclaje.svg" alt="Eliminar" style="width: 13px; height:13px;">';
                
                divbotones.appendChild(botoneliminar);
                botoneliminar.addEventListener("click", () => {
                        usuarioaeliminar = usuario;
                        document.getElementById("modalEliminar").style.display = "flex";
                });
                divbotones.appendChild(botoneditar);
                divbotones.appendChild(botoneliminar);
                fila.appendChild(divbotones);
                tablaContenido.appendChild(fila);
        })

    // 🔻 luego de renderizar filas:
        renderPaginacion(Listausers);
}   
// funcion paginacion ____________________________________________
function renderPaginacion(Listausers) {
        const totalPaginas = Math.ceil(Listausers.length / usuariosPorPagina);
        const contenedorPaginas = document.querySelector(".paginasusers");
        contenedorPaginas.innerHTML = "";

    // Botón anterior
        const btnAnterior = document.querySelector(".divanterior button");
        const btnSiguiente = document.querySelector(".siguiente button");

    // Desactivar si estás en el límite
        btnAnterior.disabled = paginaActual === 1;
        btnSiguiente.disabled = paginaActual === totalPaginas;

        btnAnterior.onclick = () => {
                if (paginaActual > 1) {
                        paginaActual--;
                        cargarUsuarios(Listausers);
                }
        };

        btnSiguiente.onclick = () => {
                if (paginaActual < totalPaginas) {
                        paginaActual++;
                        cargarUsuarios(Listausers);
                }
        };

    // Números de página
        for (let i = 1; i <= totalPaginas; i++) {
                const boton = document.createElement("button");
                boton.textContent = i;
                boton.classList.add("button-paginacion");
                if (i === paginaActual) boton.classList.add("activo1");
                boton.onclick = () => {
                        paginaActual = i;
                        cargarUsuarios(Listausers);
                };
                contenedorPaginas.appendChild(boton);
        }
} 

// cuando el usuario presione “Sí, confirmar”
document.getElementById('confirmareditar').addEventListener('click', () => {
        if (!usuarioEditando) return;

    // obtener nuevos valores desde los inputs
        const nuevosDatos = {
                nombre: document.getElementById('input-nombre').value,
                cargo: document.getElementById('input-cargo').value,
                id_tipodocumento: document.getElementById('input-tipoDoc').value,
                cedula: document.getElementById('input-docId').value,
                correo: document.getElementById('input-correo').value,
                celular: document.getElementById('input-celular').value,
                linea_fija: document.getElementById('input-lineafija').value,
                Ubicacion: document.getElementById('input-ubicacion').value
        };

    // aplicar los cambios al objeto original
        Object.assign(usuarioEditando, nuevosDatos);
        // cerrar el modal
        document.getElementById('modaleditar').style.display = "none";

    // si tienes una función que refresca la tabla, llámala aquí
    // actualizarTablaUsuarios();
});
cargarUsuarios(usuarios);
// funciones de los Botones---------------------------------------
const botonesEditar = document.querySelectorAll(".botoneditar");
const botonesEliminar = document.querySelectorAll(".botoneliminar");
//funbcion boton eliminar---------------------------------------

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
        if (usuarioEditando === null) return;

        const formData = new FormData();
        formData.append("id_empleado", usuarioEditando.id_empleado);
        formData.append("id_proceso", usuarioEditando.id_proceso || 1);
        formData.append("nombre", document.getElementById("input-nombre").value);
        formData.append("cargo", document.getElementById("input-cargo").value);
        formData.append("id_tipo_documento", document.getElementById("input-tipoDoc").value);
        formData.append("numero_documento", document.getElementById("input-docId").value);
        formData.append("correo", document.getElementById("input-correo").value);
        formData.append("celular", document.getElementById("input-celular").value);
        formData.append("linea_fija", document.getElementById("input-lineafija").value);
        formData.append("ubicacion", document.getElementById("input-ubicacion").value);
        

        fetch("/Interfaz_Usuarios-1-/actualizar_usuario.php", {
                method: "POST",
                body: formData
        })
        .then(res => res.json())
        .then(data => {
                console.log("Respuesta cruda:", data);
                if (data.ok) {
                        alert(`✅ Usuario ${nuevoEstado === "activo" ? "activado" : "inactivado"} correctamente`);
                        usuarioaeliminar.estado = nuevoEstado;
                        cargarUsuarios(usuarios);

                } else {
                        alert("⚠️ Error al actualizar el estado: " + data.msg)
                }
        })
        .catch(err => console.error("Error al guardar cambios:", err));

});
document.getElementById("confirmarEliminar").addEventListener("click", () => {
        if (!usuarioaeliminar) return;

        const idEmpleado = usuarioaeliminar.id_empleado;

    // Normalizamos el estado actual
        const estadoActual = (usuarioaeliminar.estado || "").toString().trim().toLowerCase();
        const nuevoEstado = estadoActual === "activo" ? "inactivo" : "activo";

        const formData = new FormData();
        formData.append("id_empleado", idEmpleado);
        formData.append("estado", nuevoEstado);

        fetch("actualizar_usuario.php", {
                method: "POST",
                body: formData
        })
        .then((response) => response.json())
        .then((data) => {
                console.log("Respuesta del servidor:", data);
                if (data.ok) {
            // Actualizamos el usuario en el arreglo local
                        usuarioaeliminar.estado = nuevoEstado;
                        const index = usuarios.findIndex(u => u.id_empleado === idEmpleado);
                        if (index !== -1) {
                                usuarios[index].estado = nuevoEstado;
                        }

                // Actualizamos visualmente en la tabla sin recargar
                        const fila = document.querySelector(`[data-id="${idEmpleado}"]`);
                        if (fila) {
                                const indicador = fila.querySelector(".indicadoraccion");
                                indicador.classList.remove("activo", "inactivo");
                                indicador.classList.add(nuevoEstado);
                        }

                // Mostrar alerta o modal de éxito
                        


                } else {
                        alert("Error al actualizar el estado: " + data.msg);
                }
        })
        .catch(err => {
                console.error("Error al enviar estado:", err);
                
                alert("Error en la conexión con el servidor");
        })
        .finally(() => {
                document.getElementById("modalEliminar").style.display = "none";
                usuarioaeliminar = null;
        });
        
});
//Funcion toggle de atributos------------------------------------------
const atributos = document.querySelectorAll('.divcadaatributo');

// Mostrar / ocultar cada div con animación
atributos.forEach(div => {
        div.addEventListener('click', () => {
                const abierto = div.classList.toggle('abierto');

                if (abierto) {
                        div.style.height = "20vh";
                        div.style.backgroundColor = "var(--color_primario_comfanorte)";
                        const flecha = div.querySelector('.flecha');
                        if (flecha) flecha.style.transform = "rotate(90deg)";
                } else {
                        div.style.height = "3.5vh";
                        div.style.backgroundColor = "black";
                        const flecha = div.querySelector('.flecha');
                        if (flecha) flecha.style.transform = "rotate(0deg)";
                }
        });
});

// evitar que al hacer clic dentro del input se cierre el div
document.querySelectorAll('.divcadaatributo input').forEach(input => {
        input.addEventListener('click', (e) => e.stopPropagation());
});

// función que filtra
function filtrarUsuarios() {
        const texto = inputBuscar.value.toLowerCase().trim();

    // Filtramos el array completo, no las filas actuales
        usuariosFiltrados = usuarios.filter(usuario =>
                usuario.nombre.toLowerCase().includes(texto) ||
                usuario.numero_documento.toLowerCase().includes(texto)
        );

    // Reiniciamos la paginación
        paginaActual = 1;

    // Volvemos a cargar la tabla con los usuarios filtrados
        cargarUsuarios(usuariosFiltrados);
}
btnBuscar.addEventListener("click", filtrarUsuarios);
inputBuscar.addEventListener("keyup", filtrarUsuarios);

document.querySelectorAll(".divcadaatributo input").forEach(input => {
        input.addEventListener("input", e => {
                const start = e.target.selectionStart; // guarda la posición del cursor
                const end = e.target.selectionEnd;
                e.target.value = e.target.value.toUpperCase();
                e.target.setSelectionRange(start, end); // evita que el cursor salte
        });
});


