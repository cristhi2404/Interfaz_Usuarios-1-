
document.addEventListener("DOMContentLoaded", () => {
    // Inicializar eventos globales al cargar la página
    iniciarEventosAgg();
});

let ultimoFocoAgg = null; // Variable para recordar dónde estaba el foco
const modalAgg = document.getElementById("ModalaggUser");

// Función principal para inicializar todos los eventos
function iniciarEventosAgg() {
    
    // 1. Botón Estirar (si existe)
    const botonEstirar = document.getElementById("divbotonestiraraggusers");
    if (botonEstirar) {
        botonEstirar.onclick = estirar;
        botonEstirar.onkeydown = (e) => {
            // Esto te dirá en la consola (F12) si la tecla funciona
            console.log("Tecla presionada en estirar:", e.key); 
            
            if (e.key === "Enter" || e.key === " ") {
                e.preventDefault();
                estirar();
            }
        };
        
    }

    // 2. Botón "Agregar Usuario" (Abrir modal)
    const divBtnAgg = document.getElementById("divbotonagg");
    if (divBtnAgg) {
        // Click
        divBtnAgg.onclick = abrirModalAgg;
        
        // Teclado (Enter o Espacio)
        divBtnAgg.onkeydown = (e) => {
            if (e.key === "Enter" || e.key === " ") {
                e.preventDefault();
                abrirModalAgg();
            }
        };
    }

    // 3. Botón Cancelar (Cerrar modal)
    const btnCancelar = document.getElementById("cancelaraggtrabajador");
    if (btnCancelar) {
        btnCancelar.addEventListener("click", cerrarModalAgg);
    }

    // 4. Botón Confirmar (Guardar)
    const btnConfirmar = document.getElementById('confirmaraggtrabajador');
    if (btnConfirmar) {
        btnConfirmar.addEventListener("click", (e) => {
            e.preventDefault();
            agregarUsuario();
        });
    }

    // 5. Inicializar lógica de Foto (Vista Previa y Eliminar)
    iniciarLogicaFotoAgg();
}


// FUNCIONES DEL MODAL


function abrirModalAgg() {
    ultimoFocoAgg = document.activeElement; // Guardamos quién abrió el modal
    resetearImagenAgg(); // Limpiamos campos de imagen
    
    if (modalAgg) {
        modalAgg.style.display = "flex";
        
        // Enfocar el primer input (Nombre)
        const primerInput = document.getElementById("nombreagguser");
        if (primerInput) {
            primerInput.focus();
        } else {
            // Si no encuentra el input, enfoca el botón de cancelar por seguridad
            const btnCancel = document.getElementById("cancelaraggtrabajador");
            if(btnCancel) btnCancel.focus();
        }

        // Activamos la trampa de foco para este modal
        modalAgg.addEventListener('keydown', manejarTecladoModal);
    }
}

function cerrarModalAgg() {
    if (modalAgg) {
        modalAgg.style.display = "none";
        // Removemos el evento de teclado para no afectar otros modales
        modalAgg.removeEventListener('keydown', manejarTecladoModal);
    }
    
    // Devolvemos el foco al botón que abrió el modal
    if (ultimoFocoAgg) {
        ultimoFocoAgg.focus();
    }
}

// Función para atrapar el foco (Tabulador) y cerrar con Escape
function manejarTecladoModal(e) {
    const focusableElements = modalAgg.querySelectorAll(
        'a[href], button, textarea, input, select, div[tabindex]:not([tabindex="-1"])'
    );
    
    if (focusableElements.length === 0) return;

    const firstElement = focusableElements[0];
    const lastElement = focusableElements[focusableElements.length - 1];

    // Cierre con Escape
    if (e.key === 'Escape') {
        cerrarModalAgg();
        return;
    }

    // Navegación con Tab
    if (e.key === 'Tab') {
        if (e.shiftKey) { // Shift + Tab (Atrás)
            if (document.activeElement === firstElement) {
                e.preventDefault();
                lastElement.focus();
            }
        } else { // Tab (Adelante)
            if (document.activeElement === lastElement) {
                e.preventDefault();
                firstElement.focus();
            }
        }
    }
}

function estirar() {
    const divbotonaggusers = document.getElementById("divbotonaggusers");
    const divBtnAgg = document.getElementById("divbotonagg");
    const botonEstirar = document.getElementById("divbotonestiraraggusers");

    if (divbotonaggusers && divBtnAgg) {
        divbotonaggusers.classList.toggle("estirado");
        
        if (divbotonaggusers.classList.contains("estirado")) {
            if(botonEstirar) botonEstirar.style.width = "50px";
            divBtnAgg.style.display = "flex";
            divBtnAgg.setAttribute("tabindex", "0");
            setTimeout(() => {
                divBtnAgg.focus();
            }, 50);
        } else {
            divBtnAgg.style.display = "none";
            if(botonEstirar) botonEstirar.style.width = "100%";
            divBtnAgg.setAttribute("tabindex", "-1");
            if(botonEstirar) botonEstirar.focus();
        }
    }
}

// ==========================================================
// LOGICA DE IMAGEN
// ==========================================================

function iniciarLogicaFotoAgg() {
    const btnCambiarFotoAgg = document.querySelector(".cambiarimagenagg");
    const inputFotoAgg = document.getElementById("input-imagenagg");
    const divFotoPreviewAgg = document.getElementById("contenedor-fotoagg");
    const btnEliminarFotoAgg = document.getElementById("btnEliminarFotoagg");

    if (btnCambiarFotoAgg && inputFotoAgg && divFotoPreviewAgg) {
        
        // Click en "Cambiar imagen"
        btnCambiarFotoAgg.addEventListener("click", (e) => {
            e.preventDefault();
            inputFotoAgg.click();
        });

        // Cambio en el input file
        inputFotoAgg.addEventListener("change", () => {
            const archivo = inputFotoAgg.files[0];
            if (!archivo) return;

            if (!archivo.type.startsWith("image/")) {
                alert("⚠️ Por favor, selecciona un archivo de imagen válido.");
                inputFotoAgg.value = "";
                return;
            }

            const reader = new FileReader();
            reader.onload = (e) => {
                divFotoPreviewAgg.style.backgroundImage = `url(${e.target.result})`;
                divFotoPreviewAgg.style.backgroundSize = "cover";
                divFotoPreviewAgg.style.backgroundPosition = "center";
                
                if (btnEliminarFotoAgg) {
                    btnEliminarFotoAgg.style.display = "flex";
                    // Hacerlo accesible por teclado
                    btnEliminarFotoAgg.setAttribute("tabindex", "0");
                }
            };
            reader.readAsDataURL(archivo);
        });

        // Click en Eliminar Foto (X)
        if (btnEliminarFotoAgg) {
            const eliminarFotoHandler = (e) => {
                e.stopPropagation();
                inputFotoAgg.value = "";
                // Imagen por defecto
                divFotoPreviewAgg.style.backgroundImage = "url('img/fotoperfil.png')";
                divFotoPreviewAgg.style.backgroundSize = "cover";
                divFotoPreviewAgg.style.backgroundPosition = "center";
                
                btnEliminarFotoAgg.style.display = "none";
            };

            btnEliminarFotoAgg.addEventListener("click", eliminarFotoHandler);
            
            // Permitir eliminar con Enter
            btnEliminarFotoAgg.addEventListener("keydown", (e) => {
                if (e.key === "Enter" || e.key === " ") {
                    e.preventDefault();
                    eliminarFotoHandler(e);
                }
            });
        }
    }
}

function resetearImagenAgg() {
    const divFotoPreviewAgg = document.getElementById("contenedor-fotoagg");
    const btnEliminarFotoAgg = document.getElementById("btnEliminarFotoagg");
    const inputFotoAgg = document.getElementById("input-imagenagg");

    if (inputFotoAgg) inputFotoAgg.value = "";

    if (divFotoPreviewAgg) {
        divFotoPreviewAgg.style.backgroundImage = "url('img/fotoperfil.png')";
        divFotoPreviewAgg.style.backgroundSize = "cover";
        divFotoPreviewAgg.style.backgroundPosition = "center";
    }

    if (btnEliminarFotoAgg) {
        btnEliminarFotoAgg.style.display = "none";
    }
}

// ==========================================================
// FUNCION ENVIAR DATOS (BACKEND)
// ==========================================================

async function agregarUsuario() {
    alert("Agregando usuario...");
    
    // Obtener valores
    const nombre = document.getElementById("nombreagguser").value;
    const tipodocumento = document.getElementById("tipo_documento").value;
    const numero_documento = document.getElementById("NumeroDocagguser1").value;
    const tipoproceso = document.getElementById("tipo_procesoselect").value;    
    const correo = document.getElementById("correoagguser").value;
    const cargo = document.getElementById("cargoagguser").value;
    const celular = document.getElementById("celularagguser").value;
    const Ubicacion = document.getElementById("ubicacionagguser").value;
    const lineaFija = 0;
    const inputImagen = document.getElementById("input-imagenagg");

    // Empaquetado
    const datos = new FormData();
    datos.append("nombre", nombre);
    datos.append("id_tipo_documento", tipodocumento);
    datos.append("numero_documento", numero_documento);
    datos.append("tipo_proceso", tipoproceso);
    datos.append("correo", correo);
    datos.append("cargo", cargo);
    datos.append("celular", celular);
    datos.append("Id_ubicacion", Ubicacion);
    datos.append("linea_fija", lineaFija);
    
    if (inputImagen && inputImagen.files[0]) {
        datos.append("imagen", inputImagen.files[0]);
    }

    try {
        const response = await fetch('Crearusuario.php', {
            method: 'POST',
            body: datos
        });

        const textresponse = await response.text();
        console.log("Respuesta cruda del servidor:", textresponse);

        try {
            const resultado = JSON.parse(textresponse);
            
            if (resultado.ok) {
                alert('Usuario agregado exitosamente');
                cerrarModalAgg(); // Cerramos modal antes de recargar
                location.reload();
            } else {
                console.error('Error lógico:', resultado.msg);
                alert('Error del servidor: ' + resultado.msg);
            }
        } catch (jsonError) {
            console.error("No se pudo leer JSON. Error real PHP:", textresponse);
            alert("Error fatal en base de datos. Ver consola.");
        }

    } catch (error) {
        console.error('Error de red:', error);
        alert('Error de conexión al intentar agregar usuario');
    }
}


  