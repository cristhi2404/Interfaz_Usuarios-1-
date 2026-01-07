const botonEstirar = document.getElementById("divbotonestiraraggusers");
const divbotnagg = document.getElementById("divbotonagg");
const modal = document.getElementById("ModalaggUser");
const botonCerrarModal = document.getElementById("cancelaraggtrabajador");
let Usuarioagregado = null;
document.addEventListener("DOMContentLoaded",() => {
    if(botonEstirar){
        botonEstirar.addEventListener("click", estirar )
    }

});
function estirar(){
    const divbotonaggusers = document.getElementById("divbotonaggusers");
    if(divbotonaggusers){
        divbotonaggusers.classList.toggle("estirado");
        if( divbotonaggusers.classList.contains("estirado")){
            botonEstirar.style.width = "50px";
            divbotnagg.style.display = "flex";
        }else{
            divbotnagg.style.display = "none";
              
        }
    }
}

//  FUNCIÓN PRINCIPAL
async function agregarUsuario(){
    alert("Agregando usuario...");
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
    // empaquetado de los datos
    const datos = new FormData();
    datos.append("nombre",            nombre);
    datos.append("id_tipo_documento", tipodocumento);      // Coincide con PHP
    datos.append("numero_documento",  numero_documento);    // Coincide con PHP
    datos.append("tipo_proceso",      tipoproceso);  // Coincide con PHP
    datos.append("correo",            correo);
    datos.append("cargo",             cargo);
    datos.append("celular",           celular);
    datos.append("Id_ubicacion",         Ubicacion);
    datos.append("linea_fija",        lineaFija); 
    if (inputImagen && inputImagen.files[0]) {
        datos.append("imagen", inputImagen.files[0]);
    }
    try {
        const response = await fetch('Crearusuario.php', {
            method: 'POST',
            body: datos
        });

        // 1. Obtenemos la respuesta cruda primero (CORREGIDO: nombre de variable unificado)
        const textresponse = await response.text();
        console.log("Respuesta cruda del servidor:", textresponse);

        // 2. Intentamos convertir a JSON
        try {
            // CORREGIDO: Usamos la variable 'textresponse' que definimos arriba
            const resultado = JSON.parse(textresponse);
            
            if (resultado.ok) {
                console.log('Usuario agregado:', resultado.usuario); // Nota: tu PHP actual no devuelve "usuario", pero el msg sí
                alert('Usuario agregado exitosamente');
                location.reload();
            } else {
                console.error('Error lógico:', resultado.msg);
                alert('Error del servidor: ' + resultado.msg);
            }
        } catch (jsonError) {
            // Si falla el JSON.parse, es porque PHP devolvió el error de SQL (HTML)
            console.error("No se pudo leer JSON. Error real PHP:", textresponse);
            alert("Error fatal en base de datos. Revisa la consola (F12) para ver el mensaje 'Respuesta cruda'.");
        }

    } catch (error) {
        console.error('Error de red:', error);
        alert('Error de conexión al intentar agregar usuario');
    }
}
function resetearImagenAgg() {
    const divFotoPreviewAgg = document.getElementById("contenedor-fotoagg");
    const btnEliminarFotoAgg = document.getElementById("btnEliminarFotoagg");
    const inputFotoAgg = document.getElementById("input-imagenagg");

    // Limpiamos el input file
    if(inputFotoAgg) inputFotoAgg.value = "";

    // Ponemos la imagen por defecto
    if(divFotoPreviewAgg) {
        // Asegúrate que la ruta coincida con tu carpeta real
        divFotoPreviewAgg.style.backgroundImage = "url('img/fotoperfil.png')";
        divFotoPreviewAgg.style.backgroundSize = "cover";
        divFotoPreviewAgg.style.backgroundPosition = "center";
    }

    // Ocultamos la X porque no hay foto nueva seleccionada aún
    if(btnEliminarFotoAgg) {
        btnEliminarFotoAgg.style.display = "none";
    }
}
divbotnagg.addEventListener("click", ()=>{
    resetearImagenAgg(); // Resetea la imagen cada vez que se abre el modal 
    modal.style.display = "flex";
    
});

botonCerrarModal.addEventListener("click", ()=>{
    modal.style.display = "none";
});
document.getElementById('confirmaraggtrabajador').addEventListener("click", (e) => {
    e.preventDefault(); // Evita recarga accidental
    agregarUsuario();
    modal.style.display = "none";
});
// 4. Lógica de la Foto (Vista Previa)
const btnCambiarFotoAgg = document.querySelector(".cambiarimagenagg");
const inputFotoAgg = document.getElementById("input-imagenagg");
const divFotoPreviewAgg = document.getElementById("contenedor-fotoagg"); // Referencia al cuadro de la foto
const btnEliminarFotoAgg = document.getElementById("btnEliminarFotoagg"); // Botón X (si lo usas)

if (btnCambiarFotoAgg && inputFotoAgg && divFotoPreviewAgg) {
    
    // Al hacer click en el botón "Click aquí", abrimos el selector de archivos
    btnCambiarFotoAgg.addEventListener("click", (e) => {
        e.preventDefault();
        inputFotoAgg.click();
    });

    // Cuando el usuario selecciona un archivo
    inputFotoAgg.addEventListener("change", () => {
        const archivo = inputFotoAgg.files[0];
        
        // Si no hay archivo o canceló, no hacemos nada
        if (!archivo) return;

        // Validamos que sea imagen
        if (!archivo.type.startsWith("image/")) {
            alert("⚠️ Por favor, selecciona un archivo de imagen válido.");
            inputFotoAgg.value = ""; // Limpiamos el input
            return;
        }

        // Leemos el archivo para mostrarlo
        const reader = new FileReader();
        reader.onload = (e) => {
            // Ponemos la imagen como fondo del div
            divFotoPreviewAgg.style.backgroundImage = `url(${e.target.result})`;
            divFotoPreviewAgg.style.backgroundSize = "cover";
            divFotoPreviewAgg.style.backgroundPosition = "center";
            
            // Opcional: Mostrar el botón de eliminar foto si quieres esa funcionalidad también aquí
            if(btnEliminarFotoAgg) btnEliminarFotoAgg.style.display = "flex";
        };
        reader.readAsDataURL(archivo);
    });

    // Opcional: Lógica para el botón "X" de eliminar foto antes de subir
    if(btnEliminarFotoAgg){
        btnEliminarFotoAgg.addEventListener("click", (e) => {
            e.stopPropagation(); // Evitar cerrar modal u otros eventos
            inputFotoAgg.value = ""; // Borramos el archivo del input
            divFotoPreviewAgg.style.backgroundImage = "none"; // Quitamos la imagen de fondo (o pones la default)
            // divFotoPreviewAgg.style.backgroundImage = "url('img/fotoperfil.png')"; // Si tienes una imagen por defecto
            btnEliminarFotoAgg.style.display = "none"; // Ocultamos la X
        });
    }
}




  