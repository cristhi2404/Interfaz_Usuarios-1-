let usuarios = [];
let usuariosFiltrados = [];
const tablaContenido = document.querySelector(".contenido_tabla_apps") || document.getElementById("contenedorUsuarios");
let ultimoFoco = null;


let paginaActual = 1;
const usuariosPorPagina = 9;
let usuarioaeliminar = null;
let usuarioEditando = null;
const inputBuscar = document.querySelector(".inputbuscar") || document.getElementById("inputbuscar");
const btnBuscar = document.querySelector(".btnbuscar") || document.getElementById("btnbuscar");
fetch("obtener_apps.php")
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
        document.getElementById('textarea-descripcion').value = usuario.descripcion || "";
        document.getElementById('select_tipoaplicacion').value = usuario.id_tipo_aplicacion || "0";
        document.getElementById('input-forma_acceso').value = usuario.forma_acceso || "";
        document.getElementById('input-url').value = usuario.url || "";
        document.getElementById('input-capacitacion').value = usuario.link_capacitacion || "---";
               
        // Vista previa
        document.getElementById('vp-nombre').textContent = usuario.nombre;
        document.getElementById('vp-Descripcion').textContent = usuario.descripcion || "---";
        document.getElementById('vp-Tipoapp').textContent = usuario.nombre_tipo_app || "0" ;
        document.getElementById('vp-Formaacceso').textContent = usuario.forma_acceso || "---" ;
        document.getElementById('vp-url').textContent = usuario.url || "---" ;
        document.getElementById('vp-estado').textContent = usuario.estado;
        document.getElementById('vp-capacitacion').textContent = usuario.link_capacitacion || "---" ; 
        const divimagenuser = document.querySelector(".divimagenuser");
        const btnEliminarFoto = document.getElementById("btnEliminarFoto");
        const vistaprevia = document.getElementById("vistaprevia");
        vistaprevia.setAttribute("title", "Vista previa de " + usuario.nombre);
        const nombreArchivo = usuario.ubicacion_imagen;
        const tieneFoto = (
                nombreArchivo &&
                nombreArchivo.trim() !== "" &&
                !nombreArchivo.includes("logo_defecto")
        );
        // asignar imagen real o default
        if (tieneFoto) {
                divimagenuser.style.backgroundImage = `url('public/img/${nombreArchivo}?v=${Date.now()}')`;
                btnEliminarFoto.style.display = "flex";
                btnEliminarFoto.setAttribute("tabindex", "0");
        } else {
                divimagenuser.style.backgroundImage = `url('./img/logo_defecto.png')`;
                btnEliminarFoto.style.display = "none";
                btnEliminarFoto.setAttribute("tabindex", "-1");
        }

        // Asegurar estilo siempre
        divimagenuser.style.backgroundSize = "contain"; // Muestra la imagen completa
        divimagenuser.style.backgroundRepeat = "no-repeat"; // Evita que se repita si es pequeña
        divimagenuser.style.backgroundPosition = "center";
        divimagenuser.title = "Imagen de " + usuario.nombre;
        


        //-------------------------------------------------------------------------------

}
//cargar usersrs________________________________________________

function cargarUsuarios(Listausers) {
        tablaContenido.innerHTML = ""; // Limpiar el contenido anterior
        const inicio = (paginaActual - 1) * usuariosPorPagina;
        const fin = inicio + usuariosPorPagina;
        const usuariosPagina = Listausers.slice(inicio, fin);
        usuariosPagina.forEach((usuario) => {
                const fila = document.createElement("div");
                fila.classList.add("filasapps");
                fila.style.setProperty("height", "50px", "important"); // Fuerza la altura

                fila.setAttribute("data-id", usuario.id_aplicacion);
                fila.setAttribute("data-nombre", usuario.nombre);
                fila.setAttribute("tabindex", "0");
                // para accesibilidad
                //------------------ div nombre ---------------------
                const divnombre = document.createElement("div");
                divnombre.classList.add("nombre");
                //  div iamgen-------------------------------------------------
                const imgnombre = document.createElement("div");
                imgnombre.classList.add("imgnombre");
                imgnombre.style.width = "auto";
                const nombreimg = document.createElement("img");
                const carpetalogos = "public/img/";
                let archivoImagen = usuario.ubicacion_imagen;
                if (!archivoImagen || archivoImagen.trim() === "") {
                    // Si no tiene imagen o es la por defecto del PHP, ponemos un icono genérico
                    nombreimg.src = "img/logo_defecto.png"; 
                } else {
                    
                    nombreimg.src = carpetalogos + archivoImagen;
                }
                nombreimg.onerror = function() {
                        this.onerror = null; // Evitar bucle infinito
                        this.src = "img/logo_defecto.png";
                };
                nombreimg.alt = "logo";
                nombreimg.style.width = "55px";
                nombreimg.style.height = "40px";
                nombreimg.style.margin = "3px";
                imgnombre.appendChild(nombreimg);
                divnombre.appendChild(imgnombre);
                // div nombre-------------------------------------------------
                const textnombre = document.createElement("div");
                textnombre.classList.add("textnombre");
                textnombre.textContent = usuario.nombre;
                divnombre.appendChild(textnombre);
                fila.appendChild(divnombre);
                //------------------ div TIPO APP (QUE ANTES ERA CEDULA) ----------------------
                const divcedula = document.createElement("div");
                divcedula.classList.add("cedula");
                const imgcedula = document.createElement("div");
                imgcedula.classList.add("imgcedula");
                const cedulaimg = document.createElement("img");
                cedulaimg.src = "img/tarjeta-de-identificacion-removebg-preview_1.png";
                cedulaimg.alt = "Cédula";
                cedulaimg.style.width = "40px";
                cedulaimg.style.height = "40px";
                imgcedula.appendChild(cedulaimg);
                divcedula.appendChild(imgcedula);
                const textcedula = document.createElement("div");
                textcedula.classList.add("textapp");
                textcedula.textContent = usuario.nombre_tipo_app || "Sin Asignar";
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
                        fila.style.backgroundColor = "#c1ecc1ff"; // color de fondo para activo
                } else if (estado === "inactivo") {
                        indicadoraccion.classList.add("inactivo");
                        fila.style.backgroundColor = "#f4bcbc"; // color de fondo para inactivo
                }
                divIndicador.appendChild(indicadoraccion);
                fila.appendChild(divIndicador);
                //------------------ div botones ----------------------
                const divbotones = document.createElement("div");
                divbotones.classList.add("divbotones");
                // para accesibilidad
                fila.appendChild(divbotones);
                const botoneditar = document.createElement("button");
                botoneditar.setAttribute("tabindex", "0");
                botoneditar.setAttribute("title", "Editar usuario");
                botoneditar.classList.add("botoneditar");
                botoneditar.innerHTML = '<img src="img/ojo-abierto.svg" alt="Editar" style="width:20px; height:21px; ">';
                divbotones.appendChild(botoneditar);

                botoneditar.addEventListener("click", () => {
                        ultimoFoco = document.activeElement;
                        abrirModalEdicion(usuario);
                        const modal = document.getElementById("modaleditar");
                        modal.style.display = "flex";
                        modal.scrollTop = 0;
                        document.getElementById("vistaprevia").focus(); // ✅ primer foco correcto
                        trapFocus(modal);

                });
                const botoneliminar = document.createElement("button");
                botoneliminar.setAttribute("tabindex", "0");
                botoneliminar.setAttribute("title", "Cambiar estado del usuario");
                botoneliminar.classList.add("botoneliminar");
                botoneliminar.innerHTML = '<img src="img/tacho-de-reciclaje.svg" alt="Eliminar" style="width: 19px; height:19px;">';

                divbotones.appendChild(botoneliminar);
                botoneliminar.addEventListener("click", () => {
                        ultimoFoco = document.activeElement;
                        usuarioaeliminar = usuario;
                        const modaleliminar = document.getElementById("modalEliminar");
                        modaleliminar.style.display = "flex";
                        const primerElemento = modaleliminar.querySelector("input, button, select, textarea, [tabindex]:not([tabindex='-1'])");
                        if (primerElemento) primerElemento.focus();
                        trapFocus(modaleliminar);
                });

                tablaContenido.appendChild(fila);
        })

        //  luego de renderizar filas:
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

// funcion filtrar usuarios ____________________________________________
function filtrarUsuarios() {
        const texto = inputBuscar.value.toLowerCase().trim();

        // Filtramos el array completo, no las filas actuales
        usuariosFiltrados = usuarios.filter(usuario =>
                usuario.nombre.toLowerCase().includes(texto) ||
                usuario.id_aplicacion.toLowerCase().includes(texto)
        );
        // Reiniciamos la paginación
        paginaActual = 1;

        // Volvemos a cargar la tabla con los usuarios filtrados
        cargarUsuarios(usuariosFiltrados);
}
btnBuscar.addEventListener("click", filtrarUsuarios);
inputBuscar.addEventListener("keyup", filtrarUsuarios);

cargarUsuarios(usuarios);

// funciones de los Botones---------------------------------------
const botonesEditar = document.querySelectorAll(".botoneditar");
const botonesEliminar = document.querySelectorAll(".botoneliminar");
//funbcion boton eliminar---------------------------------------

document.getElementById("cancelarEliminar").addEventListener("click", () => {
        usuarioEditando = null;
        const modal = document.getElementById("modalEliminar");
        modal.style.display = "none";
        modal.scrollTop = 0;
        // 🔹 Reinicia los divs de atributos
        resetAtributos(); // cerramos el modal
});
document.getElementById("cancelareditar").addEventListener("click", () => {
        usuarioEditando = null;
        const modal = document.getElementById("modaleditar")
        modal.style.display = "none";
        resetAtributos();
        modal.scrollTop = 0;
        // cerramos el modal
});
//Funcion boton editar perfil------------------------------------------
document.getElementById("confirmareditar").addEventListener("click", () => {
        if (!usuarioEditando) return;
        const nombre = document.getElementById("input-nombre").value.trim();
        const Descripcion = document.getElementById("textarea-descripcion").value.trim();
        const tipoapp = document.getElementById("select_tipoaplicacion").value.trim();
        const Formadeacceso = document.getElementById("input-forma_acceso").value.trim();
        const url = document.getElementById("input-url").value.trim();
        const capacitacion = document.getElementById("input-capacitacion").value.trim();
        if (!nombre) {
                alert("⚠️ El nombre no puede estar vacío");
                return;
        }
        if (!Descripcion) {
                alert("⚠️ La Descripcion es Obligatoria");
                return;
        }
        if (!tipoapp) {
                alert("⚠️ Ingrese un tipo de aplicacion valido");
                return;
        }
        if (!Formadeacceso) {
                alert("⚠️ Ingrese una forma de acceso valida");
                return;
        }
        if (!url) {
                alert("⚠️ Ingrese una url valida");
                return;
        }
        // Tomar valores del formulario
        const formData = new FormData();
        formData.append("id_aplicacion", usuarioEditando.id_aplicacion);
        formData.append("nombre", nombre);
        formData.append("descripcion", Descripcion);
        formData.append("id_tipo_aplicacion", tipoapp);
        formData.append("forma_acceso", Formadeacceso);
        formData.append("url", url);
        formData.append("link_capacitacion", capacitacion);
        // 🔹 Adjuntar la imagen si el usuario seleccionó una
        const inputImagen = document.getElementById("input-imagen");
        if (inputImagen && inputImagen.files[0]) {
                formData.append("imagen", inputImagen.files[0]);
        }

        fetch("actualizar_app.php", {
                method: "POST",
                body: formData
        })
                .then(async res => {
                        const text = await res.text();

                        try {
                                return JSON.parse(text);
                        } catch (e) {
                                throw new Error("Respuesta no válida del servidor: " + text);
                        }
                })
                .then(data => {
                        if (!data.ok) {
                                console.error("Error del servidor:", data.msg);

                                return;
                        }

                        const idx = usuarios.findIndex(u => u.id_aplicacion === usuarioEditando.id_aplicacion);
                        if (idx !== -1) {
                                Object.assign(usuarios[idx], data.aplicacion);
                                // También actualizamos usuarioEditando por seguridad, aunque apuntan a lo mismo
                                Object.assign(usuarioEditando, data.aplicacion);
                        }
                        const fila = document.querySelector(`[data-id="${usuarioEditando.id_aplicacion}"]`);
                        if (fila) {
                                fila.querySelector(".textnombre").textContent = nombre;
                                fila.setAttribute("data-nombre", nombre);
                                // Actualizar el tipo de app visualmente (buscando el texto del select)
                                const selectElement = document.getElementById("select_tipoaplicacion");
                                const textoTipo = selectElement.options[selectElement.selectedIndex].text;
                                fila.querySelector(".textapp").textContent = textoTipo;
                        }
                        
                        const divimagenuser = document.querySelector(".divimagenuser");
                        if (data.aplicacion && data.aplicacion.ubicacion_imagen) {
                                usuarioEditando.ubicacion_imagen = data.aplicacion.ubicacion_imagen;
                                divimagenuser.style.backgroundImage = `url('public/img/${data.aplicacion.ubicacion_imagen}?v=${Date.now()}')`;
                                document.getElementById("btnEliminarFoto").style.display = "flex";
                        }
                        
                        document.getElementById("input-imagen").value = "";
                        //alert("✅ Cambios guardados correctamente");
                        document.getElementById("modaleditar").style.display = "none";
                        usuarioEditando = null;
                        resetAtributos();
                        alert("✅ Aplicación actualizada correctamente");
                })
                .catch(err => {
                        console.error("Error al guardar cambios:", err);
                        alert("Error en la conexión con el servidor");
                })
                .finally(() => {
                        resetAtributos();
                        const modal = document.getElementById("modaleditar");
                        if (modal) modal.scrollTop = 0;
                });  
});
document.getElementById("confirmarEliminar").addEventListener("click", () => {
        if (!usuarioaeliminar) return;

        const idEmpleado = usuarioaeliminar.id_aplicacion;

        // Normalizamos el estado actual
        const estadoActual = (usuarioaeliminar.estado || "").toString().trim().toLowerCase();
        const nuevoEstado = estadoActual === "activo" ? "inactivo" : "activo";

        const formData = new FormData();
        formData.append("id_aplicacion", idEmpleado);
        formData.append("estado", nuevoEstado);

        fetch("actualizar_app.php", {
                method: "POST",
                body: formData
        })
                .then((response) => response.json())
                .then((data) => {
                        console.log("Respuesta del servidor:", data);
                        if (data.ok) {
                                // Actualizamos el usuario en el arreglo local
                                usuarioaeliminar.estado = nuevoEstado;
                                const index = usuarios.findIndex(u => u.id_aplicacion === idEmpleado);
                                if (index !== -1) {
                                        usuarios[index].estado = nuevoEstado;
                                }

                                // Actualizamos visualmente en la tabla sin recargar
                                const fila = document.querySelector(`[data-id="${idEmpleado}"]`);
                                if (fila) {
                                        const indicador = fila.querySelector(".indicadoraccion");
                                        indicador.classList.remove("activo", "inactivo");
                                        indicador.classList.add(nuevoEstado);
                                        // Cambiar color de fondo según el nuevo estado
                                        if (nuevoEstado === "activo") {
                                                fila.style.backgroundColor = "#c1ecc1ff"; // color de fondo para activo
                                        } else if (nuevoEstado === "inactivo") {
                                                fila.style.backgroundColor = "#f4bcbc"; // color de fondo para inactivo
                                        }
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
        div.setAttribute("tabindex", "0");
        const flecha = div.querySelector('.flecha');
        const contenido = div.querySelector(".div-expandido");
        const inputs = contenido ? contenido.querySelectorAll("input, select, textarea, button") : [];
        inputs.forEach(i => i.setAttribute("tabindex", "-1"));
        function toggleExpand() {
                const abierto = div.classList.toggle("abierto");

                if (abierto) {
                        // primero muestra el contenido
                        contenido.style.display = "block";
                        inputs.forEach(i => i.removeAttribute("tabindex"));
                        // pequeño retraso para que scrollHeight se calcule correctamente
                        requestAnimationFrame(() => {
                                div.style.height = div.scrollHeight + "px";
                        });

                        if (flecha) flecha.style.transform = "rotate(90deg)";
                } else {
                        inputs.forEach(i => i.setAttribute("tabindex", "-1"));
                        div.style.height = div.scrollHeight + "px";
                        requestAnimationFrame(() => {
                                div.style.height = "3.5vh";
                        });

                        if (flecha) flecha.style.transform = "rotate(0deg)";

                        // espera que termine la animación antes de ocultar el contenido
                        setTimeout(() => {
                                contenido.style.display = "none";
                        }, 300);
                }
        }
        div.addEventListener("click", e => {
                if (!["input", "select", "textarea", "button"].includes(e.target.tagName.toLowerCase())) {
                        toggleExpand();
                }
        });
        div.addEventListener("keydown", e => {
                if (e.key === "Enter" || e.key === " ") {
                        e.preventDefault(); // evita que salte al input
                        toggleExpand();
                }
        });

});
document.querySelectorAll(".divcadaatributo input").forEach(input => {
        input.addEventListener("click", e => e.stopPropagation());
});

document.querySelectorAll(".divcadaatributo input").forEach(input => {
        input.addEventListener("input", e => {
                const start = e.target.selectionStart; // guarda la posición del cursor
                const end = e.target.selectionEnd;
                e.target.value = e.target.value.toUpperCase();
                e.target.setSelectionRange(start, end); //evita que el cursor salte
        });
});
function resetAtributos() {
        const atributos = document.querySelectorAll(".divcadaatributo");
        atributos.forEach(div => {
                const contenido = div.querySelector(".div-expandido");
                const flecha = div.querySelector(".flecha");
                const inputs = contenido ? contenido.querySelectorAll("input, select, textarea, button") : [];

                // Quitar clase abierto
                div.classList.remove("abierto");

                // Ocultar contenido
                if (contenido) {
                        contenido.style.display = "none";
                }

                // Bloquear inputs
                inputs.forEach(i => i.setAttribute("tabindex", "-1"));

                // Reiniciar altura y flecha
                div.style.height = "3.5vh";
                if (flecha) flecha.style.transform = "rotate(0deg)";
        });
}
//  Función para cambiar imagen del usuario----------------------------------
const botoncambiarimagen = document.querySelector(".cambiarimagen");
const inputImagen = document.getElementById("input-imagen");
const divimagenuser = document.querySelector(".divimagenuser");
if (botoncambiarimagen && inputImagen && divimagenuser) {
        botoncambiarimagen.addEventListener("click", () => {
                inputImagen.click();
        });
        inputImagen.addEventListener("change", () => {
                const archivo = inputImagen.files[0];
                if (!archivo) return;

                if (!archivo.type.startsWith("image/")) {
                        alert("⚠️ Por favor, selecciona un archivo de imagen válido.");
                        inputImagen.value = ""
                        return;
                }
                const reader = new FileReader();
                reader.onload = (e) => {
                        divimagenuser.style.backgroundImage = `url('${e.target.result}')`;
                        divimagenuser.style.backgroundSize = "contain";
                        divimagenuser.style.backgroundRepeat = "no-repeat";
                        divimagenuser.style.backgroundPosition = "center";
                };
                reader.readAsDataURL(archivo);
        });
}


function trapFocus(modal) {
        const focusable = modal.querySelectorAll("input, button, select, textarea, [tabindex]:not([tabindex='-1'])");
        if (!focusable.length) return;

        const first = focusable[0];
        const last = focusable[focusable.length - 1];

        modal.addEventListener("keydown", (e) => {
                if (e.key === "Tab") {
                        if (e.shiftKey) {
                                // Shift + Tab (retroceso)
                                if (document.activeElement === first) {
                                        e.preventDefault();
                                        last.focus();
                                }
                        } else {
                                // Tab normal (avance)
                                if (document.activeElement === last) {
                                        e.preventDefault();
                                        first.focus();
                                }
                        }
                }
        });
}
// abrir modal de liminar foto de perfil------------------------------
const modalEliminarFoto = document.getElementById("modalEliminarFoto");

document.getElementById("btnEliminarFoto").addEventListener("click", () => {
        ultimoFoco = document.activeElement;
        modalEliminarFoto.style.display = "flex";

        const firstEl = modalEliminarFoto.querySelector("button, [tabindex]:not([tabindex='-1'])");
        if (firstEl) firstEl.focus();

        trapFocus(modalEliminarFoto);
});

document.getElementById("btnEliminarFoto").addEventListener("keydown", (e) => {
        if (e.key === "Enter") {
                e.preventDefault();
                modalEliminarFoto.style.display = "flex";

                const firstEl = modalEliminarFoto.querySelector("button, [tabindex]:not([tabindex='-1'])");
                if (firstEl) firstEl.focus();

                trapFocus(modalEliminarFoto);
        }
});
document.getElementById("confirmarEliminarFoto").addEventListener("click", () => {
        if (!usuarioEditando) return;

        const formData = new FormData();
        formData.append("id_aplicacion", usuarioEditando.id_aplicacion);
        formData.append("eliminar_foto", "1");

        fetch("actualizar_app.php", {
                method: "POST",
                body: formData
        })
                .then(res => res.json())
                .then(data => {
                        if (data.ok) {
                                const divimagenuser = document.querySelector(".divimagenuser");


                                const idx = usuarios.findIndex(u => u.id_aplicacion === usuarioEditando.id_aplicacion);
                                if (idx !== -1) usuarios[idx].imagen = null;
                                
                                const vistap = document.getElementById("vistaprevia");
                                if (vistap) vistap.focus();
                                trapFocus(document.getElementById("modaleditar"));
                                usuarioEditando.imagen = null;
                                divimagenuser.style.backgroundImage = `url('./img/logo_defecto.png')`;
                                document.getElementById("btnEliminarFoto").style.display = "none";
                                document.getElementById("input-imagen").value = "";

                        } else {
                                alert("Error al eliminar la foto: " + data.msg);
                        }
                })
                .catch(err => {
                        console.error(err);
                        alert("Error al conectar con el servidor");
                })
                .finally(() => {
                        document.getElementById("modalEliminarFoto").style.display = "none";
                });
});
document.getElementById("cancelarEliminarFoto").addEventListener("click", () => {
        document.getElementById("modalEliminarFoto").style.display = "none";
});

// Crear un solo tooltip global
const tooltip = document.createElement("div");
tooltip.className = "tooltip";
document.body.appendChild(tooltip);

// Mostrar tooltip al hacer hover sobre una fila
document.addEventListener("mousemove", (e) => {
        const fila = e.target.closest(".filasapps");

        if (fila && fila.dataset.nombre) {
                tooltip.textContent = fila.dataset.nombre + "  " + "  " + "(" + fila.dataset.id + ")";
                tooltip.style.left = (e.pageX + 12) + "px";
                tooltip.style.top = (e.pageY + 5) + "px";
                tooltip.style.opacity = "1";
        } else {
                tooltip.style.opacity = "0";
        }
});