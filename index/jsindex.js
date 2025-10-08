
const usuarios = [
        { id_empleado:"1", id_proceso:"1", cargo:"Aprendiz", nombre:"Cristhian Manuel Ferrer Ortega", id_tipodocumento:"1", cedula:"1005026389", correo:"cristhianferrer24@gmail.com", celular:"3213625488", linea_fija:"123", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"2", id_proceso:"2", cargo:"Supervisor", nombre:"Laura Martínez Gómez", id_tipodocumento:"1", cedula:"1001234567", correo:"laura.martinez@example.com", celular:"3102457896", linea_fija:"201", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"3", id_proceso:"1", cargo:"Técnico", nombre:"Juan Pablo Ríos Hernández", id_tipodocumento:"1", cedula:"1005678945", correo:"juan.rios@example.com", celular:"3154789652", linea_fija:"202", Ubicacion:"Planta Norte", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"4", id_proceso:"3", cargo:"Ingeniero", nombre:"Camila Torres Lozano", id_tipodocumento:"1", cedula:"1012389456", correo:"camila.torres@example.com", celular:"3126589741", linea_fija:"203", Ubicacion:"Oficina Técnica", Ubi_foto:"", estado:"activo" },
        { id_empleado:"5", id_proceso:"2", cargo:"Operario", nombre:"David Castillo Ramos", id_tipodocumento:"1", cedula:"1032548965", correo:"david.castillo@example.com", celular:"3163254789", linea_fija:"204", Ubicacion:"Bodega Sur", Ubi_foto:"", estado:"activo" },
        { id_empleado:"6", id_proceso:"4", cargo:"Aprendiz", nombre:"Valentina López Pardo", id_tipodocumento:"1", cedula:"1045896321", correo:"valentina.lopez@example.com", celular:"3224567895", linea_fija:"205", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"7", id_proceso:"3", cargo:"Supervisor", nombre:"Andrés Ramírez Vega", id_tipodocumento:"1", cedula:"1056987452", correo:"andres.ramirez@example.com", celular:"3115789645", linea_fija:"206", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"8", id_proceso:"2", cargo:"Analista", nombre:"María Fernanda Ruiz Pérez", id_tipodocumento:"1", cedula:"1065897423", correo:"maria.ruiz@example.com", celular:"3147896523", linea_fija:"207", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"9", id_proceso:"4", cargo:"Técnico", nombre:"Felipe Castro Mora", id_tipodocumento:"1", cedula:"1074561239", correo:"felipe.castro@example.com", celular:"3104578963", linea_fija:"208", Ubicacion:"Planta Sur", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"10", id_proceso:"1", cargo:"Administrador", nombre:"Sara López Gutiérrez", id_tipodocumento:"1", cedula:"1089654712", correo:"sara.lopez@example.com", celular:"3206589741", linea_fija:"209", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"11", id_proceso:"3", cargo:"Aprendiz", nombre:"Nicolás Peña Rincón", id_tipodocumento:"1", cedula:"1098547123", correo:"nicolas.pena@example.com", celular:"3127896541", linea_fija:"210", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"12", id_proceso:"4", cargo:"Operario", nombre:"Juliana Ortiz Suárez", id_tipodocumento:"1", cedula:"1103654789", correo:"juliana.ortiz@example.com", celular:"3196548725", linea_fija:"211", Ubicacion:"Planta Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"13", id_proceso:"2", cargo:"Ingeniero", nombre:"Carlos Andrés Mejía", id_tipodocumento:"1", cedula:"1112458796", correo:"carlos.mejia@example.com", celular:"3136547892", linea_fija:"212", Ubicacion:"Oficina Técnica", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"14", id_proceso:"1", cargo:"Supervisor", nombre:"Paula Andrea Cárdenas", id_tipodocumento:"1", cedula:"1123658794", correo:"paula.cardenas@example.com", celular:"3176589412", linea_fija:"213", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"15", id_proceso:"4", cargo:"Técnico", nombre:"Sebastián Navarro Rojas", id_tipodocumento:"1", cedula:"1132569741", correo:"sebastian.navarro@example.com", celular:"3214785963", linea_fija:"214", Ubicacion:"Planta Sur", Ubi_foto:"", estado:"activo" },
        { id_empleado:"16", id_proceso:"3", cargo:"Operario", nombre:"Diana Carolina Soto", id_tipodocumento:"1", cedula:"1145698723", correo:"diana.soto@example.com", celular:"3168745214", linea_fija:"215", Ubicacion:"Bodega Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"17", id_proceso:"2", cargo:"Analista", nombre:"Mateo Rivera Lozano", id_tipodocumento:"1", cedula:"1156987412", correo:"mateo.rivera@example.com", celular:"3184526971", linea_fija:"216", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"18", id_proceso:"4", cargo:"Aprendiz", nombre:"Isabela Vargas Peña", id_tipodocumento:"1", cedula:"1165897423", correo:"isabela.vargas@example.com", celular:"3147852369", linea_fija:"217", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"19", id_proceso:"1", cargo:"Supervisor", nombre:"Tomás Herrera Londoño", id_tipodocumento:"1", cedula:"1178965412", correo:"tomas.herrera@example.com", celular:"3156987421", linea_fija:"218", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"20", id_proceso:"2", cargo:"Ingeniero", nombre:"Natalia Pérez Rojas", id_tipodocumento:"1", cedula:"1189654785", correo:"natalia.perez@example.com", celular:"3104526987", linea_fija:"219", Ubicacion:"Oficina Técnica", Ubi_foto:"", estado:"activo" },
        { id_empleado:"21", id_proceso:"1", cargo:"Técnico", nombre:"Andrés Felipe Gómez", id_tipodocumento:"1", cedula:"1198564712", correo:"andres.gomez@example.com", celular:"3224586974", linea_fija:"220", Ubicacion:"Planta Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"22", id_proceso:"3", cargo:"Operario", nombre:"Daniela Cifuentes Mora", id_tipodocumento:"1", cedula:"1209658745", correo:"daniela.cifuentes@example.com", celular:"3196587412", linea_fija:"221", Ubicacion:"Bodega Sur", Ubi_foto:"", estado:"activo" },
        { id_empleado:"23", id_proceso:"2", cargo:"Aprendiz", nombre:"Samuel Torres Peña", id_tipodocumento:"1", cedula:"1214589632", correo:"samuel.torres@example.com", celular:"3178965412", linea_fija:"222", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"24", id_proceso:"4", cargo:"Analista", nombre:"Manuela García Cárdenas", id_tipodocumento:"1", cedula:"1226547893", correo:"manuela.garcia@example.com", celular:"3201456987", linea_fija:"223", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"25", id_proceso:"3", cargo:"Supervisor", nombre:"Esteban Vargas Ruiz", id_tipodocumento:"1", cedula:"1235478965", correo:"esteban.vargas@example.com", celular:"3124569874", linea_fija:"224", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"26", id_proceso:"1", cargo:"Ingeniero", nombre:"Daniel López Pineda", id_tipodocumento:"1", cedula:"1245896321", correo:"daniel.lopez@example.com", celular:"3154789652", linea_fija:"225", Ubicacion:"Oficina Técnica", Ubi_foto:"", estado:"activo" },
        { id_empleado:"27", id_proceso:"2", cargo:"Aprendiz", nombre:"Sofía Martínez Rojas", id_tipodocumento:"1", cedula:"1254789632", correo:"sofia.martinez@example.com", celular:"3165897423", linea_fija:"226", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"28", id_proceso:"3", cargo:"Operario", nombre:"Juan Esteban Roldán", id_tipodocumento:"1", cedula:"1265897423", correo:"juan.roldan@example.com", celular:"3114789652", linea_fija:"227", Ubicacion:"Planta Sur", Ubi_foto:"", estado:"activo" },
        { id_empleado:"29", id_proceso:"1", cargo:"Supervisor", nombre:"Lina María Castaño", id_tipodocumento:"1", cedula:"1275896321", correo:"lina.castano@example.com", celular:"3126547896", linea_fija:"228", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"30", id_proceso:"4", cargo:"Analista", nombre:"Carlos Ramírez Suárez", id_tipodocumento:"1", cedula:"1289632547", correo:"carlos.ramirez@example.com", celular:"3198547214", linea_fija:"229", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"31", id_proceso:"2", cargo:"Técnico", nombre:"Julieta Herrera Pérez", id_tipodocumento:"1", cedula:"1296589745", correo:"julieta.herrera@example.com", celular:"3216547896", linea_fija:"230", Ubicacion:"Planta Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"32", id_proceso:"3", cargo:"Operario", nombre:"Gabriel Arias Montoya", id_tipodocumento:"1", cedula:"1307854963", correo:"gabriel.arias@example.com", celular:"3178956412", linea_fija:"231", Ubicacion:"Bodega Sur", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"33", id_proceso:"1", cargo:"Aprendiz", nombre:"Valeria Gutiérrez Soto", id_tipodocumento:"1", cedula:"1314789652", correo:"valeria.gutierrez@example.com", celular:"3189657412", linea_fija:"232", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"34", id_proceso:"4", cargo:"Supervisor", nombre:"Andrés Molina Vélez", id_tipodocumento:"1", cedula:"1325478965", correo:"andres.molina@example.com", celular:"3124578965", linea_fija:"233", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"35", id_proceso:"2", cargo:"Ingeniero", nombre:"Lucía Ramírez Quintero", id_tipodocumento:"1", cedula:"1336987452", correo:"lucia.ramirez@example.com", celular:"3145896321", linea_fija:"234", Ubicacion:"Oficina Técnica", Ubi_foto:"", estado:"activo" },
        { id_empleado:"36", id_proceso:"3", cargo:"Técnico", nombre:"Kevin Morales Peña", id_tipodocumento:"1", cedula:"1345896321", correo:"kevin.morales@example.com", celular:"3196524785", linea_fija:"235", Ubicacion:"Planta Sur", Ubi_foto:"", estado:"activo" },
        { id_empleado:"37", id_proceso:"4", cargo:"Analista", nombre:"Fernanda López Restrepo", id_tipodocumento:"1", cedula:"1356987412", correo:"fernanda.lopez@example.com", celular:"3104526987", linea_fija:"236", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"38", id_proceso:"1", cargo:"Supervisor", nombre:"Santiago Cárdenas Díaz", id_tipodocumento:"1", cedula:"1365478965", correo:"santiago.cardenas@example.com", celular:"3164789652", linea_fija:"237", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"39", id_proceso:"2", cargo:"Operario", nombre:"Daniela Orozco Villa", id_tipodocumento:"1", cedula:"1376987452", correo:"daniela.orozco@example.com", celular:"3196547896", linea_fija:"238", Ubicacion:"Bodega Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"40", id_proceso:"3", cargo:"Aprendiz", nombre:"Esteban López Peña", id_tipodocumento:"1", cedula:"1389654712", correo:"esteban.lopez@example.com", celular:"3126589745", linea_fija:"239", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"41", id_proceso:"1", cargo:"Técnico", nombre:"Mariana Torres Silva", id_tipodocumento:"1", cedula:"1396589741", correo:"mariana.torres@example.com", celular:"3214785963", linea_fija:"240", Ubicacion:"Planta Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"42", id_proceso:"4", cargo:"Supervisor", nombre:"Felipe Gutiérrez Mora", id_tipodocumento:"1", cedula:"1402365987", correo:"felipe.gutierrez@example.com", celular:"3104789652", linea_fija:"241", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"inactivo" },
        { id_empleado:"43", id_proceso:"2", cargo:"Operario", nombre:"Laura Pérez Gómez", id_tipodocumento:"1", cedula:"1415896325", correo:"laura.perez@example.com", celular:"3126589741", linea_fija:"242", Ubicacion:"Planta Sur", Ubi_foto:"", estado:"activo" },
        { id_empleado:"44", id_proceso:"3", cargo:"Analista", nombre:"Julián Ramírez Correa", id_tipodocumento:"1", cedula:"1425698741", correo:"julian.ramirez@example.com", celular:"3194569874", linea_fija:"243", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"45", id_proceso:"1", cargo:"Aprendiz", nombre:"Camila Herrera Pardo", id_tipodocumento:"1", cedula:"1436589741", correo:"camila.herrera@example.com", celular:"3186547896", linea_fija:"244", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" },
        { id_empleado:"46", id_proceso:"4", cargo:"Supervisor", nombre:"Andrés Suárez Mejía", id_tipodocumento:"1", cedula:"1445896321", correo:"andres.suarez@example.com", celular:"3176589745", linea_fija:"245", Ubicacion:"Oficina Central", Ubi_foto:"", estado:"activo" },
        { id_empleado:"47", id_proceso:"2", cargo:"Técnico", nombre:"Sofía García Rojas", id_tipodocumento:"1", cedula:"1456987412", correo:"sofia.garcia@example.com", celular:"3204789652", linea_fija:"246", Ubicacion:"Planta Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"48", id_proceso:"3", cargo:"Analista", nombre:"Miguel Ángel Castillo", id_tipodocumento:"1", cedula:"1465896321", correo:"miguel.castillo@example.com", celular:"3197458632", linea_fija:"247", Ubicacion:"Oficina de Datos", Ubi_foto:"", estado:"activo" },
        { id_empleado:"49", id_proceso:"4", cargo:"Operario", nombre:"Daniel Torres Peña", id_tipodocumento:"1", cedula:"1478569235", correo:"daniel.torres@example.com", celular:"3165478912", linea_fija:"248", Ubicacion:"Bodega Norte", Ubi_foto:"", estado:"activo" },
        { id_empleado:"50", id_proceso:"1", cargo:"Aprendiz", nombre:"Valentina Rodríguez Arias", id_tipodocumento:"1", cedula:"1489654712", correo:"valentina.rodriguez@example.com", celular:"3224586971", linea_fija:"249", Ubicacion:"Edificio Sede", Ubi_foto:"", estado:"activo" }
];
const tablaContenido = document.querySelector(".contenido_tabla");


let usuarioaeliminar= null;
let usuarioEditando= null;
//cargar inputs ________________________________________________
function abrirModalEdicion(usuario) {
        usuarioEditando = usuario;

    // Rellenar los campos del modal con la info actual
        document.getElementById('input-nombre').value = usuario.nombre;
        document.getElementById('input-cargo').value = usuario.cargo;
        document.getElementById('input-tipoDoc').value = usuario.id_tipodocumento;
        document.getElementById('input-docId').value = usuario.cedula;
        document.getElementById('input-correo').value = usuario.correo;
        document.getElementById('input-celular').value = usuario.celular;
        document.getElementById('input-lineafija').value = usuario.linea_fija;
        document.getElementById('input-ubicacion').value = usuario.Ubicacion;

        // Actualizar la vista previa arriba
        document.getElementById('vp-nombre').textContent = usuario.nombre;
        document.getElementById('vp-cargo').textContent = usuario.cargo;
        document.getElementById('vp-tipoDoc').textContent = usuario.id_tipodocumento;
        document.getElementById('vp-docId').textContent = usuario.cedula;
        document.getElementById('vp-correo').textContent = usuario.correo;
        document.getElementById('vp-celular').textContent = usuario.celular;
        document.getElementById('vp-lineafija').textContent = usuario.linea_fija;
        document.getElementById('vp-ubicacion').textContent = usuario.Ubicacion;
}
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
                if (usuario.estado === "Activo" || usuario.estado === "activo") {
                        indicadoraccion.classList.add("activo");
                } else if(usuario.estado === "Inactivo" || usuario.estado === "inactivo") {
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
                        const userdatos = usuarios[index];
                        abrirModalEdicion(userdatos);
                        document.getElementById("modaleditar").style.display = "flex";
                        
                        document.getElementById("vp-nombre").textContent = userdatos.nombre;
                        document.getElementById("vp-cargo").textContent = userdatos.cargo;
                        document.getElementById("vp-tipoDoc").textContent = userdatos.id_tipodocumento;
                        document.getElementById("vp-docId").textContent = userdatos.cedula;
                        document.getElementById("vp-correo").textContent = userdatos.correo;
                        document.getElementById("vp-celular").textContent = userdatos.celular;
                        document.getElementById("vp-lineafija").textContent = userdatos.linea_fija;
                        document.getElementById("vp-ubicacion").textContent = userdatos.Ubicacion;

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

        // actualizar vista previa en el modal
        document.getElementById('vp-nombre').textContent = nuevosDatos.nombre;
        document.getElementById('vp-cargo').textContent = nuevosDatos.cargo;
        document.getElementById('vp-tipoDoc').textContent = nuevosDatos.id_tipodocumento;
        document.getElementById('vp-docId').textContent = nuevosDatos.cedula;
        document.getElementById('vp-correo').textContent = nuevosDatos.correo;
        document.getElementById('vp-celular').textContent = nuevosDatos.celular;
        document.getElementById('vp-lineafija').textContent = nuevosDatos.linea_fija;
        document.getElementById('vp-ubicacion').textContent = nuevosDatos.Ubicacion;

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
document.getElementById("confirmarEliminar").addEventListener("click", () => {
        if (usuarioaeliminar !== null) {
                if (usuarios[usuarioaeliminar].estado === "Activo" || usuarios[usuarioaeliminar].estado === "activo") {
                        usuarios[usuarioaeliminar].estado = "Inactivo";
                } else if (usuarios[usuarioaeliminar].estado === "Inactivo" || usuarios[usuarioaeliminar].estado === "inactivo") {
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
        if (usuarioEditando === null) return;

    // Tomamos los nuevos valores de los inputs
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

    // Actualizamos los datos del usuario en el array original
        Object.assign(usuarioEditando, nuevosDatos);

    // Recargamos la tabla con los cambios
        cargarUsuarios(usuarios);

    // Cerramos el modal
        document.getElementById("modaleditar").style.display = "none";

    // Limpiamos la variable temporal
        usuarioEditando = null;
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

// ------------------------------------------------------
// MANEJO DE EDICIÓN Y CONFIRMACIÓN
// ------------------------------------------------------


// Manejo y control del inpout de busqueda para filtrar la tabla
const inputBuscar = document.getElementById("inputbuscar");
const btnBuscar = document.getElementById("btnbuscar");
// función que filtra
function filtrarUsuarios() {
        const texto = inputBuscar.value.toLowerCase().trim();
        const filas = document.querySelectorAll(".filas");

        filas.forEach(fila => {
                const nombre = fila.querySelector(".textnombre")?.textContent.toLowerCase() || "";
                const cedula = fila.querySelector(".textcedula")?.textContent.toLowerCase() || "";

                if (nombre.includes(texto) || cedula.includes(texto)) {
                        fila.style.display = "";
                } else {
                        fila.style.display = "none";
                }
        });
}
btnBuscar.addEventListener("click", filtrarUsuarios);
inputBuscar.addEventListener("keyup", filtrarUsuarios);


