/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: afrodita    Database: intranet_comfanorte
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `anuncio` (
  `id_anuncio` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_anuncio` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `ubicacion_imagen` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_anuncio`),
  KEY `id_tipo_anuncio` (`id_tipo_anuncio`),
  CONSTRAINT `anuncio_ibfk_1` FOREIGN KEY (`id_tipo_anuncio`) REFERENCES `tipo_anuncio` (`id_tipo_anuncio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES
(1,2,'Presentación oficial de los deportistas Comfanorte','Con gran orgullo y emoción, La Caja de Compensación Familiar de Norte de Santander -COMFANORTE presentó de manera oficial ante los medios de comunicación a los deportistas de natación, bicicross, patinaje, tenis y triatletas apoyados por la Corporación durante este año, espacio a través del cual aprovechó también para compartir con cada uno de los asistentes los diferentes logros, esfuerzos y experiencias obtenidos por estos grandes talentos de la región. \n            Durante el evento, los atletas también compartieron con los periodistas y medios de comunicación, sus experiencias personales, el camino que han recorrido para alcanzar sus metas y los desafíos que han enfrentado en cada disciplina.\n            De igual manera, nuestro administrativo, el Dr. Oscar Guillermo Gerardino Astier, aprovechó su intervención para felicitar a los deportistas por su gran esfuerzo y para destacar los proyectos que viene liderando la Caja de Compensación en pro del deporte de nuestra región. “En primer lugar, quiero expresar mi admiración y gratitud hacia cada uno de ustedes, por su dedicación y esfuerzo, pero especialmente representar y dejar en alto el nombre de Comfanorte y de nuestro departamento en cada una de sus competencias. Ustedes son ejemplos extraordinarios de determinación, disciplina y excelencia, han superado desafíos y han alcanzado metas increíbles en sus respectivas disciplinas. Son verdaderos embajadores del espíritu deportivo y nos llenan de orgullo al verlos competir en los escenarios más importantes del país y del mundo”\n            A lo largo del encuentro los diferentes deportistas agradecieron a Comfanorte por el apoyo y respaldo durante este año y se comprometieron a continuar dando lo mejor de sí en cada una de las competencias que restan del año.\n            Desde Comfanorte seguiremos trabajando para apoyar el deporte a través de nuestras escuelas de iniciación, fomentando en nuestros niños, niñas y jóvenes el amor y la dedicación por alguna de estas disciplinas.','noticia_001.jpg','2023-11-04 22:01:26','ACTIVO'),
(2,2,'El Colegio Comfanorte se destaca por su excelente desempeño y mantiene su categoría A+','Gracias al esfuerzo y el compromiso constante de todos los agentes educativos, nuestro Colegio Comfanorte ha logrado mantener una vez más su destacado desempeño en la categoría A+ muy superior, la máxima escala en los resultados de las pruebas ICFES Saber 11, cifras nos llenan de alegría y orgullo e impulsan a seguir trabajando por la formación de ciudadanos íntegros en la región.  \r\n\r\n“Año tras año nos planteamos estrategias que enmarcan el esfuerzo, el trabajo en equipo y la dedicación de todo el equipo humano que interviene para alcanzar estos resultados. Para nosotros se ha convertido en un desafío mantener la categoría A+ la cual le da un plus a nuestra Institución Educativa tanto a nivel municipal como departamental, por este motivo quiero agradecer a todos los docente y directivos por su gran sentido de pertenencia, pero especialmente por acompañar los procesos de preparación de nuestros estudiantes” así lo aseguró el Dr. Oscar Guillermo Gerardino Astier – Director Administrativo de Comfanorte\r\n\r\nPor su parte el rector del Colegio Comfanorte también destacó el apoyo y el respaldo de la Caja de Compensación Familiar a cada uno de los alumnos, la cual brinda grandes beneficios educativos tanto a los afiados como a la comunidad en general.\r\n\r\nEn el 2024 continuaremos trabajando de manera comprometida para brindarles a los nortesantandereanos una educación de calidad, basada en principios, valores y excelencia académica.','noticia_002.jpg','2023-12-12 20:00:00','ACTIVO'),
(3,1,'AUMENTO DE LA CUOTA MONETARIA','#Subsidio💰| Nos encanta sorprender a nuestros afiliados con excelentes noticias, \r\n\r\nHoy queremos contarles que aumentó la cuota monetaria a $44.835 \r\npara los beneficiarios de las categorías A y B. 💴💳\r\n\r\nAdemás, aprovechamos para invitarte a realizar el cambio de modalidad de pago de la Cuota Monetaria, si aún no has realizado este proceso, \r\nrecuerda que es rápido, fácil y seguro..','noticia_003.jpg','2023-11-01 23:01:19','ACTIVO');
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacion`
--

DROP TABLE IF EXISTS `aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicacion` (
  `id_aplicacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `id_tipo_aplicacion` bigint(20) NOT NULL,
  `forma_acceso` varchar(50) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `ubicacion_imagen` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_aplicacion`),
  KEY `id_tipo_aplicacion` (`id_tipo_aplicacion`),
  CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`id_tipo_aplicacion`) REFERENCES `tipo_aplicacion` (`id_tipo_aplicacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacion`
--

LOCK TABLES `aplicacion` WRITE;
/*!40000 ALTER TABLE `aplicacion` DISABLE KEYS */;
INSERT INTO `aplicacion` VALUES
(1,'SEVEN ERP','Software que permite la planeación de los recursos empresariales, mejorando los procesos, automatizando e integrando las operaciones de la compañía a través de una herramienta de gestión BPM.\r\n\r\nPermite integrar la información de las áreas de la compañía en un único repositorio de datos con: CRM, cotizaciones, pedidos / contratos, facturación, cartera, tesorería, proveedores, activos fijos, inventarios, manufactura, compras y presupuesto financiero.',2,'Navegador Web IExplore, Edge','http://s7-menaleo/seven/ModGener/gn_gener/SGnMenusP.htm','logo_seven.png','ACTIVO'),
(2,'KACTUS','Software Modular e Integral de Nómina y Gestión del Telento Humano (HCM) con énfasis en los procesos de remuneración, compensación, nómina electrónica, selección y contratación',2,'Navegador Web IExplore, Edge','http://s7-menaleo:8090/OpheliaMenu/login.html','logo_kactus.png','ACTIVO'),
(3,'SOFTWARE DE APLICACIÓN EN GENERO','Sistema Core de Comfanorte que controla todo el modelo de negocio incluyendo afiliados, beneficiarios, subsidios, creditos y demas servicios.',1,'Icono en el escritorio','','logo_genero.png','ACTIVO'),
(4,'Q10 ACADEMICO COLEGIO SEDE PATIOS','Software en la nube que apoya la gestión académica, administrativa y de educación virtual para las instituciones de educación.',3,'Navegador Web, se recomienda Google  Chrome','https://colegiocomfanorte.q10.com','logo_q10.png','ACTIVO'),
(5,'Q10 ACADEMICO COLEGIO SEDE CUCUTA','Software en la nube que apoya la gestión académica, administrativa y de educación virtual para las instituciones de educación.',3,'Navegador Web, se recomienda Google  Chrome','https://centrocomfanorte.q10.com','logo_q10.png','ACTIVO'),
(6,'Q10 ACADEMICO COLEGIO SEDE TIBU','Software en la nube que apoya la gestión académica, administrativa y de educación virtual para las instituciones de educación.',3,'Navegador Web, se recomienda Google  Chrome','https://colegiocomfanortetibu.q10.com','logo_q10.png','ACTIVO'),
(7,'Q10 ACADEMICO INSTITUTO','Software en la nube que apoya la gestión académica, administrativa y de educación virtual para las instituciones de educación.',3,'Navegador Web, se recomienda Google  Chrome','https://comfanorte.q10.com','logo_q10.png','ACTIVO'),
(8,'SISTEMA DE GESTION INTEGRAL KAWAK','Software simple, seguro e integral para sistemas de gestión de calidad como: ISO 9001 - ISO 14001 - ISO 45001 - ISO 27001.',3,'Navegador Web, se recomienda Google  Chrome','https://kawak.com.co/comfanorte','logo_kawak.png','ACTIVO'),
(9,'GOOGLE WORK SPACE','Servicio de Google que proporciona varios productos de Google con el nombre de dominio Comfanorte. Cuenta con varias aplicaciones web con funciones similares a las suites ofimáticas tradicionales, como Gmail, Meet, Drive, Docs, entre otros.',3,'Navegador Web, se recomienda Google  Chrome','https://workspace.google.com/','logo_google.png','ACTIVO'),
(10,'CONTROLDOC','Plataforma SaaS de Gestión Documental (DMS) con Firma Electrónica que permite automatizar y centralizar toda la documentación de la organización desde su fuente de origen. Permite crear, firmar y controlar los documentos a nivel de colaboradores, proveedores, contratistas y clientes.',3,'Navegador Web, se recomienda Google  Chrome','https://controldoc.comfanorte.com.co:8020/ControlDoc/Home/Login','logo_controldoc.png','ACTIVO'),
(11,'BI+POS','Sistema que facilita la gestión de las operaciones de venta de restaurantes y casetas de Comfanorte, procesa pagos, realiza seguimiento de inventario y proporciona información detallada sobre las transacciones.',1,'Icono en el escritorio','','logo_bipos.png','ACTIVO'),
(12,'CERTISUBSIDIO','Sistema para la gestión empresarial interna de Comfanorte, de afiliaciones electronicas y certificaciones.',3,'Navegador Web, se recomienda Google  Chrome','https://tramitesenlinea.comfanorte.com.co/certisubsidio/','logo_comfanorte.png','ACTIVO'),
(13,'DISCOVERY SERVICEDESK','Mesa de servicios con el proceso de Tecnología e Infraestructura para la atencion de requerimientos e incidentes. ',3,'Navegador Web, se recomienda Google  Chrome','https://servicios.comfanorte.com.co:8686/MesadeServicio/Index.aspx','logo_mesa.png','ACTIVO'),
(14,'PORTAL WEB COORPORATIVA','Sitio Web de Comfanorte, con toda la información para afiliados.',3,'Navegador Web, se recomienda Google  Chrome','https://comfanorte.com.co/index/','logo_comfanorte.png','ACTIVO'),
(15,'ACL ANALYTICS','Software de análisis y extracción de datos que se utiliza para la detección y prevención de fraudes y la gestión de riesgos. Muestra grandes conjuntos de datos para encontrar irregularidades o patrones en las transacciones que podrían indicar debilidades de control o fraude.',1,'Icono en el escritorio','','logo_acl.png','ACTIVO'),
(16,'FACT-E','Sistema de facturación electronica para la recepción y emisión de las facturas de la Caja dando cumplimiento a lo requerido por la DIAN.',3,'Navegador Web, se recomienda Google  Chrome','https://webportal.dispafel.com/fact_e/admon/login/index.xhtml','logo_facte.png','ACTIVO'),
(17,'OFICINA VIRTUAL EMPRESA','Sistema para las empresas afliados donde se pueden realizar afiliaciones y dar seguimiento a las mismas y generar certificados.',2,'Navegador Web, se recomienda Google  Chrome','https://tramitesenlinea.comfanorte.com.co/oficinavirtual/Empresa/','logo_comfanorte.png','ACTIVO'),
(18,'OFICINA VIRTUAL TRABAJADOR','Sistema para los trabajadores afliados donde se pueden realizar afiliaciones y dar seguimiento a las mismas y generar certificados.',2,'Navegador Web, se recomienda Google  Chrome','https://tramitesenlinea.comfanorte.com.co/oficinavirtual/Trabajador/','logo_comfanorte.png','ACTIVO'),
(19,'VERIFICA COMFA','Sistema para el registro a eventos de Comfanorte.',2,'Navegador Web, se recomienda Google  Chrome','https://tramitesenlinea.comfanorte.com.co/verificacomfa/','logo_comfanorte.png','ACTIVO'),
(20,'BITACORA JURIDICA','Sistema de gestión de procesos jurídicos de Comfanorte con alertas y semofarización para la atención oportuna.',2,'Navegador Web, se recomienda Google  Chrome','https://tramitesenlinea.comfanorte.com.co/bitacora_juridica/','logo_comfanorte.png','ACTIVO');
/*!40000 ALTER TABLE `aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivo` (
  `id_archivo` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_archivo` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `ubicacion_archivo` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `id_tipo_archivo` (`id_tipo_archivo`),
  CONSTRAINT `archivo_ibfk_1` FOREIGN KEY (`id_tipo_archivo`) REFERENCES `tipo_archivo` (`id_tipo_archivo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES
(1,1,'MANUAL DOCUMENTO SOPORTE SEVEN ERP FASE 2','Manual del funcionamiento de los módulos de emisión de documento soporte para proveedores no obligados a facturar por medio de la aplicación Seven ERP en su fase 2.','Manual_Documento_Soporte.pdf',NULL,'ACTIVO'),
(3,1,'MANUAL IMAGEN CORPORATIVA','Elementos básicos para la correcta utilización del logosimbolo y de sus principales aplicaciones. <br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=11548&m=62','ACTIVO'),
(5,1,'CREAR PLANTILLAS EN KAWAK PARA ACTAS','En el contenido de las actas puede usar plantillas creadas previamente para hacer tu gestión más ágil. Aquí te explicaremos como parametrizar las plantillas para que así tu gestión sea más ágil.',NULL,'https://knowledge.kawak.net/crea-plantillas-para-usar-en-tus-actas-de-reunion','ACTIVO'),
(6,1,'REALIZAR SEGUIMIENTO A LOS COMPROMISOS EN KAWAK','Cuando se realiza un acta de reunión se generan compromisos a los cuales los responsables les deben realizar seguimiento, hasta su ejecución. En este artículo te explicaremos como realizar el seguimiento.',NULL,'https://knowledge.kawak.net/realiza-seguimiento-a-los-compromisos-de-reunion','ACTIVO'),
(7,1,'MAPA DE PROCESOS EN KAWAK','Consulta los documentos, acciones de mejora, auditorías, actas, riesgos, salidas no conformes, PQRS e indicadores. La información está filtrada por los procesos y sub-procesos (si se tienen) que hacen parte de la organización.',NULL,'https://knowledge.kawak.net/es/consulta-el-mapa-de-procesos-de-la-empresa','ACTIVO'),
(8,1,'MANUAL DE GESTIÓN DE CONTROLDOC','Este documento está diseñado para ser una guía fácil y de rápida para la compresión de\nlos usuarios de ControlDoc.\nControlDoc® cuenta con diferentes módulos funcionales como lo son: Creación de\nDocumentos, Administración Sistema, Parametrización, ControlDoc TRD, BPM,\nComunicaciones, Gestión Tramites, Notificaciones, Administración Procesos, Archivo\nLegales, e Informes, los cuales permiten realizar de manera eficiente el seguimiento y\ncontrol de los procesos de Gestión Documental y Archivo ','manual_controldoc.pdf',NULL,'ACTIVO'),
(9,4,'POLÍTICAS CORPORATIVAS','Directrices u orientaciones que debe seguir la corporación y sus trabajadores, en sus diferentes actividades y procesos. Todos los trabajadores deben conocerlo, comprenderlo y aplicarlo, ya que es de obligatorio cumplimiento.\n\n<br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=13331&m=22','ACTIVO'),
(10,4,'VISIÓN','Declaración concisa que describe la dirección a largo plazo y los objetivos aspiracionales que Comfanorte busca lograr. <br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=10533&m=52','ACTIVO'),
(11,4,'MISIÓN','Declaración breve que explica el propósito fundamental de Comfanorte, delineando sus objetivos principales, valores fundamentales y el servicio o valor que ofrece a sus afiliados y a la sociedad en general.<br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=10546&m=41','ACTIVO'),
(12,4,'OBJETIVOS ESTRATÉGICOS','Metas específicas y medibles que Comfanorte busca alcanzar para avanzar hacia la realización de su visión a largo plazo.<br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=10028&m=7','ACTIVO'),
(13,4,'ESTRUCTURA ORGANIZACIONAL','Cómo se organiza y distribuye internamente Comfanorte, estableciendo la jerarquía, la autoridad, las responsabilidades y las relaciones entre los diversos procesos, unidades o funciones. <br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=12549&m=64','ACTIVO'),
(14,4,'OBJETIVOS AMBIENTALES','Metas específicas establecidas por Comfanorte para minimizar el impacto negativo de las operaciones de la organización en el medio ambiente y contribuir positivamente a la sostenibilidad.<br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/doc_visualizar.php?v=12125&m=96','ACTIVO'),
(15,1,'MANUAL MESA DE SERVICIO','Manual de usuario de la aplicación Mesa de Servicio IT Help Center.','manual_mesa.pdf',NULL,'ACTIVO'),
(16,3,'SOLICITUD DE PERMISO','Formato utilizado para la solicitud de permisos, debe diligenciarse y enviarse al jefe para su aprobación tres dias hábiles antes de la fecha solicitada.\n<br><br><strong>Documento ubicado en KAWAK.</strong>\n',NULL,'https://kawak.com.co/comfanorte/gst_documental/for_visualizar.php?v=10778&m=0.7704613919035639','ACTIVO'),
(17,3,'CONTROL DE ASISTENCIA','Formato para el registro de asistencia a reuniones o eventos presenciales por parte de los trabajadores.<br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/for_visualizar.php?v=11895&m=0.5984012837687873','ACTIVO'),
(18,3,'FORMATO PARA EXCUSAS COLEGIO COMFANORTE','Formato utilizado para la presentación de excusas por parte de los estudiantes del Colegio Comfanorte.\r\n\r\n<br><br><strong>Documento ubicado en KAWAK.</strong>',NULL,'https://kawak.com.co/comfanorte/gst_documental/for_visualizar.php?v=12767&m=0.14018791378004103','ACTIVO');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_proceso` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `id_tipo_documento` bigint(20) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `linea_fija` varchar(20) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `ubicacion_foto` varchar(20) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_proceso` (`id_proceso`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_proceso`) REFERENCES `proceso` (`id_proceso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES
(1,1,'LUIS DANIEL GAMARRA FERNANDEZ','ASISTENTE I',3,'328379','danielgamarra15@hotmail.com','3205971992',NULL,NULL,NULL,'ACTIVO'),
(2,16,'JONATHAN RICARDO RIVAS CROES','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',3,'565305','yol122000@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(3,3,'ALEX VLADIMIR REYES HERNANDEZ','RESPONSABLE DE PROCESO',2,'3808845','alexreyes_1030@icloud.com','3203335256',NULL,NULL,NULL,'ACTIVO'),
(4,11,'ALBERTO MARIO PEREZ RODRIGUEZ','ASISTENTE I',2,'3837204','almayts32@hotmail.com','3232339578',NULL,NULL,NULL,'ACTIVO'),
(5,16,'LUIS EDUARDO GONZALEZ VARGAS','AUXILIAR II',2,'5415407','luedugonvar@gmail.com','3124384666',NULL,NULL,NULL,'ACTIVO'),
(6,17,'JORGE ENRIQUE BLANCO','AUXILIAR ADMINISTRATIVO',2,'5450282','jorge.blanco@comfanorte.com.co','3115683868',NULL,NULL,NULL,'ACTIVO'),
(7,17,'JOSE HUMBERTO PEÑALOZA CORREA','AUXILIAR II',2,'5457061','humbertocorrea1912@gmail.com','3204054729',NULL,NULL,NULL,'ACTIVO'),
(8,16,'ALBERT GUTIERREZ LEAL','AUXILIAR II',2,'5479065','royaldeyta@hotmail.com','3133874826',NULL,NULL,NULL,'ACTIVO'),
(9,2,'RAFAEL MEDINA ANGUITA','AUXILIAR ADMINISTRATIVO',2,'5483139','rafael.medina8317@hotmail.com','3227354541',NULL,NULL,NULL,'ACTIVO'),
(10,16,'MARTIN CAMACHO BERNAL','AUXILIAR II',2,'5483731','martincamachobernal@gmail.com','3127972050',NULL,NULL,NULL,'ACTIVO'),
(11,3,'LUIS FRANCISCO RODRIGUEZ','AUXILIAR 3RO',2,'5773505','luisr.ciclismo@gmail.com','3133732110',NULL,NULL,NULL,'ACTIVO'),
(12,1,'OMAR CAMPOS','DOCENTE SIN ESCALAFON',2,'6663088','omarcampos1985.oc@gmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(13,4,'MANUEL FERNANDO PALENCIA CONTRERAS','AUXILIAR III',2,'6663489','manuel.palencia85@gmail.com','3195230953',NULL,NULL,NULL,'ACTIVO'),
(14,16,'ENRIQUE JOSE MORALES MOJICA','ASISTENTE I',2,'7571468','kimora0608@hotmail.com','3204488268',NULL,NULL,NULL,'ACTIVO'),
(15,1,'ADALBERTO DEL CASTILLO ESTRADA','COORDINADOR ADMINISTRATIVO COLEGIO',2,'9134925','adadelcas1957@hotmail.com','3015476056',NULL,NULL,NULL,'ACTIVO'),
(16,2,'ARLEY MINA CARVAJAL','AUXILIAR III',2,'10556834','calo.14@hotmail.com','3124253590',NULL,NULL,NULL,'ACTIVO'),
(17,1,'LUIS JESUS ESPINEL NAVAS','AUXILIAR III',2,'13197433','espine.lluis@hotmail.com','3212030586',NULL,NULL,NULL,'ACTIVO'),
(18,4,'JUAN DE DIOS GARAY LEON','AUXILIAR I',2,'13197448','jugale_23@hotmail.com','3138700038',NULL,NULL,NULL,'ACTIVO'),
(19,1,'LUIS FELIPE RODRIGUEZ NIÑO','DOCENTES CICLOS COLEGIO',2,'13269588','luferoni_88@hotmail.com','3106492355',NULL,NULL,NULL,'ACTIVO'),
(20,3,'EDWIN EFRAIN PARDO JAIMES','AUXILIAR I',2,'13276424','edwin1052011@gmail.com','3115728487',NULL,NULL,NULL,'ACTIVO'),
(21,14,'JORGE EDUARDO SLAIMAN GAMBOA','AUXILIAR I',2,'13277577','jorgeslaiman@hotmail.com','',NULL,NULL,NULL,'ACTIVO'),
(22,13,'JULIO ERNESTO PEÑALOSA BERNAL','AUXILIAR III',2,'13278641','julioernestope442@gmail.com','3223793763',NULL,NULL,NULL,'ACTIVO'),
(23,1,'EVERALDO MARTINEZ LOPEZ','AUXILIAR III',2,'13391185','everyayu@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(24,11,'JORGE ENRIQUE URON','JEFE',2,'13438232','uronjenrique@hotmail.com','3168784658',NULL,NULL,NULL,'ACTIVO'),
(25,17,'EMILIANO VARGAS CANAS','SUBJEFE',2,'13438942','emilianovargas1232021@hotmail.com','3138700016',NULL,NULL,NULL,'ACTIVO'),
(26,17,'PEDRO ELIAS BECERRA SANABRIA','AUXILIAR 1RO',2,'13440840','soloxhoy20@hotmail.com','3014804780',NULL,NULL,NULL,'ACTIVO'),
(27,9,'JUAN JOSE SAYAGO RANGEL','PROFESIONAL I',2,'13444621','sayagorangel23@hotmail.com','3202798335',NULL,NULL,NULL,'ACTIVO'),
(28,21,'EDGAR JESUS RIVERA PARADA ','JEFE',2,'13447593','edgarjesusrivera@gmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(29,2,'CARLOS AUGUSTO GAONA BARRAGAN','AUXILIAR III',2,'13450735','cgaonab@gmail.com','3175457189',NULL,NULL,NULL,'ACTIVO'),
(30,16,'JAIRO ALBERTO SILVA MANTILLA','AUXILIAR 1RO',2,'13462727','jairo.silva@comfanorte.com.co','3158158018',NULL,NULL,NULL,'ACTIVO'),
(31,3,'LISANDRO MORA PAREDES','AUXILIAR III',2,'13463731','lisandrito0812@gmail.com','3058758774',NULL,NULL,NULL,'ACTIVO'),
(32,2,'CERVELEON RODRIGUEZ VEGA','ASISTENTE II',2,'13469198','cerver_r@hotmail.com','3138700027',NULL,NULL,NULL,'ACTIVO'),
(33,11,'JESUS ORLANDO CHAUSTRE LARA','ASISTENTE II',2,'13469542','chaustrelara@hotmail.com','3174051084',NULL,NULL,NULL,'ACTIVO'),
(34,15,'EDGAR ORLANDO DIAZ CACERES','JEFE',2,'13470095','edgar.diaz.c@hotmail.com','3156215929',NULL,NULL,NULL,'ACTIVO'),
(35,4,'GERMAN HERNAN PARRA GARCIA','AUXILIAR 1RO',2,'13470318','german.parra@comfanorte.com.co','3138700036',NULL,NULL,NULL,'ACTIVO'),
(36,14,'ALVARO ALBERTO RIVERA RINCON','JEFE',2,'13470697','alvaro_rivera23@hotmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(37,14,'EDUARDO ARIZA TORRES','AUXILIAR ADMINISTRATIVO',2,'13471700','eduardoa_1963@hotmail.com','3138700024',NULL,NULL,NULL,'ACTIVO'),
(38,17,'FELIX MARIA UREÑA FIGUEREDO','AUXILIAR ADMINISTRATIVO',2,'13476528','felurfi2011@hotmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(39,1,'JORGE ELIECER GAITAN AMAYA','AUXILIAR ADMINISTRATIVO',2,'13477198','jorge2016gaitan@outlook.com','3162747977',NULL,NULL,NULL,'ACTIVO'),
(40,12,'JORGE ENRIQUE YATE','JEFE',2,'13480956','jorgeyate@hotmail.com','3162747977',NULL,NULL,NULL,'ACTIVO'),
(41,16,'ALVARO IVAN RANGEL CORONADO','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'13487246','rangelcoronadoalvaro1967@gmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(42,1,'JORGE ENRIQUE GALVIS CARRILLO','RECTOR',2,'13487665','jegc10@hotmail.com','3182462317',NULL,NULL,NULL,'ACTIVO'),
(43,1,'HENRY CARRILLO BURGOS','DOCENTE ESCALAFON 7',2,'13495161','hencabur@hotmail.com','3112297911',NULL,NULL,NULL,'ACTIVO'),
(44,1,'ADELSO GOMEZ LATORRE','AUXILIAR II',2,'13496308','adelso3264@hotmail.com','3103302694',NULL,NULL,NULL,'ACTIVO'),
(45,11,'JORGE ENRIQUE GARCIA','ASISTENTE I',2,'13496355','tropadanza@hotmail.com','',NULL,NULL,NULL,'ACTIVO'),
(46,3,'NATALIO MORALES MORENO','AUXILIAR II',2,'13499517','nataliomoreno4@gmail.com','3014273370',NULL,NULL,NULL,'ACTIVO'),
(47,3,'WILLIAM ALONSO CONTRERAS SANDOVAL','AUXILIAR I',2,'13499670','williamcontreras7a05@gmail.com','3102873021',NULL,NULL,NULL,'ACTIVO'),
(48,20,'JORGE TORRADO FLOREZ','AUXILIAR III',2,'13500675','jtorradoflorez@gmail.com','3042461643',NULL,NULL,NULL,'ACTIVO'),
(49,11,'ALDRIN EDUARDO SANCHEZ FERNANDEZ','ASISTENTE II',2,'13507340','aldrin_sanchez@hotmail.com','3112720527',NULL,NULL,NULL,'ACTIVO'),
(50,4,'EDUARDO PEÑARANDA CONTRERAS','AUXILIAR III',2,'13509601','yayosebas1970@hotmail.com','3176493078',NULL,NULL,NULL,'ACTIVO'),
(51,14,'HUGO AZUERO ISAZA','ASISTENTE II',2,'13746717','hazueroizaza@gmail.com','3229147841',NULL,NULL,NULL,'ACTIVO'),
(52,3,'CARLOS RICARDO CESPEDES MORENO','AUXILIAR III',2,'17328922','carlosricardocespedesmoreno@gmail.com','3132431812',NULL,NULL,NULL,'ACTIVO'),
(53,1,'MARIA ERCILIA ACHURY CHAVEZ','DOCENTE ESCALAFON 7',2,'20685982','marerciliachury@hotmail.com','3178936301',NULL,NULL,NULL,'ACTIVO'),
(54,9,'ALEYDA MILENA PERILLA COLMENARES','AUXILIAR III',2,'24231583','perillitac1978@gmail.com','3107530790',NULL,NULL,NULL,'ACTIVO'),
(55,1,'DORIS MUÑOZ MUÑOZ','DOCENTE ESCALAFON 7',2,'26620085','dorismunozx2@gmail.com','3118985839',NULL,NULL,NULL,'ACTIVO'),
(56,3,'FANNY MARIÑO SOLEDAD','AUXILIAR 1RO',2,'27602083','fanny.marino@hotmail.com','3004956198',NULL,NULL,NULL,'ACTIVO'),
(57,14,'SUNEIDY GIOJANA CUELLAR MONTOYA','ASISTENTE I',2,'27602372','suny319@hotmail.com','3123907555',NULL,NULL,NULL,'ACTIVO'),
(58,4,'MARIA INES MONTENEGRO LOBATO','PROFESIONAL I',2,'27602703','miml_80@hotmail.com','3218283511',NULL,NULL,NULL,'ACTIVO'),
(59,16,'YADIRA MILENA ORTEGA PINTO','AUXILIAR III',2,'27603356','milenapinto2529@gmail.com','3217404253',NULL,NULL,NULL,'ACTIVO'),
(60,12,'CLAUDIA LILIANA FUENTES GOMEZ','PROFESIONAL II',2,'27603490','claudialilianaf@gmail.com','3176707007',NULL,NULL,NULL,'ACTIVO'),
(61,2,'KARLA LUCIA LINDARTE DIAZ','RESPONSABLE DE PROCESO',2,'27605355','karlalindarte@gmail.com','3204516410',NULL,NULL,NULL,'ACTIVO'),
(62,16,'JECIE SOBEYDA DAZA BENITEZ','AUXILIAR III',2,'27633713','sobeidadaza4@hotmail.com','3143795861',NULL,NULL,NULL,'ACTIVO'),
(63,16,'CARMEN ROSA GOYENECHE VEGA','AUXILIAR III',2,'27794113','carmerogove@gmail.com','3144579691',NULL,NULL,NULL,'ACTIVO'),
(64,16,'LUZ MARLENI CONTRERAS CAICEDO','AUXILIAR III',2,'27794130','luzmar25co@gmail.com','3112650285',NULL,NULL,NULL,'ACTIVO'),
(65,16,'MARIA ROSALBA ROZO ZAPATA','AUXILIAR III',2,'27794235','mariarosalbarozozapata@gmail.com','3133262715',NULL,NULL,NULL,'ACTIVO'),
(66,1,'RUTH YOHANNA CONTRERAS RIOS','DOCENTE ESCALAFON 7',2,'27801762','yohanacr_28@hotmail.com','3143018470',NULL,NULL,NULL,'ACTIVO'),
(67,16,'AMPARO ROJAS JIMENEZ','ASISTENTE I',2,'27804863','amparorojasjimenez@hotmail.com','3144754269',NULL,NULL,NULL,'ACTIVO'),
(68,16,'BELSY YOHANA DIAZ CASADIEGOS','AUXILIAR III MEDIO TIEMPO',2,'27806880','ddiazcasadiego@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(69,17,'BRIGITH LIZNAY RODRIGUEZ CARREÑO','AUXILIAR II',2,'27819121','briliroca@hotmail.com','3115027609',NULL,NULL,NULL,'ACTIVO'),
(70,1,'ALBA CONSUELO SUAREZ CORZO','DOCENTE ESCALAFON 7',2,'28124773','albaconsuelo73@hotmail.com','3118714887',NULL,NULL,NULL,'ACTIVO'),
(71,17,'MARIA JOSEFA MEDINA ALVAREZ','ASISTENTE II',2,'30050034','clemajo@hotmail.com','3045897908',NULL,NULL,NULL,'ACTIVO'),
(72,2,'AUDREY CACERES DIAZ','AUXILIAR III',2,'30050349','aucadi.300914@gmail.com','3125440546',NULL,NULL,NULL,'ACTIVO'),
(73,1,'LENIS YUSLEY LIZCANO SEPULVEDA','DOCENTE ESCALAFON 7',2,'30050552','lenisyusley@gmail.com','3123929493',NULL,NULL,NULL,'ACTIVO'),
(74,21,'MARTHA MARITZA VELASCO MARQUEZ','AUXILIAR III',2,'30050692','maritza--80@hotmail.com','3142384948',NULL,NULL,NULL,'ACTIVO'),
(75,17,'YICELA PAULINA VARGAS MONTIEL','AUXILIAR III',2,'30507957','yicelavargas21@hotmail.com','3229041669',NULL,NULL,NULL,'ACTIVO'),
(76,18,'MARGHIT GISELA GONZALEZ FORERO','ASISTENTE II',2,'37180290','marghitgonzalez@hotmail.com','3229041669',NULL,NULL,NULL,'ACTIVO'),
(77,11,'GLORIA MARIA BUENO FONSECA','AUXILIAR III',2,'37238432','gloriamariabuenofonseca29@gmail.com','3124762646',NULL,NULL,NULL,'ACTIVO'),
(78,9,'FLOR ALBA JAIMES VERA','SUBJEFE',2,'37253686','flor.jaimes@comfanorte.com.co','3167571228',NULL,NULL,NULL,'ACTIVO'),
(79,17,'LUISA VERA GARCIA','SUBJEFE',2,'37259981','luisa.vera@comfanorte.com.co','3013704635',NULL,NULL,NULL,'ACTIVO'),
(80,1,'MARIA ALEJANDRA VILLAMIZAR  CARVAJAL','COORDINADOR ADMINISTRATIVO COLEGIO',2,'37270215','mahe1980-02@hotmail.com','3143051673',NULL,NULL,NULL,'ACTIVO'),
(81,1,'YAMILE MARIN IBARRA','DOCENTE SIN ESCALAFON',2,'37272877','ymarin.yami.marin@gmail.com','3045715440',NULL,NULL,NULL,'ACTIVO'),
(82,16,'NEREIDA MARIA MOTTA DUARTE','ASISTENTE I',2,'37276337','nereidamottta@gmail.com','3232386647',NULL,NULL,NULL,'ACTIVO'),
(83,11,'ANDREA CONSTANZA ARIAS ORDUZ','AUXILIAR 3RO',2,'37276551','andrea.arias@comfanorte.edu.co','3102782793',NULL,NULL,NULL,'ACTIVO'),
(84,16,'LISETH KATERINE SASTOQUE SAENZ','AUXILIAR III',2,'37277304','lisethkaterinesastoque@gmail.com','3223527825',NULL,NULL,NULL,'ACTIVO'),
(85,16,'DOUNYA ZAMIRA DAW CARDENAS','RESPONSABLE DE PROCESO',2,'37277998','zamydaw17@gmail.com','3173692869',NULL,NULL,NULL,'ACTIVO'),
(86,12,'LILIANA CAROLINA ROSAS DUARTE','ASISTENTE I',2,'37278513','lilianacrosasd@hotmail.com','3164936124',NULL,NULL,NULL,'ACTIVO'),
(87,1,'DULFA MILENA MENDEZ ALARCON','DOCENTE SIN ESCALAFON',2,'37279251','midani128@hotmail.com','3114607692',NULL,NULL,NULL,'ACTIVO'),
(88,5,'INGRI ALEJANDRA CORZO RIVERA','AUXILIAR I',2,'37279415','luismiriam77@outlook.es','3163080594',NULL,NULL,NULL,'ACTIVO'),
(89,15,'JOHANNA MILENA ALFONSO CONTRERAS','PROFESIONAL I',2,'37290618','johanacon82@hotmail.com','3143132293',NULL,NULL,NULL,'ACTIVO'),
(90,1,'ANDREA DEL PILAR NIETO PABON','DOCENTE ESCALAFON 7',2,'37290953','andreina.nieto34@gmail.com','3218481340',NULL,NULL,NULL,'ACTIVO'),
(91,6,'MARIA DAYANA GONZALEZ RODRIGUEZ','PROFESIONAL II',2,'37291010','dayanagr@gmail.com','3016959352',NULL,NULL,NULL,'ACTIVO'),
(92,9,'MARIA DE LOS ANGELES CONTRERAS CONTRERAS','APRENDICES SENA 75%',2,'37291432','contrerasmaria7689@gmail.com','3223791362',NULL,NULL,NULL,'ACTIVO'),
(93,16,'YULIA ANDREA BAUTISTA AMAYA','ASISTENTE I',2,'37291651','yuliabautista@gmail.com','3213018222',NULL,NULL,NULL,'ACTIVO'),
(94,3,'DEILLY YURLEY PITA ROJAS','ASISTENTE II',2,'37292578','deilly0808@gmail.com','3112186567',NULL,NULL,NULL,'ACTIVO'),
(95,1,'SANDRA MILENA RAMIREZ GONZALEZ','DOCENTE ESCALAFON 7',2,'37292822','ramirezsandrita@gmail.com','3174890542',NULL,NULL,NULL,'ACTIVO'),
(96,11,'ZARELY JOHANA TORRES GUERRERO','AUXILIAR II',2,'37294637','jazarmvz@hotmail.com','3168309597',NULL,NULL,NULL,'ACTIVO'),
(97,18,'MERCEDES PATRICIA PEÑARANDA CARRASCAL','AUXILIAR 3RO',2,'37317239','patriciapcarrascal@hotmail.com','3214147378',NULL,NULL,NULL,'ACTIVO'),
(98,13,'ELIANA PEÑA VERJEL','PROFESIONAL I',2,'37325780','elipeve74@gmail.com','3102936927',NULL,NULL,NULL,'ACTIVO'),
(99,11,'LUZ ERMINDA PEREZ ORTEGA','AUXILIAR PROCESOS ASISTENCIALES.',2,'37343447','luerpe24@hotmail.com','3228802519',NULL,NULL,NULL,'ACTIVO'),
(100,16,'ORFA AMPARO RIVERA PEREZ','AUXILIAR I',2,'37391132','fabiana201017@outlook.com','3228802519',NULL,NULL,NULL,'ACTIVO'),
(101,1,'BEATRIZ MARCELA CONTRERAS ZAMBRANO','DOCENTE ESCALAFON 7',2,'37391697','mar.contreras2am84@gmail.com','3185276998',NULL,NULL,NULL,'ACTIVO'),
(102,4,'YESSICA PAOLA NAVARRO HERNANDEZ','AUXILIAR III',2,'37393066','yessiherna_23@hotmail.com','3186666777',NULL,NULL,NULL,'ACTIVO'),
(103,11,'AURA MARIA BAUTISTA MARTINEZ','ASISTENTE I',2,'37394874','auramaria_1981@hotmail.com','3168328887',NULL,NULL,NULL,'ACTIVO'),
(104,4,'ERIKA VANESSA OLIVEROS SUAREZ','AUXILIAR III',2,'37394946','erika01020304@gmail.com','3124823776',NULL,NULL,NULL,'ACTIVO'),
(105,1,'LEIDY AMPARO SUAREZ RODRIGUEZ','DOCENTE ESCALAFON 7',2,'37396917','leidysr840607@gmail.com','3143219916',NULL,NULL,NULL,'ACTIVO'),
(106,1,'MARTHA YANETH BENITEZ VARGAS','DOCENTE ESCALAFON 7',2,'37397138','martikabenitez@hotmail.com','3128532410',NULL,NULL,NULL,'ACTIVO'),
(107,1,'ERIKA JOHANNA GONZALEZ CASTILLA','DOCENTE SIN ESCALAFON',2,'37398405','egonzalez12341@hotmail.com','3102278386',NULL,NULL,NULL,'ACTIVO'),
(108,20,'LUZ ENITH SOTO BERMON','AUXILIAR I',2,'37399261','luzenith.soto@hotmail.com','3123700896',NULL,NULL,NULL,'ACTIVO'),
(109,16,'ANGELICA TATIANA MEDRANO DELGADO','AUXILIAR III',2,'37399674','angelica14medrano@gmail.com','3134525865',NULL,NULL,NULL,'ACTIVO'),
(110,2,'MILENE ALCIRA MORENO DURAN','PROFESIONAL II',2,'37440230','milenduran1@hotmail.com','3143414107',NULL,NULL,NULL,'ACTIVO'),
(111,1,'ANGELA YANETH BAUTISTA CRUZ','DOCENTE SIN ESCALAFON',2,'37440766','aybcruz@hotmail.com','3115196804',NULL,NULL,NULL,'ACTIVO'),
(112,16,'SANDRA JOHANNA CONTRERAS DIAZ','PROFESIONAL I',2,'37441418','sandra.contreras.diaz23@gmail.com','3224643815',NULL,NULL,NULL,'ACTIVO'),
(113,2,'DIANA CAROLINA QUINTANA GUERRERO','AUXILIAR II',2,'37442923','alesamidanna1513@gmail.com','3144686404',NULL,NULL,NULL,'ACTIVO'),
(114,17,'MILENA PATRICIA PRADA ROJAS','AUXILIAR I',2,'37443517','mp5820@gmail.com','3125519459',NULL,NULL,NULL,'ACTIVO'),
(115,1,'BEATRIZ ANGELICA NUÑEZ RIVERO','DOCENTE ESCALAFON 7',2,'37444173','banr_83@hotmail.com','3202300893',NULL,NULL,NULL,'ACTIVO'),
(116,5,'ANDREA ISABEL JAIMES OCHOA','ASISTENTE I',2,'37444788','andreitajaiime820822@gmail.com','3103452279',NULL,NULL,NULL,'ACTIVO'),
(117,16,'CARMEN ZULAY MARTINEZ JAIMES','AUXILIAR III',2,'37505441','carmenzulay01@gmail.com','3125413637',NULL,NULL,NULL,'ACTIVO'),
(118,17,'MARTHA SOFIA CAÑAS HERNANDEZ','PROFESIONAL I',2,'37511723','sofia723ster@gmail.com','3204583952',NULL,NULL,NULL,'ACTIVO'),
(119,1,'MARGARITA CASTRO PEREZ','DOCENTE ESCALAFON 7',2,'37706256','crismar.9946@gmail.com','3156167581',NULL,NULL,NULL,'ACTIVO'),
(120,1,'MADELEINES MARTINEZ DIAZ','DOCENTE SIN ESCALAFON',2,'39282026','made1516@gmail.com','3208124689',NULL,NULL,NULL,'ACTIVO'),
(121,1,'MARTHA EUGENIA LOPEZ MUÑOZ','DOCENTE NORMALISTA O TECNOLOGO EDUCACION',2,'41908937','marthalopez9@hotmail.com','3102325374',NULL,NULL,NULL,'ACTIVO'),
(122,8,'SILVIA LILIANA MUÑOZ VALDIVIESO','SUBDIRECTOR ',2,'43638073','silviali78@hotmail.com','3112962309',NULL,NULL,NULL,'ACTIVO'),
(123,18,'MARTA LUZ ORTIZ YEPEZ','PROFESIONAL I',2,'50869374','alanluz@hotmail.com','3112273425',NULL,NULL,NULL,'ACTIVO'),
(124,17,'LUISA FERNANDA ROJAS PEÑA','AUXILIAR III',2,'52313328','luisafrojaspe@gmail.com','3219176932',NULL,NULL,NULL,'ACTIVO'),
(125,14,'LUZ AMPARO ROJAS VELEZ','AUXILIAR I',2,'52995862','lamparo.velez@gmail.com','3212534030',NULL,NULL,NULL,'ACTIVO'),
(126,1,'MARTHA LUCIA SUAREZ SANTOS','DOCENTE ESCALAFON 7',2,'60251499','marta_suarez21@hotmail.com','3166781944',NULL,NULL,NULL,'ACTIVO'),
(127,19,'RUTH LUCIA SIERRA CONTRERAS','AUXILIAR II',2,'60256626','ruthluciasierra@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(128,19,'LILIANA AMPARO QUINTERO MENDOZA','ASISTENTE II',2,'60258452','liliaquime@hotmail.com','3192045446',NULL,NULL,NULL,'ACTIVO'),
(129,17,'BLANCA ISBELIA VERA VILLAMIZAR','AUXILIAR III',2,'60264741','verablanka@hotmail.com','3204844532',NULL,NULL,NULL,'ACTIVO'),
(130,9,'ALMALUZ BECERRA ALVARADO','AUXILIAR I',2,'60266855','almaluzbecerra_25@hotmail.com','3118443589',NULL,NULL,NULL,'ACTIVO'),
(131,1,'YOHANA ANDREINA GONZALEZ BALAGUERA','DOCENTE ESCALAFON 7',2,'60268088','johanaandreina@gmail.com','3115273749',NULL,NULL,NULL,'ACTIVO'),
(132,16,'ANA CLEMENCIA HERRERA PAIPA','SUBJEFE',2,'60275929','clemen_1360@hotmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(133,15,'NANCY ELENA APONTE MONSALVE','ASISTENTE I',2,'60282393','nancyeapontem@gmail.com','3228919108',NULL,NULL,NULL,'ACTIVO'),
(134,1,'SANDRA JEANNETTE HERNANDEZ JIMENEZ','DOCENTE NORMALISTA O TECNOLOGO EDUCACION',2,'60289748','sanpao1024@gmail.com','3223720508',NULL,NULL,NULL,'ACTIVO'),
(135,6,'GREICELINA ARGUELLO REYES','JEFE',2,'60294059','greicelina.arguello@comfanorte.com.co','3228919108',NULL,NULL,NULL,'ACTIVO'),
(136,6,'LUZ ESTELA LOPEZ ESPINEL','PROFESIONAL II',2,'60299104','luzlopez1202@hotmail.com','3138700025',NULL,NULL,NULL,'ACTIVO'),
(137,10,'MARTHA CECILIA MONTERO PORTILLA','APRENDICES SENA 50%',2,'60303913','monteropsicologa@gmail.com','3124498047',NULL,NULL,NULL,'ACTIVO'),
(138,1,'BERTA PATRICIA VILLAMIZAR GARCIA','DOCENTE ESCALAFON 7',2,'60306001','pavi0617@hotmail.com','3023795314',NULL,NULL,NULL,'ACTIVO'),
(139,5,'GLORIA SOCORRO LEON CAÑAS','PROFESIONAL I',2,'60307783','gloriasocorro@hotmail.com','3164905499',NULL,NULL,NULL,'ACTIVO'),
(140,1,'FANNY DOLORES MANTILLA SUAREZ','SUBJEFE',2,'60316761','fmantillasuarez@gmail.com','3156236345',NULL,NULL,NULL,'ACTIVO'),
(141,16,'RUTH MARITZA ESPARZA MARIÑO','AUXILIAR III',2,'60317384','ruth051166@gmail.com','3172495881',NULL,NULL,NULL,'ACTIVO'),
(142,13,'ALEYDA CECILIA PEREZ COLMENARES','AUXILIAR III',2,'60324267','alepc_1220@hotmail.com','3046423333',NULL,NULL,NULL,'ACTIVO'),
(143,4,'GLORIA STELLA GOMEZ CHACON','ASISTENTE I',2,'60327657','gloanyul@hotmail.com','3138700028',NULL,NULL,NULL,'ACTIVO'),
(144,1,'ISABEL ARENAS VERA','DOCENTE ESCALAFON 7',2,'60328559','isabel.arenas@comfanorte.edu.co','3115854918',NULL,NULL,NULL,'ACTIVO'),
(145,1,'ANA PAOLA RAMIREZ DIAZ','PROFESIONAL I',2,'60332301','paopaoramirez1@hotmail.com','3153971306',NULL,NULL,NULL,'ACTIVO'),
(146,16,'ELIZABETH VILLAMIZAR PALLARES','PROFESIONAL I',2,'60334349','eliza31081969@hotmail.com','3138891183',NULL,NULL,NULL,'ACTIVO'),
(147,1,'LUZ MARINA GUTIERREZ MONTES','DOCENTE NORMALISTA O TECNOLOGO EDUCACION',2,'60334487','luzmarinaguti@hotmail.com','3163290814',NULL,NULL,NULL,'ACTIVO'),
(148,2,'ANA TULIA TORRES CHACON','PROFESIONAL I',2,'60337852','anatorrescha@hotmail.com','3002022316',NULL,NULL,NULL,'ACTIVO'),
(149,1,'CLAUDIA PATRICIA SERRANO PRATO','DOCENTE NORMALISTA O TECNOLOGO EDUCACION',2,'60338496','serranoclaudia57@gmail.com','3108494757',NULL,NULL,NULL,'ACTIVO'),
(150,3,'CARMEN EMILIA SALAZAR ARANGO','ASISTENTE I',2,'60339108','emily2862@hotmail.com','3108494757',NULL,NULL,NULL,'ACTIVO'),
(151,15,'KATHERINNE DEL PILAR SERRANO RAGUA','AUXILIAR ADMINISTRATIVO',2,'60339757','katherinne.sr@hotmail.es','3105346379',NULL,NULL,NULL,'ACTIVO'),
(152,4,'ELIANA MARIA BENCARDINO RODRIGUEZ','ASISTENTE II',2,'60340620','eliana.bencardino.comfanorte@gmail.com','3134072730',NULL,NULL,NULL,'ACTIVO'),
(153,1,'LEONOR CRISTANCHO RAMON','AUXILIAR I',2,'60341106','leonorcristancho_2015@outlook.com','3138229585',NULL,NULL,NULL,'ACTIVO'),
(154,1,'CLAUDIA SOFIA VASQUEZ CELIS','DOCENTE ESCALAFON 7',2,'60343501','claudiasofiavasquez@gmail.com','3134072730',NULL,NULL,NULL,'ACTIVO'),
(155,16,'ELVIA TERESA CUERVO RAMIREZ','AUXILIAR III',2,'60344916','elviacuervo8@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(156,1,'MARIA DEL PILAR ALVARADO ALVAREZ','DOCENTE ESCALAFON 7',2,'60344967','pi.ly@hotmail.com','3214571087',NULL,NULL,NULL,'ACTIVO'),
(157,14,'CARMEN ELENAARENAS GARCIA','SUBJEFE',2,'60345430','carelarenasg@yahoo.es','3102185271',NULL,NULL,NULL,'ACTIVO'),
(158,1,'BLANCA ROCIO ESPEJO PEREZ','DOCENTE ESCALAFON 7',2,'60346327','rochies919@hotmail.com','3108789702',NULL,NULL,NULL,'ACTIVO'),
(159,2,'SANDRA YOLIMA DUARTE LAGOS','ASISTENTE I',2,'60346989','sandraduarte25@hotmail.es','3138700018',NULL,NULL,NULL,'ACTIVO'),
(160,1,'CELINA RUIZ SUAREZ','DOCENTE ESCALAFON 7',2,'60348909','cerusu28@gmail.com','3138328259',NULL,NULL,NULL,'ACTIVO'),
(161,2,'YEINY ANDREINA VIVARES CORTES','AUXILIAR III',2,'60349603','yeivico@hotmail.com','3212891781',NULL,NULL,NULL,'ACTIVO'),
(162,17,'OLGA LUCIA CORDERO ZAMBRANO','PROFESIONAL I',2,'60353806','olgalcorderoz@gmail.com','311-5267655',NULL,NULL,NULL,'ACTIVO'),
(163,3,'DASSY YANETH PEÑA RINCON','PROFESIONAL I',2,'60356273','dassypena@gmail.com','3138891192',NULL,NULL,NULL,'ACTIVO'),
(164,11,'YOLEIMA CUELLAR TARAZONA','AUXILIAR II',2,'60358357','yoleima.cuellar@comfanorte.com.co','3206557429',NULL,NULL,NULL,'ACTIVO'),
(165,17,'YASMIN DUARTE PEÑA','AUXILIAR I',2,'60358520','jazminduarte08@hotmail.com','3138891192',NULL,NULL,NULL,'ACTIVO'),
(166,1,'MADELEYNE SOFIA VERA MOLINA','DOCENTE - COORDINADOR',2,'60360957','madeleyne.vera@comfanorte.edu.co','3134567570',NULL,NULL,NULL,'ACTIVO'),
(167,1,'ERIKA ALEXANDRA AVELLANEDA GARAVITO','DOCENTE ESCALAFON 7',2,'60363713','eral.74@hotmail.com','3142123092',NULL,NULL,NULL,'ACTIVO'),
(168,16,'CLAUDIA XIMENA RUEDA BLANCO','AUXILIAR I',2,'60365628','claxiruda@hotmail.com','3224236012',NULL,NULL,NULL,'ACTIVO'),
(169,16,'DALIA ZULAY CARRERO GOMEZ','AUXILIAR III MEDIO TIEMPO',2,'60367685','zulaycarrero3@gmail.com','3209041388',NULL,NULL,NULL,'ACTIVO'),
(170,4,'HERLING XIMENA FERNANDEZ MALDONADO','SUBDIRECTOR ',2,'60367905','herlingfdezm3@hotmail.com','3206534702',NULL,NULL,NULL,'ACTIVO'),
(171,1,'RUTH ESTHER RIOS YAÑEZ','DOCENTE ESCALAFON 7',2,'60368029','aguila3.norte@gmail.com','3204343268',NULL,NULL,NULL,'ACTIVO'),
(172,19,'MARISOL CAICEDO ROA','PROFESIONAL I',2,'60368143','marisolcaicedoroa@yahoo.es','3125948529',NULL,NULL,NULL,'ACTIVO'),
(173,1,'ANA RENE PAIPA BUITRAGO','DOCENTE SIN ESCALAFON',2,'60371905','anapaipabuitrago@gmail.com','3102541675',NULL,NULL,NULL,'ACTIVO'),
(174,1,'OLGA PATRICIA GRANADOS GOMEZ','DOCENTE SIN ESCALAFON',2,'60372677','opgranados28@gmail.com','3124128234',NULL,NULL,NULL,'ACTIVO'),
(175,3,'ZOILA YASMIR BAUTISTA DURAN','AUXILIAR 1RO',2,'60376949','aslitross_tolosa@hotmail.com','3124001716',NULL,NULL,NULL,'ACTIVO'),
(176,14,'XIMENA ALEXANDRA RODRIGUEZ RODRIGUEZ','ASISTENTE II',2,'60377483','ximenar1076@gmail.com','3012037381',NULL,NULL,NULL,'ACTIVO'),
(177,8,'MAYRA BERCEY VARGAS VASQUEZ','AUXILIAR I',2,'60378751','mayber_1003@hotmail.com','3185043159',NULL,NULL,NULL,'ACTIVO'),
(178,11,'LUCIA LUZBBI YULIE DUARTE FUENTES','ASISTENTE I',2,'60379641','luzbbi_14@hotmail.com','3166945641',NULL,NULL,NULL,'ACTIVO'),
(179,16,'LUZ MERY ARCHILA AMADO','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'60380991','luzmeryarchilaa@gmail.com','3014852513',NULL,NULL,NULL,'ACTIVO'),
(180,21,'MARITZA JARAMILLO ARENAS','PROFESIONAL I',2,'60381539','maritza.jaramillo@hotmail.com','3005422205',NULL,NULL,NULL,'ACTIVO'),
(181,17,'CLAUDIA YOHANA MENDOZA GRANADOS','AUXILIAR III',2,'60384480','claudiayohana0525@gmail.com','3014167269',NULL,NULL,NULL,'ACTIVO'),
(182,3,'NIDIA MARLENE LUGO RONDON','PROFESIONAL II',2,'60386362','luggis19@yahoo.com','3214337277',NULL,NULL,NULL,'ACTIVO'),
(183,16,'ROSALBA BARBOSA CARDENAS','AUXILIAR III',2,'60387570','pachita0151@gmail.com','3143107256',NULL,NULL,NULL,'ACTIVO'),
(184,14,'MONICA ANDREA DIAZ SANCHEZ','AUXILIAR II',2,'60388885','moandisan1019@hotmail.com','3175677334',NULL,NULL,NULL,'ACTIVO'),
(185,11,'ANDREA DEL PILAR NESSI VILLAMIZAR','PROFESIONAL I',2,'60389238','andreanessi78@hotmail.com','3203335255',NULL,NULL,NULL,'ACTIVO'),
(186,1,'DERLY JUDITH SISSA ROLON','DOCENTE ESCALAFON 7',2,'60389565','derlysisa@hotmail.es','3143753009',NULL,NULL,NULL,'ACTIVO'),
(187,15,'ELIANA SIERRA OROZCO','AUXILIAR III',2,'60391620','elianas_1979@hotmail.com','3168255397',NULL,NULL,NULL,'ACTIVO'),
(188,8,'ALEXANDRA ALVAREZ RINCON','RESPONSABLE DE PROCESO',2,'60391975','alexandra7805-@hotmail.com','3125003932',NULL,NULL,NULL,'ACTIVO'),
(189,5,'OLGA LILIANA BUENDIA BOTELLO','RESPONSABLE DE PROCESO',2,'60394646','olgalilianabb@hotmail.com','3138700022',NULL,NULL,NULL,'ACTIVO'),
(190,4,'ADRIANA MARIA MARTINEZ CHACON','RESPONSABLE DE PROCESO',2,'60395034','chadri02@gmail.com','3102799420',NULL,NULL,NULL,'ACTIVO'),
(191,2,'MARICELA CARRILLO FLOREZ','AUXILIAR 3RO',2,'60395735','maricelak_2008@hotmail.com','3204266912',NULL,NULL,NULL,'ACTIVO'),
(192,3,'CLAUDIA MILENA DUARTE MEJIA','ASISTENTE I',2,'60395901','nalemi3279@hotmail.com','3168299387',NULL,NULL,NULL,'ACTIVO'),
(193,16,'ANA PATRICIA ARENAS CACUA','AUXILIAR III',2,'60397423','saradanieldania@gmail.com','3144174899',NULL,NULL,NULL,'ACTIVO'),
(194,15,'GLADYS LISETH JARAMILLO JARAMILLO','AUXILIAR ADMINISTRATIVO',2,'60398220','tatikajaramillo@hotmail.com','3158181897',NULL,NULL,NULL,'ACTIVO'),
(195,9,'MAYDE JOHANNA ESTEBAN PABON','PROFESIONAL II',2,'60398679','mayde1186@hotmail.com','3507091732',NULL,NULL,NULL,'ACTIVO'),
(196,1,'MYRIAM EUGENIA GALVIS CRUZ','DOCENTE ESCALAFON 7',2,'60404259','myriamcruz1945@gmail.com','3106287425',NULL,NULL,NULL,'ACTIVO'),
(197,11,'ZULAY GUADALUPE MARIÑO MONTAÑEZ','AUXILIAR III',2,'60420834','zuly7830@hotmail.com','3142988217',NULL,NULL,NULL,'ACTIVO'),
(198,2,'HELENA PANQUEVA GOMEZ','AUXILIAR III',2,'60422147','helena60422147@hotmail.com','3208021842',NULL,NULL,NULL,'ACTIVO'),
(199,14,'MARISOL MACIAS MURILLO','ASISTENTE I',2,'60422808','marisolmaciasmurillo75@gmail.com','3102676640',NULL,NULL,NULL,'ACTIVO'),
(200,20,'CIOMARA AMARIS CANCINO','AUXILIAR I',2,'60438254','xiomyamariscan@hotmail.com','3134572743',NULL,NULL,NULL,'ACTIVO'),
(201,11,'ADELAIDA FLOREZ PORTILLA','ASISTENTE II',2,'60442408','adelaflorez2008@yahoo.es','3044942082',NULL,NULL,NULL,'ACTIVO'),
(202,17,'JESMIN JARID REYES GONZALEZ','AUXILIAR I',2,'60443081','jesminreyes1112@gmail.com','3012225945',NULL,NULL,NULL,'ACTIVO'),
(203,1,'MARY ISABEL MANTILLA RIVEROS','DOCENTE ESCALAFON 7',2,'60444656','mary_isa2403@hotmail.com','3183621726',NULL,NULL,NULL,'ACTIVO'),
(204,1,'JURLEY MAHOLY ARELLANO VERGARA','DOCENTE SIN ESCALAFON',2,'60445541','jumaarv@hotmail.com','3016433753',NULL,NULL,NULL,'ACTIVO'),
(205,16,'DIANA SOFIA INFANTE ROJAS','AUXILIAR III',2,'60446910','sofiarojasandres@hotmail.com','3225873446',NULL,NULL,NULL,'ACTIVO'),
(206,1,'YAHAIRA MILENA FERNANDEZ MORA','AUXILIAR I',2,'63527214','yangief2007@gmail.com','3133391717',NULL,NULL,NULL,'ACTIVO'),
(207,9,'ANA MILENA VALDERRAMA NIÑO','AUXILIAR II',2,'63527249','hanamyle@hotmail.com','3208185739',NULL,NULL,NULL,'ACTIVO'),
(208,2,'CARLOS MARIO ESTRADA RESTREPO','AUXILIAR II',2,'70504386','carlosmae1957@gmail.com','3172789729',NULL,NULL,NULL,'ACTIVO'),
(209,12,'WILLIAM RICARDO ARENAS VERA','AUXILIAR 1RO',2,'71266193','ricardo.arenas.v@outlook.com','3177394887',NULL,NULL,NULL,'ACTIVO'),
(210,4,'PEDRO MARIA MONTES ROJAS','AUXILIAR III',2,'74300259','pedro.montes@comfanorte.com.co','3203861694',NULL,NULL,NULL,'ACTIVO'),
(211,11,'LUIS HERNANDEZ CARRASCO','MEDICO GENERAL 4 HORAS',2,'79144327','h-er2006@hotmail.com','3158112518',NULL,NULL,NULL,'ACTIVO'),
(212,1,'GUSTAVO ADOLFO VALENCIA RIVAS','AUXILIAR III',2,'79550193','gustavoadolfovalenciarivas@gmail.com','3224594791',NULL,NULL,NULL,'ACTIVO'),
(213,1,'JOSE ANTONIO CABALLERO NOGUERA','DOCENTE SIN ESCALAFON',2,'80097038','josecaballeronoguera@hotmail.com','3043355015',NULL,NULL,NULL,'ACTIVO'),
(214,1,'DIXON ALEXIS YANES URBINA','AUXILIAR III',2,'88032548','dixon.0207@hotmail.com','3138207492',NULL,NULL,NULL,'ACTIVO'),
(215,1,'CARLOS MANUEL ROBLES MARQUEZ','AUXILIAR III',2,'88034978','carlosmanuel1102@hotmail.com','3177288972',NULL,NULL,NULL,'ACTIVO'),
(216,16,'JACKSON URIEL GAMBOA VEGA','AUXILIAR II',2,'88035322','jacksaid85@hotmail.com','3178567450',NULL,NULL,NULL,'ACTIVO'),
(217,1,'JAVIER SIZA MARTINEZ','DOCENTE - COORDINADOR',2,'88130124','jasima82@hotmail.com','3142983271',NULL,NULL,NULL,'ACTIVO'),
(218,16,'MARLON ANTONIO MEJIA','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'88131240','elgrantonny12@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(219,16,'JHON JAIRO LOPEZ BARAJAS','AUXILIAR III',2,'88132063','jhonlopez202303@gmail.com','3014389419',NULL,NULL,NULL,'ACTIVO'),
(220,1,'WILLIAM ADOLFO LOBO VELASQUEZ','DOCENTE SIN ESCALAFON',2,'88143245','williamlobbo33@gmail.com','3017706927',NULL,NULL,NULL,'ACTIVO'),
(221,1,'FERNANDO CASANOVA CONTRERAS','DOCENTE ESCALAFON 7',2,'88154183','fcc_1998@hotmail.com','3183254577',NULL,NULL,NULL,'ACTIVO'),
(222,16,'PABLO ANTONIO BLANCO MANTILLA','AUXILIAR III',2,'88168625','pabloantonioblancoman@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(223,4,'FRANKLIN RUIZ VELASQUEZ','PROFESIONAL I',2,'88188295','franklinrv@hotmail.com','3138700035',NULL,NULL,NULL,'ACTIVO'),
(224,13,'MARCO ANTONIO SANCHEZ GONZALEZ','RESPONSABLE DE PROCESO',2,'88193829','markoasanchez@hotmail.com','3118311745',NULL,NULL,NULL,'ACTIVO'),
(225,12,'ARTURO ENRIQUE RUIZ HERNANDEZ','AUXILIAR 1RO',2,'88196308','arturoenriqueruiz@hotmail.com','3124246828',NULL,NULL,NULL,'ACTIVO'),
(226,12,'JOSE EVARISTO VIVAS BUSTOS','PROFESIONAL II',2,'88199890','evaristo.vivas@gmail.com','3112940924',NULL,NULL,NULL,'ACTIVO'),
(227,17,'LUIS ALBERTO INFANTE BAUTISTA','AUXILIAR III',2,'88202168','luis.infante@comfanorte.com.co','3216755539',NULL,NULL,NULL,'ACTIVO'),
(228,1,'WILLIAM MELANO','ASISTENTE II',2,'88203721','williammelano@hotmail.com','3133141825',NULL,NULL,NULL,'ACTIVO'),
(229,11,'JORGE ROMAN MORENO GUERRERO','AUXILIAR III',2,'88206356','jromanmorenog@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(230,17,'CARLOS ALBERTO GARCIA CAMACHO','PROFESIONAL I',2,'88208697','carlosalbertogarcia1@yahoo.com','3124878391',NULL,NULL,NULL,'ACTIVO'),
(231,3,'JORGE AUGUSTO LOZADA CONTRERAS','AUXILIAR III',2,'88209652','jorge8lozada@hotmail.com','3214362457',NULL,NULL,NULL,'ACTIVO'),
(232,16,'CESAR AUGUSTO TORRES GONZALEZ','AUXILIAR III',2,'88210154','ct88210154@gmail.com','3228232666',NULL,NULL,NULL,'ACTIVO'),
(233,16,'RODOLFO MELO PABON','ASISTENTE I',2,'88215480','rodolfomelo03@hotmail.com','3176793540',NULL,NULL,NULL,'ACTIVO'),
(234,6,'JORGE EDUARDO CASTRO NIÑO','AUXILIAR ADMINISTRATIVO',2,'88217199','jcastro0189@yahoo.es','3155803290',NULL,NULL,NULL,'ACTIVO'),
(235,6,'HENRRY CAMACHO ORTIZ','PROFESIONAL II',2,'88217400','hencamacho23@gmail.com','3112908328',NULL,NULL,NULL,'ACTIVO'),
(236,2,'EDUARD ALEXANDER VELASCO','AUXILIAR III',2,'88226185','eduardvg00@gmail.com','3166270002',NULL,NULL,NULL,'ACTIVO'),
(237,3,'NELSON DIAZ CACIQUE','AUXILIAR I',2,'88231703','caciquenelson17@gmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(238,3,'JHON MAURICIO LEAL HERNANDEZ','AUXILIAR I',2,'88233241','jhonmauroleal@hotmail.com','',NULL,NULL,NULL,'ACTIVO'),
(239,14,'MIGUEL ANGEL CARRILLO DIAZ','AUXILIAR III',2,'88236788','angelcarrillodiaz7821@gmail.com','3224387510',NULL,NULL,NULL,'ACTIVO'),
(240,16,'JANNS JUBER MORALES CARRILLO','AUXILIAR III',2,'88237370','jannsjuber@gmail.com','3132809021',NULL,NULL,NULL,'ACTIVO'),
(241,15,'OSCAR GUILLERMO GERARDINO ASTIER','DIRECTOR  ADMINISTRATIVO',2,'88237945','oscargerardino@hotmail.com','3105533918',NULL,NULL,NULL,'ACTIVO'),
(242,4,'ALEXIS EDUARDO GOMEZ DURAN','AUXILIAR III',2,'88238181','alexisegomezduran@gmail.com','3102599631',NULL,NULL,NULL,'ACTIVO'),
(243,3,'DARIO ANTONIO AGUDELO HERRERA','AUXILIAR II',2,'88239868','agudelodario39@gmail.com','3013504064',NULL,NULL,NULL,'ACTIVO'),
(244,10,'JUAN CARLOS ALVAREZ MUÑOZ','SECRETARIO GENERAL',2,'88241152','juan.alvarez@comfanorte.com.co','0',NULL,NULL,NULL,'ACTIVO'),
(245,1,'JHON JAIRO BANGUERO MENDOZA','DOCENTE ESCALAFON 7',2,'88244082','JHON_0320@HOTMAIL.COM','3107688012',NULL,NULL,NULL,'ACTIVO'),
(246,16,'MARTIN OBANDO SEPULVEDA','ASISTENTE II',2,'88245527','recrea1@hotmail.com','3115198492',NULL,NULL,NULL,'ACTIVO'),
(247,1,'OMAR CAMILO URIBE VELASQUEZ','DOCENTE SIN ESCALAFON',2,'88247206','u31122611698@gmail.com','3107617329',NULL,NULL,NULL,'ACTIVO'),
(248,11,'FABIAN LEONARDO NAVA CUBEROS','ASISTENTE I',2,'88248961','navaf1381@gmail.com','3002623750',NULL,NULL,NULL,'ACTIVO'),
(249,16,'JHONN JAIRO RUIZ GUERRERO','ASISTENTE I',2,'88250570','jhonruizguerrero@hotmail.com','3229095179',NULL,NULL,NULL,'ACTIVO'),
(250,3,'JOSE ROSARIO OSORIO RODRIGUEZ','AUXILIAR III',2,'88251221','joseosorio05@gmail.com','3108815037',NULL,NULL,NULL,'ACTIVO'),
(251,4,'JOSE LUIS CARRILLO BARROSO','AUXILIAR III',2,'88251328','jlcb2025@hotmail.com','3232889483',NULL,NULL,NULL,'ACTIVO'),
(252,16,'OSCAR PINZON GUALDRON','AUXILIAR III',2,'88256092','oscapinzonportilla@gmail.com','3214030761',NULL,NULL,NULL,'ACTIVO'),
(253,16,'WILMER SUAREZ BERNAL','AUXILIAR III',2,'88257631','wisbedilc9@gmail.com','3222356385',NULL,NULL,NULL,'ACTIVO'),
(254,2,'WILMAR PALLARES','AUXILIAR I',2,'88260604','pallares_9@hotmail.com','3132957400',NULL,NULL,NULL,'ACTIVO'),
(255,3,'WALTER ALIRIO ARIAS PEÑALOZA','AUXILIAR I',2,'88261079','walterarias2882@gmail.com','3163759749',NULL,NULL,NULL,'ACTIVO'),
(256,4,'JOAQUIN ARMANDO PATIÑO CORREA','AUXILIAR II',2,'88265088','armandopatino129@gmail.com','3105718120',NULL,NULL,NULL,'ACTIVO'),
(257,3,'DANIEL GERARDO CABALLERO JIMENEZ','AUXILIAR III',2,'88265920','dangercaba@gmail.com','3506812376',NULL,NULL,NULL,'ACTIVO'),
(258,1,'LUIS EMILIO GUERRERO NUÑEZ','DOCENTE SIN ESCALAFON',2,'88266912','letrasemilio@hotmail.com','3115252484',NULL,NULL,NULL,'ACTIVO'),
(259,4,'HERNANDO RAMIREZ ROA','RESPONSABLE DE PROCESO',2,'88267601','heramiroa@hotmail.com','0',NULL,NULL,NULL,'ACTIVO'),
(260,16,'GABRIEL MORA DELGADO','AUXILIAR III',2,'88270027','gabrielmoradel1983@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(261,16,'JOHNNY SARMIENTO QUINTERO','AUXILIAR III',2,'88271332','espaciadorgamez@hotmail.com','3013541770',NULL,NULL,NULL,'ACTIVO'),
(262,15,'RICARDO ANDRES ROMERO MONTOYA','PROFESIONAL I',2,'88271382','ricanromon10@outlook.com','3155006663',NULL,NULL,NULL,'ACTIVO'),
(263,4,'WILMER DELGADO DIAZ','AUXILIAR III',2,'88272787','instructorbaile@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(264,16,'ANGEL ALBERTO SIERRA','AUXILIAR II',2,'88308531','angelalbertosierra@hotmail.com','3502512559',NULL,NULL,NULL,'ACTIVO'),
(265,1,'RAMIRO LANDINEZ SUAREZ','SUBDIRECTOR ',2,'88309387','ramirolandinez@hotmail.es','3204779121',NULL,NULL,NULL,'ACTIVO'),
(266,11,'JOSE VLADIMIR CARRILLO LANDINEZ','AUXILIAR I',2,'88312894','vladimirlandinez@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(267,1,'JOHN FREDDY SALAZAR CORREA','DOCENTE SIN ESCALAFON',2,'94324198','freddysalacorrea2110@hotmail.com','3153658889',NULL,NULL,NULL,'ACTIVO'),
(268,8,'LEIDY ELENA PARRA GUERRA','APRENDICES SENA 50%',2,'1001444537','parraguerraleidy@gmail.com','3105129448',NULL,NULL,NULL,'ACTIVO'),
(269,17,'ANDREA MARCELA GONZALEZ NAVARRETE','AUXILIAR III',2,'1004346969','andrea.gonzalez@comfanorte.com.co','',NULL,NULL,NULL,'ACTIVO'),
(270,16,'LUISA FERNANDA CHACON CARRILLO','AUXILIAR III',2,'1004794947','luisach_2001@hotmail.com','3215880979',NULL,NULL,NULL,'ACTIVO'),
(271,9,'JAZMIN KATHERINE RINCON MELO','AUXILIAR III',2,'1004803891','katherine.rincon91@gmail.com','3214602155',NULL,NULL,NULL,'ACTIVO'),
(272,16,'JONATHAN ANDRES MANZANO AMAYA','AUXILIAR III',2,'1004804968','jhonatanmanzano01@gmail.com','3505409691',NULL,NULL,NULL,'ACTIVO'),
(273,17,'DIANY VALENTINA ROBLES GELVES','AUXILIAR III',2,'1004805185','dianyrobles23@gmail.com','3133007244',NULL,NULL,NULL,'ACTIVO'),
(274,11,'WILLIAM SNEYDER BOTELLO PABON','APRENDICES SENA 75%',2,'1004810939','williambotello2019@gmail.com','3223837993',NULL,NULL,NULL,'ACTIVO'),
(275,17,'ISAIAS JULIAN SANCHEZ BARRERA','AUXILIAR III',2,'1004818686','sanchez121819@gmail.com','3024885873',NULL,NULL,NULL,'ACTIVO'),
(276,14,'EIDER JOSUE ORTIZ PATIÑO','AUXILIAR III',2,'1004912540','eiderortiz46@gmail.com','3222625676',NULL,NULL,NULL,'ACTIVO'),
(277,17,'CAROL DAYANA BALLESTEROS BONETT','AUXILIAR III',2,'1004913970','carolbonett99@gmail.com','3002990110',NULL,NULL,NULL,'ACTIVO'),
(278,16,'MICHELLE JULISSA CORREDOR BELTRAN','AUXILIAR III',2,'1004923195','mcorredor211001@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(279,9,'MICHAEL ANDRES CACIQUE GELVEZ','AUXILIAR III',2,'1004923276','michaelcacique24@gmail.com','3218832003',NULL,NULL,NULL,'ACTIVO'),
(280,16,'JOSEPH ANTONY PEREZ ORTIZ','AUXILIAR III MEDIO TIEMPO',2,'1004924493','phantony514@gmail.com','3138376386',NULL,NULL,NULL,'ACTIVO'),
(281,16,'ANGIE KATHERINE SEPULVEDA PEREZ','AUXILIAR III',2,'1004924952','sepulvedaangie071@gmail.com','3229248913',NULL,NULL,NULL,'ACTIVO'),
(282,5,'YULY MARSELA CONTRERAS URBINA','AUXILIAR II',2,'1004941440','yuli.contreras@comfanorte.com.co','3228739243',NULL,NULL,NULL,'ACTIVO'),
(283,1,'LAURA VANESSA HERRERA VILLAFAÑE','APRENDICES SENA 75%',2,'1005001209','laurita.herrevilla@gmail.com','3222809675',NULL,NULL,NULL,'ACTIVO'),
(284,16,'ANDRES FELIPE VEJAR DELGADO','AUXILIAR III',2,'1005029139','felipevejar1306@gmail.com','3012313037',NULL,NULL,NULL,'ACTIVO'),
(285,2,'STIVEN JHAIR RAVELO RINCON','AUXILIAR III',2,'1005035246','jhair2125@gmail.com','3133444855',NULL,NULL,NULL,'ACTIVO'),
(286,16,'JAVIER ANDRES MENDOZA DIAZ','APRENDICES SENA 50%',2,'1005038236','jamendoza632@soy.sena.edu.co','3209762471',NULL,NULL,NULL,'ACTIVO'),
(287,14,'MERCY BEATRIZ HOLGUIN VALERO','AUXILIAR III',2,'1005039759','mbholguin9@misena.edu.co','3208683617',NULL,NULL,NULL,'ACTIVO'),
(288,16,'JESUS DANIEL RINCON RINCON','AUXILIAR III MEDIO TIEMPO',2,'1005052613','jesusdanielrincon2001@gmail.com','3224142740',NULL,NULL,NULL,'ACTIVO'),
(289,12,'ANGEL CAMILO LEON RINCON','AUXILIAR III',2,'1005052782','angelcamilo4leon@gmail.com','3117421397',NULL,NULL,NULL,'ACTIVO'),
(290,14,'DANIELA ALEJANDRA SANTOS JAIMES','AUXILIAR III',2,'1005060887','danielasantos-15@hotmail.com','3112737101',NULL,NULL,NULL,'ACTIVO'),
(291,21,'RICHAR ANDRES ESLAVA CONTRERAS','AUXILIAR I',2,'1005064580','richareslava@hotmail.com','3209022487',NULL,NULL,NULL,'ACTIVO'),
(292,18,'GELEN PATRICIA MARTINEZ CRIADO','AUXILIAR III',2,'1007366030','gelenmartinez07@hotmail.com','3206083164',NULL,NULL,NULL,'ACTIVO'),
(293,4,'ZHARICK DAYANA MUÑOZ FRANCO','AUXILIAR III',2,'1007379891','zharickmunoz23@gmail.com','3212003066',NULL,NULL,NULL,'ACTIVO'),
(294,1,'KEVIN SHNEIDER VILLAMIZAR RODRIGUEZ','AUXILIAR III',2,'1007434492','kevinwinston07@gmail.com','3174320385',NULL,NULL,NULL,'ACTIVO'),
(295,17,'CAMILO ALEXIS CARRILLO SANTOS','AUXILIAR III',2,'1007448234','carrillosantoscamiloalexis@gmail.com','3214318845',NULL,NULL,NULL,'ACTIVO'),
(296,11,'MARILEIDY PEÑARANDA AREVALO','AUXILIAR III',2,'1007953868','maripenaranda6@gmail.com','3114974522',NULL,NULL,NULL,'ACTIVO'),
(297,16,'AURA KARINA ORTIZ BELTRAN','AUXILIAR III',2,'1010056631','akobcolfrayma@gmail.com','3122169706',NULL,NULL,NULL,'ACTIVO'),
(298,1,'LENDY YELITHZA CARVAJAL JAIMES','DOCENTE ESCALAFON 7',2,'1010076480','lyendymd@gmail.com','3214791949',NULL,NULL,NULL,'ACTIVO'),
(299,17,'LEIDHER RONALDO POLO MIRANDA','AUXILIAR II',2,'1010095966','poloronaldo37@gmail.com','3123319387',NULL,NULL,NULL,'ACTIVO'),
(300,1,'OSCAR RODOLFO AREVALO GUEVARA','DOCENTE ESCALAFON 7',2,'1010105362','osarba69@gmail.com','3168097666',NULL,NULL,NULL,'ACTIVO'),
(301,16,'BRIZEIDA LORENA VILLAMIZAR CALDERON','AUXILIAR III',2,'1010108925','melanysalomegomez@gmail.com','3113989160',NULL,NULL,NULL,'ACTIVO'),
(302,1,'EYSLEN NATALIA AREVALO ALMEIDA','TECNICO PROFESIONAL O TECNOLOGO',2,'1010120367','na175696@gmail.com','3219131717',NULL,NULL,NULL,'ACTIVO'),
(303,17,'DIANA MARCELA MEJIA OLARTE','AUXILIAR 1RO',2,'1015413180','dianamejia07@hotmail.com','3212744617',NULL,NULL,NULL,'ACTIVO'),
(304,14,'CARLOS ALI TRIBIN MONTES','AUXILIAR II',2,'1018501355','carlos143698@hotmail.com','3186665194',NULL,NULL,NULL,'ACTIVO'),
(305,17,'MARIA ALEJANDRA ORTIZ OROZCO','AUXILIAR II',2,'1024484194','mariaortiz2288@hotmail.com','3204733813',NULL,NULL,NULL,'ACTIVO'),
(306,2,'ALBANY VALERIA SUAREZ AMAYA','AUXILIAR III',2,'1026300447','albanysa0121@hotmail.com','3005907278',NULL,NULL,NULL,'ACTIVO'),
(307,15,'YUNDREY JHOANA CETINA GOMEZ','APRENDICES SENA 75%',2,'1030040375','yundreycetina@gmail.com','3102264561',NULL,NULL,NULL,'ACTIVO'),
(308,11,'EDEIBER DAVID BARRERA COLON','AUXILIAR II',2,'1044423184','eder20f10@gmail.com','3017755328',NULL,NULL,NULL,'ACTIVO'),
(309,17,'JULIAN ORTIZ MARTINEZ','AUXILIAR I',2,'1053338628','jom199124@gmail.com','3223658218',NULL,NULL,NULL,'ACTIVO'),
(310,16,'JORDAN JANETH MENCO ARENAS','AUXILIAR III',2,'1064714330','Jordanmencoarenas26@gmail.com','3183311140',NULL,NULL,NULL,'ACTIVO'),
(311,5,'YINA PAOLA NARVAEZ PASTRANA','APRENDICES SENA 50%',2,'1067927140','ginnapaolanarvaezpastrana@gmail.com','3153342579',NULL,NULL,NULL,'ACTIVO'),
(312,1,'RONALD ANDERSON ARIAS JARAMILLO','DOCENTES CICLOS COLEGIO',2,'1077448242','ronaldarias11@hotmail.com','3126875105',NULL,NULL,NULL,'ACTIVO'),
(313,16,'DEYSI YOHANNA DELGADO RUBIO','AUXILIAR III',2,'1090175579','deysimich@hotmail.com','3144118999',NULL,NULL,NULL,'ACTIVO'),
(314,1,'SONIA LISETH GARCIA BENITEZ','DOCENTE ESCALAFON 7',2,'1090175894','liseth_07_@hotmail.com','3208936310',NULL,NULL,NULL,'ACTIVO'),
(315,1,'JOSE ELICEO CONTRERAS HERNANDEZ','AUXILIAR III',2,'1090176141','jcontreras92tj@gmail.com','3144579527',NULL,NULL,NULL,'ACTIVO'),
(316,11,'ANDREY RICARDO ROJAS LIZCANO','AUXILIAR III',2,'1090177287','andrey02rojas@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(317,1,'SANDRA MILENA CARRILLO GARCIA','DOCENTE SIN ESCALAFON',2,'1090362807','sandrita_23@live.com','3132902621',NULL,NULL,NULL,'ACTIVO'),
(318,13,'DIVIS ELOISA PITA ROJAS','ASISTENTE II',2,'1090364282','diviseloisa@hotmail.com','3233226169',NULL,NULL,NULL,'ACTIVO'),
(319,1,'MARILYN ORTIZ JULIO','DOCENTE SIN ESCALAFON',2,'1090365173','mariortizju@hotmail.com','3167251845',NULL,NULL,NULL,'ACTIVO'),
(320,16,'FEDERICO ALEXANDER DE MOYA DAVILA','AUXILIAR III',2,'1090365919','federymoya@gmail.com','3138700038',NULL,NULL,NULL,'ACTIVO'),
(321,10,'JUAN DIEGO JOYA MONZON','RESPONSABLE DE PROCESO',2,'1090367804','joyita867@gmail.com','3204076293',NULL,NULL,NULL,'ACTIVO'),
(322,14,'SANDRA MILENA CARVAJAL HERNANDEZ','AUXILIAR II',2,'1090373164','milena_3164@hotmail.com','3106741141',NULL,NULL,NULL,'ACTIVO'),
(323,17,'RUBY DAYANA RUIZ BOHORQUEZ','AUXILIAR III',2,'1090373834','rubydruiz13@gmail.com','3102533492',NULL,NULL,NULL,'ACTIVO'),
(324,12,'YERSON ALEXIS CARMONA JAIMES','AUXILIAR I',2,'1090373972','yersoncarmona@gmail.com','3153579857',NULL,NULL,NULL,'ACTIVO'),
(325,9,'GUILLERMO ANTONIO MONCADA ALVAREZ','ASISTENTE I',2,'1090374969','moncadag613@gmail.com','3118533350',NULL,NULL,NULL,'ACTIVO'),
(326,13,'INGRID LICETH CELIS CELY','AUXILIAR I',2,'1090375288','licethceliscely29@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(327,1,'DIANA TORCOROMA ANGARITA RODRIGUEZ','DOCENTE SIN ESCALAFON',2,'1090379482','diana.87angarita@gmail.com','3114651275',NULL,NULL,NULL,'ACTIVO'),
(328,1,'MARY ANGELICA CARRILLO PINEDA','DOCENTE ESCALAFON 7',2,'1090380264','angelicamary27@hotmail.com','3213308080',NULL,NULL,NULL,'ACTIVO'),
(329,17,'ANA MARIA PEREZ ACEVEDO','AUXILIAR 1RO',2,'1090382578','anamariap.87@hotmail.com','3058555955',NULL,NULL,NULL,'ACTIVO'),
(330,17,'GEICEL YERALDIN PIMIENTA','AUXILIAR III',2,'1090383656','pimientayeraldine@gmail.com','3114647265',NULL,NULL,NULL,'ACTIVO'),
(331,6,'MARIA FERNANDA COLMENARES BARRETO','PROFESIONAL II',2,'1090384196','mafercolba@hotmail.com','3015334504',NULL,NULL,NULL,'ACTIVO'),
(332,14,'JENNY KATHERINE ROPERO CACERES','AUXILIAR III',2,'1090385019','katherine.1213@hotmail.com','3208871081',NULL,NULL,NULL,'ACTIVO'),
(333,16,'EDSON JHAIR DIAZ RINCON','AUXILIAR II',2,'1090387319','edsondiaz92@gmail.com','3013992619',NULL,NULL,NULL,'ACTIVO'),
(334,4,'LEIDY DIANA CAICEDO SANDOVAL','AUXILIAR III',2,'1090391238','ldiana1401@gmail.com','3143389718',NULL,NULL,NULL,'ACTIVO'),
(335,1,'YOMAR ANDREA FRANCO VARGAS','DOCENTE SIN ESCALAFON',2,'1090391495','andre29franco@gmail.com','3045915015',NULL,NULL,NULL,'ACTIVO'),
(336,17,'INGRID KATHERINE LEAL CASTELLANOS','AUXILIAR I',2,'1090392821','katyle_18@hotmail.com','3152007894',NULL,NULL,NULL,'ACTIVO'),
(337,10,'AURA CONSTANZA VARGAS MARIÑO','ASISTENTE I',2,'1090392911','auritavargas23@hotmail.com','3107902273',NULL,NULL,NULL,'ACTIVO'),
(338,1,'MAYRA YANETH GARCIA ACEVEDO','AUXILIAR II',2,'1090394256','mayragarciaacevedo@gmail.com','3112230814',NULL,NULL,NULL,'ACTIVO'),
(339,16,'MONICA DAYANA GRIMALDO TULANDE','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'1090395343','monicadayanagrimaldotulande@gmail.com','3208502318',NULL,NULL,NULL,'ACTIVO'),
(340,11,'EDDINSON DANIEL RANGEL ASTUDILLO','AUXILIAR I',2,'1090401197','daniel_rangel_astudillo@hotmail.com','3007830528',NULL,NULL,NULL,'ACTIVO'),
(341,4,'LEYDI CAROLINA CAMARGO SANTIAGO','ASISTENTE I',2,'1090401491','leydicaro_@hotmail.com','3132337806',NULL,NULL,NULL,'ACTIVO'),
(342,4,'PAOLA ANDREA CLARO RAMIREZ','AUXILIAR II',2,'1090405630','claropaola107@gmail.com','3125250340',NULL,NULL,NULL,'ACTIVO'),
(343,16,'CARLOS ALBERTO CARDENAS MENDOZA','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'1090408183','t.scarloscardenas04@gmail.com','3212211308',NULL,NULL,NULL,'ACTIVO'),
(344,2,'DEISY KARINA PALENCIA CAMPOS','AUXILIAR II',2,'1090410710','karina_palencia89@hotmail.com','3233009440',NULL,NULL,NULL,'ACTIVO'),
(345,1,'YESSICA PAOLA PLATA TOLOZA','DOCENTE SIN ESCALAFON',2,'1090411557','psico_yessicaplata@hotmail.com','3128266541',NULL,NULL,NULL,'ACTIVO'),
(346,1,'ZOILO ANDRES GUTIERREZ CUADROS','AUXILIAR I',2,'1090412962','andresgutierrez1118@gmail.com','3203710985',NULL,NULL,NULL,'ACTIVO'),
(347,9,'YENY MARIA PRADA VILLEGAS','APRENDICES SENA 75%',2,'1090416447','yennymariapradavillegas@gmail.com','3017524016',NULL,NULL,NULL,'ACTIVO'),
(348,4,'SANDY KARINA LOZANO GARCIA','ASISTENTE II',2,'1090424029','sandylozano_017@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(349,17,'ANDREA SHIRLEY BENAVIDES GUILLEN','AUXILIAR III',2,'1090425369','andreabenavides963@gmail.com','3122604853',NULL,NULL,NULL,'ACTIVO'),
(350,1,'MARIA ESTRELLA RODRIGUEZ RIVEROS','DOCENTE ESCALAFON 7',2,'1090425866','estrella2005_14@hotmail.com','3103004503',NULL,NULL,NULL,'ACTIVO'),
(351,8,'KAREN LIZETH SANCHEZ DURAN','ASISTENTE II',2,'1090426009','karen.sanchez0714@hotmail.com','3185326750',NULL,NULL,NULL,'ACTIVO'),
(352,1,'YICEL ESTEPHANIE PEÑALOZA RESTREPO','TECNICO PROFESIONAL O TECNOLOGO',2,'1090426335','estefanyp4814@gmail.com','3105720769',NULL,NULL,NULL,'ACTIVO'),
(353,3,'PAOLA ALEXANDRA MEZA PABON','PROFESIONAL I',2,'1090427830','paolalexamezapabon@gmail.com','3013904143',NULL,NULL,NULL,'ACTIVO'),
(354,4,'LUIS ALBERTO LIZCANO HEREDIA','AUXILIAR III',2,'1090428592','luis-368@hotmail.com','3102690772',NULL,NULL,NULL,'ACTIVO'),
(355,16,'JESUS DAVID PACHECO OSORIO','AUXILIAR III',2,'1090430652','osorio0712@gmail.com','3138111794',NULL,NULL,NULL,'ACTIVO'),
(356,5,'LINA FERNANDA HERRERA PAIPA','ASISTENTE II',2,'1090432113','fer-2203@hotmail.com','3186149371',NULL,NULL,NULL,'ACTIVO'),
(357,14,'JULIE CATHERINE MORALES DELGADO','AUXILIAR III',2,'1090433071','jcmd2025@outlook.com','3114711432',NULL,NULL,NULL,'ACTIVO'),
(358,17,'MERY YANETH CASTELLANOS VILLAMIZAR','AUXILIAR II',2,'1090435102','mycastellanos2007@hotmail.com','3132938512',NULL,NULL,NULL,'ACTIVO'),
(359,8,'ERIKA ANDREINA CABALLERO CONTRERAS','AUXILIAR I',2,'1090438041','eacaballeroc@gmail.com','3176718633',NULL,NULL,NULL,'ACTIVO'),
(360,1,'SAUDY SYDNEY REYES DIAZ','DOCENTE - COORDINADOR',2,'1090438464','taticasidney@hotmail.com','3134925567',NULL,NULL,NULL,'ACTIVO'),
(361,17,'MAYRA ALEJANDRA ILLERA MORENO','AUXILIAR III',2,'1090440589','cali-bella15@hotmail.com','3204632411',NULL,NULL,NULL,'ACTIVO'),
(362,1,'NEUDIS SOLANYI CASTRO GOMEZ','DOCENTE ESCALAFON 7',2,'1090442007','nscg_06@hotmail.com','3127087732',NULL,NULL,NULL,'ACTIVO'),
(363,2,'ANDRES ALFONSO LUGO REALES','ASISTENTE II',2,'1090443197','halo.andri@hotmail.com','3043846338',NULL,NULL,NULL,'ACTIVO'),
(364,1,'KATHERINE ANDREA MEDINA DURAN','AUXILIAR III',2,'1090443667','andreitamd_19@hotmail.com','3045912939',NULL,NULL,NULL,'ACTIVO'),
(365,15,'ANDREA FERNANDA GALVIS DEVIA','ASISTENTE I',2,'1090443713','angal15@hotmail.com','3011141449',NULL,NULL,NULL,'ACTIVO'),
(366,1,'KELLY YURLEY BENITEZ FLOREZ','DOCENTE ESCALAFON 7',2,'1090447563','yurleyflorez@hotmail.com','3134088799',NULL,NULL,NULL,'ACTIVO'),
(367,9,'CHARLY RAMON DUARTE CASTRO','RESPONSABLE DE PROCESO',2,'1090448605','charlyduartec.92@gmail.com','3154975238',NULL,NULL,NULL,'ACTIVO'),
(368,15,'CLAUDIA JULIANA AVELLANEDA CARVAJALINO','PROFESIONAL II',2,'1090449113','clajuave@gmail.com','3185279389',NULL,NULL,NULL,'ACTIVO'),
(369,1,'CESAR ALBERTO CONTRERAS RANGEL','DOCENTE SIN ESCALAFON',2,'1090449262','cesaralber11@gmail.com','3186665194',NULL,NULL,NULL,'ACTIVO'),
(370,1,'ANA MARIA MORA LEAL','DOCENTE ESCALAFON 7',2,'1090453108','anama.078@gmail.com','3183919470',NULL,NULL,NULL,'ACTIVO'),
(371,4,'DORIS VICTORIA REY GRANADOS','AUXILIAR III',2,'1090454524','victoria.rey29@outlook.com','3506105634',NULL,NULL,NULL,'ACTIVO'),
(372,15,'OLIMAR SARAY QUINTERO MORALES','AUXILIAR III',2,'1090455350','olimar07.q@gmail.com','3102563989',NULL,NULL,NULL,'ACTIVO'),
(373,16,'BIANNY MARCELA LAZARO REMOLINA','AUXILIAR III',2,'1090456610','marcelalazaro153@gmail.com','3223773242',NULL,NULL,NULL,'ACTIVO'),
(374,16,'CESAR ANDRES GIRALDO RAMIREZ','AUXILIAR I',2,'1090456799','cesar_giraldo@outlook.com','3002584774',NULL,NULL,NULL,'ACTIVO'),
(375,3,'LEYDI JOHANNA BOTELLO CONTRERAS','AUXILIAR I',2,'1090458685','ing.leydibotello@gmail.com','3166649461',NULL,NULL,NULL,'ACTIVO'),
(376,4,'JENNY NAILETH AREVALO CASANOVA','ASISTENTE I',2,'1090459294','naileth.arevalo@gmail.com','3213982872',NULL,NULL,NULL,'ACTIVO'),
(377,9,'JESSICA MARLEN PAIPA RICO','AUXILIAR III',2,'1090460514','jessicapaipa@gmail.com','3114422914',NULL,NULL,NULL,'ACTIVO'),
(378,4,'INGRID CAMILA CORREA VARGAS','AUXILIAR III',2,'1090461224','camilacorreavargas01@gmail.com','3115734091',NULL,NULL,NULL,'ACTIVO'),
(379,1,'CINDY KARIME MENDOZA SIERRA','DOCENTE SIN ESCALAFON',2,'1090462362','cindymendozasierra25@gmail.com','3163919090',NULL,NULL,NULL,'ACTIVO'),
(380,17,'GIULIANA MARIA DEL PILAR ROZO CUBEROS','AUXILIAR I',2,'1090462998','giuliannarozo@gmail.com','3124799890',NULL,NULL,NULL,'ACTIVO'),
(381,17,'JUAN ALBERTO LIZARAZO SUAREZ','AUXILIAR III',2,'1090464726','juanalberto5845079@hotmail.com','3223653797',NULL,NULL,NULL,'ACTIVO'),
(382,1,'ASTRID PATRICIA ORTIZ VILLAMIZAR','DOCENTE SIN ESCALAFON',2,'1090466339','apov08@hotmail.com','3196402599',NULL,NULL,NULL,'ACTIVO'),
(383,16,'JEYSON ALBERTO SANTOS OSORIO','AUXILIAR III',2,'1090466696','santos.jas@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(384,4,'CARLOS ISIDRO BLANCO PINTO','AUXILIAR III',2,'1090468457','carlosblancopinto@gmail.com','3016199045',NULL,NULL,NULL,'ACTIVO'),
(385,9,'JENNY MALENA BECERRA CHAPARRO','AUXILIAR I',2,'1090469244','jmalena1993@gmail.com','3208261912',NULL,NULL,NULL,'ACTIVO'),
(386,1,'YEIRLIN ZAMARA ANDRADE PARADA','DOCENTE SIN ESCALAFON',2,'1090470086','yeirlinzamaraandrade@gmail.com','3183850608',NULL,NULL,NULL,'ACTIVO'),
(387,17,'NERY KATHERINE CANTERO GARCIA','AUXILIAR III',2,'1090470103','nerykcanterog@gmail.com','3107686904',NULL,NULL,NULL,'ACTIVO'),
(388,1,'KATHERIN YANID MENDEZ ARIAS','DOCENTE ESCALAFON 7',2,'1090470402','kymarias@hotmail.com','3227028942',NULL,NULL,NULL,'ACTIVO'),
(389,1,'ANGE MILENA GRANADOS MATEUS','DOCENTE SIN ESCALAFON',2,'1090474037','milena_alejo24@hotmail.com','3167968201',NULL,NULL,NULL,'ACTIVO'),
(390,9,'ADRIANA CAROLINA CALVO BARAJAS','APRENDICES SENA 50%',2,'1090477494','adri.calvo678@gmail.com','3214229181',NULL,NULL,NULL,'ACTIVO'),
(391,17,'MARTIN ALIRIO PEROZO TORRES','AUXILIAR III',2,'1090479357','martinperozo100@gmail.com','3222158104',NULL,NULL,NULL,'ACTIVO'),
(392,9,'LUZ ANGELICA GARZON GOMEZ','AUXILIAR III',2,'1090481493','luz.garzon@comfanorte.com.co','3105704018',NULL,NULL,NULL,'ACTIVO'),
(393,16,'JORLEANA CARIDAD CHACIN CORREDOR','AUXILIAR III',2,'1090482681','jorleanachacin8@gmail.com','3224725286',NULL,NULL,NULL,'ACTIVO'),
(394,16,'JOSE DIEGO ESPINOSA PEREZ','AUXILIAR III',2,'1090483942','joseespinosaperez1992@gmail.com','3227646802',NULL,NULL,NULL,'ACTIVO'),
(395,17,'YURLEY ORTEGA GAONA','AUXILIAR III',2,'1090484933','yurleyortega1994@gmail.com','3233943107',NULL,NULL,NULL,'ACTIVO'),
(396,1,'GEIDI SUSANA FLOREZ SEPULVEDA','DOCENTE ESCALAFON 7',2,'1090486492','heidy_geek@hotmail.com','3107752566',NULL,NULL,NULL,'ACTIVO'),
(397,14,'MARIA FERNANDA NIETO CARREÑO','AUXILIAR III',2,'1090487732','mafernieto05@hotmail.com','3182521952',NULL,NULL,NULL,'ACTIVO'),
(398,16,'ASTRID CAROLINA GOMEZ GALVIS','AUXILIAR I',2,'1090488464','Astridkaro.gomez@gmail.com','3102748970',NULL,NULL,NULL,'ACTIVO'),
(399,14,'WILLIAM ALEXIS FARFAN RODRIGUEZ','AUXILIAR I',2,'1090490486','OVELIS1995@HOTMAIL.COM','3142981607',NULL,NULL,NULL,'ACTIVO'),
(400,17,'KATIA LISBETH GARCIA TURIZO','AUXILIAR III',2,'1090495974','lisbeth02garcia@gmail.com','3118570238',NULL,NULL,NULL,'ACTIVO'),
(401,1,'YURLEY NATHALIA GUTIERREZ YAÑEZ','DOCENTE ESCALAFON 7',2,'1090497825','natalia_nena.11@hotmail.com','3118352757',NULL,NULL,NULL,'ACTIVO'),
(402,17,'PAULA ANDREA RAMIREZ MANOSALVA','AUXILIAR II',2,'1090498905','pa.manosalva96@gmail.com','3168667542',NULL,NULL,NULL,'ACTIVO'),
(403,1,'FLOR MARIA DURAN LUNA','DOCENTE NORMALISTA O TECNOLOGO EDUCACION',2,'1090499865','fmdl_396@hotmail.com','3142573736',NULL,NULL,NULL,'ACTIVO'),
(404,11,'DANIEL FELIPE CONTRERAS GARCIA','AUXILIAR III',2,'1090500052','dgarciac1908@gmail.com','3143436035',NULL,NULL,NULL,'ACTIVO'),
(405,12,'NELSON FABIAN AMAYA BERMUDEZ','ASISTENTE I',2,'1090500834','amayafabian96@gmail.com','3105629244',NULL,NULL,NULL,'ACTIVO'),
(406,17,'ZEINA ESPERANZA ARAQUE GALVIS','AUXILIAR III',2,'1090504100','zeinu_esperanza@outlook.com','3219153990',NULL,NULL,NULL,'ACTIVO'),
(407,17,'MARIA FERNANDA BALLESTEROS AVENDAÑO','AUXILIAR III',2,'1090507262','maria.ballesteros27@hotmail.com','3115982301',NULL,NULL,NULL,'ACTIVO'),
(408,2,'MARIA ANGELICA SERRANO GUTIERREZ','AUXILIAR III',2,'1090507788','angelica.serrano.031@gmail.com','3117454611',NULL,NULL,NULL,'ACTIVO'),
(409,1,'JESUS DAVID REYES GRANADOS','DOCENTE SIN ESCALAFON MEDIO TIEMPO',2,'1090509348','jedarey@gmail.com','3232882059',NULL,NULL,NULL,'ACTIVO'),
(410,17,'JHAROL EDUARDO TORRES ACUÑA','AUXILIAR III',2,'1090511146','jhampierjharol06@gmail.com','3028309761',NULL,NULL,NULL,'ACTIVO'),
(411,16,'FREDDY DANIEL DELGADO CONTRERAS','ASISTENTE I',2,'1090511581','fre-ddy_05@hotmail.com','3144572740',NULL,NULL,NULL,'ACTIVO'),
(412,14,'LEIDY DAYANA MEDINA CONTRERAS','AUXILIAR III',2,'1090512601','dayanamedina98@hotmail.com','3174484431',NULL,NULL,NULL,'ACTIVO'),
(413,1,'JULIANA MARCELA MELGAREJO RINCON','DOCENTE SIN ESCALAFON',2,'1090513553','julimar2498@gmail.com','3202365495',NULL,NULL,NULL,'ACTIVO'),
(414,16,'MAICOL ANDREY LOZANO AVENDAÑO','AUXILIAR III',2,'1090513932','maicollozano1998@gmail.com','3212337955',NULL,NULL,NULL,'ACTIVO'),
(415,16,'MIGUEL ANGEL MORALES SANABRIA','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'1090514002','miguelstar2012@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(416,16,'ALEXANDER CELIS VERGEL','AUXILIAR III',2,'1090514714','alexandercelis47@gmail.com','3143361478',NULL,NULL,NULL,'ACTIVO'),
(417,16,'JUAN CAMILO CONTRERAS FLECHAS','AUXILIAR III',2,'1090515515','camilocf9819@gmail.com','3202151772',NULL,NULL,NULL,'ACTIVO'),
(418,17,'MARCOS JORDAN JEREZ ALARCON','AUXILIAR III',2,'1090522547','psi.marcosjordanjerez@gmail.com','3222803714',NULL,NULL,NULL,'ACTIVO'),
(419,17,'DANILO OROZCO AREVALO','AUXILIAR III',2,'1090526567','daniloorozcoarevalo@gmail.com','3124590550',NULL,NULL,NULL,'ACTIVO'),
(420,14,'RASHELLE NAOMI CHACON PEREZ','ASISTENTE II',2,'1090526712','rashelle.0326@gmail.com','3237997800',NULL,NULL,NULL,'ACTIVO'),
(421,4,'KAREN VIVIANA SUAREZ HERNANDEZ','AUXILIAR III',2,'1090527344','kvsh.0122@gmail.com','3028518102',NULL,NULL,NULL,'ACTIVO'),
(422,16,'EVERT CAMILO ROJAS HERNANDEZ','AUXILIAR III',2,'1090528557','evertcrojash0721@gmail.com','3143959979',NULL,NULL,NULL,'ACTIVO'),
(423,16,'JESUS SEBASTIAN SILVA PAEZ','AUXILIAR III MEDIO TIEMPO',2,'1090532608','seibassilva@gmail.com','3224173951',NULL,NULL,NULL,'ACTIVO'),
(424,16,'TOMAS ALEJANDRO ROJAS PEREZ','AUXILIAR III',2,'1090533052','tomalerope389@gmail.com','3176078974',NULL,NULL,NULL,'ACTIVO'),
(425,16,'JULIAN ALBERTO SEPULVEDA COBOS','AUXILIAR III',2,'1090534120','sepulvedacobosjulianalberto@gmail.com','3134584801',NULL,NULL,NULL,'ACTIVO'),
(426,16,'ANDRES FERNANDO RAMIREZ TRUJILLO','AUXILIAR III',2,'1090985608','ferchotimbal05@gmail.com','3155762453',NULL,NULL,NULL,'ACTIVO'),
(427,17,'MARLY TATIANA CARRASCAL CARRASCAL','APRENDICES SENA 75%',2,'1091593616','taticarrascal09@gmail.com','3005681811',NULL,NULL,NULL,'ACTIVO'),
(428,16,'JAIRO RAMIREZ ANGARITA','LIDER DEPORTIVO Y RECREATIVO (FIJO)',2,'1091654224','jairoramirezangarita@gmail.com','3186665194',NULL,NULL,NULL,'ACTIVO'),
(429,18,'LAURA PAOLA CASADIEGOS PEREZ','AUXILIAR III',2,'1091675413','lpcasadiegosp@ufpso.edu.co','3172368325',NULL,NULL,NULL,'ACTIVO'),
(430,11,'WILSON EDUARDO PACHECO QUINTERO','AUXILIAR III',2,'1091680831','wileduardop.1998@gmail.com','3229214678',NULL,NULL,NULL,'ACTIVO'),
(431,1,'JESUS MAURICIO IBAÑEZ BUITRAGO','DOCENTE SIN ESCALAFON',2,'1091810013','jesma_i_b@hotmail.com','3132509244',NULL,NULL,NULL,'ACTIVO'),
(432,15,'HEITZEL YURANNY JAIMES BOADA','APRENDICES SENA 75%',2,'1091966134','yurannyjaimes@gmail.com','3226817453',NULL,NULL,NULL,'ACTIVO'),
(433,16,'CHARMEN BRIGITTE RODRIGUEZ DIAZ','APRENDICES SENA 50%',2,'1091974458','charmenbrigitterodriguezdiaz@gmail.com','3045737987',NULL,NULL,NULL,'ACTIVO'),
(434,17,'YENNY ANDREA CELIS PEÑARANDA','AUXILIAR III',2,'1092155640','andreita-08-92@hotmail.com','3162657403',NULL,NULL,NULL,'ACTIVO'),
(435,3,'JORGE ENRIQUE ESCALANTE MANTILLA','AUXILIAR III',2,'1092336490','ch07mantilla@gmail.com','3043490082',NULL,NULL,NULL,'ACTIVO'),
(436,14,'NASLY GERALDIN REY MORA','APRENDICES SENA 75%',2,'1092337289','geraldinrey945@gmail.com','3209935116',NULL,NULL,NULL,'ACTIVO'),
(437,17,'HUGO YORFREY PEREZ MARIN','AUXILIAR III',2,'1092337598','hugoyofrey12345@gmail.com','3106173785',NULL,NULL,NULL,'ACTIVO'),
(438,13,'LEIDY ALEJANDRA GARCES RODRIGUEZ','AUXILIAR III',2,'1092337655','alejandragarces64@gmail.com','3123433537',NULL,NULL,NULL,'ACTIVO'),
(439,16,'GERMAN YESID GARCIA SANABRIA','AUXILIAR III',2,'1092337764','yeso.recreador29@gmail.com','',NULL,NULL,NULL,'ACTIVO'),
(440,13,'ANA DOLORES ACOSTA GONZALEZ','AUXILIAR I',2,'1092338008','ariatnia@hotmail.com','3103144896',NULL,NULL,NULL,'ACTIVO'),
(441,16,'ALBEIRO MANUEL CASTRILLO DURAN','AUXILIAR II',2,'1092339959','albeiromanuel29@gmail.com','3133193122',NULL,NULL,NULL,'ACTIVO'),
(442,10,'ANA KARINA CONTRERAS RODRIGUEZ','AUXILIAR I',2,'1092341336','leinykar1206@gmail.com','3506725825',NULL,NULL,NULL,'ACTIVO'),
(443,17,'JOHN JAIRO QUIROGA CARRILLO','AUXILIAR I',2,'1092342034','quiroga_duran0204@hotmail.com','3228586519',NULL,NULL,NULL,'ACTIVO'),
(444,17,'MARYURY YULIANA MUÑOZ ORTIZ','AUXILIAR III',2,'1092347378','maryuzmu91@gmail.com','3138147716',NULL,NULL,NULL,'ACTIVO'),
(445,1,'ASTRID CAROLINA GARZA AYALA','AUXILIAR III',2,'1092348827','carolina12_2007@hotmail.com','3112068483',NULL,NULL,NULL,'ACTIVO'),
(446,3,'VIVIANA DESIRETH RODRIGUEZ QUINTERO','ASISTENTE I',2,'1092352712','vivianarodriguez179205@gmail.com','3226838366',NULL,NULL,NULL,'ACTIVO'),
(447,16,'FERNEY MAURICIO GALVIS JAIMES','AUXILIAR III',2,'1092353074','fm.galvis@fesc.edu.co','3204608307',NULL,NULL,NULL,'ACTIVO'),
(448,1,'AURA KATHERINE ROMERO CASTAÑEDA','DOCENTE ESCALAFON 7',2,'1092353556','kathe4766@gmail.com','3102923318',NULL,NULL,NULL,'ACTIVO'),
(449,14,'LISLIE YURLEY BARRERA ARIAS','AUXILIAR III',2,'1092354530','yurley_1521@hotmail.com','3016973625',NULL,NULL,NULL,'ACTIVO'),
(450,16,'JOSE LEONARDO CESPEDES PLAZAS','AUXILIAR III',2,'1092356490','leonardocespedes262@gmail.com','3206515283',NULL,NULL,NULL,'ACTIVO'),
(451,2,'YEINTON ALEXANDER PEREZ GODOY','AUXILIAR III',2,'1092358606','yeikolalexander80@gmail.com','3228442242',NULL,NULL,NULL,'ACTIVO'),
(452,1,'JUAN CAMILO BEDOYA FIGUEREDO','DOCENTE SIN ESCALAFON',2,'1092359035','jcbedoya95@gmail.com','3158616107',NULL,NULL,NULL,'ACTIVO'),
(453,16,'LUIS FERNANDO MORENO JAIMES','AUXILIAR III',2,'1092360055','ferchojaimes538@gmail.com','',NULL,NULL,NULL,'ACTIVO'),
(454,4,'YURLEY KARINA VIDAL HERNANDEZ','AUXILIAR III',2,'1092360171','yurleykarina2014@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(455,13,'PAOLA JULIETH LOPEZ MURILLO','AUXILIAR I',2,'1092360796','paoyulieth.96@hotmail.com','3223061573',NULL,NULL,NULL,'ACTIVO'),
(456,4,'FRANCY AIDEE BOTIA MOSQUERA','AUXILIAR III',2,'1092360921','francybotia1996@gmail.com','3124497656',NULL,NULL,NULL,'ACTIVO'),
(457,16,'FERNANDO LARROTA ORDUZ','AUXILIAR III',2,'1092361691','fercholarrota@gmail.com','3184008964',NULL,NULL,NULL,'ACTIVO'),
(458,14,'MARIA FERNANDA BUENO RAMIREZ','AUXILIAR III',2,'1092362064','maferbuenor@gmail.com','3204154495',NULL,NULL,NULL,'ACTIVO'),
(459,17,'YORELY YANETH ORTIZ VILLAMIZAR','AUXILIAR III',2,'1092363735','yorelyyaneth@gmail.com','3114922879',NULL,NULL,NULL,'ACTIVO'),
(460,1,'CAMILA ANDREA PICON GUERRERO','DOCENTE ESCALAFON 7',2,'1092364369','cami_andre_22@hotmail.com','3214707009',NULL,NULL,NULL,'ACTIVO'),
(461,16,'LUIS ISAAC RUEDA ARANGUREN','AUXILIAR III',2,'1092392901','luisisaacrueda22@gmail.com','3213242073',NULL,NULL,NULL,'ACTIVO'),
(462,3,'GERMAN DAVID VILLAMIZAR VELEZ','APRENDICES SENA 75%',2,'1092525220','gdvillamizar0@misena.edu.co','3104235220',NULL,NULL,NULL,'ACTIVO'),
(463,14,'JEAN SEBASTIAN MENDEZ BARBOSA','APRENDICES SENA 50%',2,'1092526678','mendezjean360@gmail.com','3204736678',NULL,NULL,NULL,'ACTIVO'),
(464,18,'JACKSON LEANDRO GOMEZ SANCHEZ','APRENDICES SENA 50%',2,'1092730061','jacksongomez285@gmail.com','3212792426',NULL,NULL,NULL,'ACTIVO'),
(465,17,'DANIEL ESTIVEN MARTINEZ LEON','AUXILIAR III',2,'1092940239','danielmar2214@gmail.com','3212378489',NULL,NULL,NULL,'ACTIVO'),
(466,16,'WILMAR YESID PEÑA PEREZ','AUXILIAR III',2,'1093140207','wilmarpena06@gmail.com','3223315514',NULL,NULL,NULL,'ACTIVO'),
(467,16,'SOL MILENA RESTREPO CARVAJAL','AUXILIAR III',2,'1093140962','solmilenarestrepo502@gmail.com','3229154504',NULL,NULL,NULL,'ACTIVO'),
(468,17,'JUAN CAMILO ALVARADO BARBOSA','AUXILIAR III',2,'1093589065','alvaradocamilo289@gmail.com','3002371109',NULL,NULL,NULL,'ACTIVO'),
(469,16,'LEONARDO AUGUSTO TOBITO NAVARRO','SUBJEFE',2,'1093735505','leotobito@hotmail.com','3102787063',NULL,NULL,NULL,'ACTIVO'),
(470,16,'MARCOS ALIVIADES SILVA SANDOVAL','AUXILIAR III',2,'1093736418','marcossilva2t2@outlook.com','3213495781',NULL,NULL,NULL,'ACTIVO'),
(471,4,'JORGE  ANDRES LOPEZ CHACON','ASISTENTE I',2,'1093737047','andreschacon_23@hotmail.com','3174252202',NULL,NULL,NULL,'ACTIVO'),
(472,1,'EVIDA IRENE SANDOVAL VILLAMIZAR','DOCENTES CICLOS COLEGIO',2,'1093738278','ireneleo2020@gmail.com','3125549662',NULL,NULL,NULL,'ACTIVO'),
(473,1,'ANA MERCEDES ROA RINCON','DOCENTE ESCALAFON 7',2,'1093738641','mercyroa1507@gmail.com','3133667640',NULL,NULL,NULL,'ACTIVO'),
(474,16,'MARIA FERNANDA CORTES MARTINEZ','APRENDICES SENA 50%',2,'1093738817','mariafernandacortes.92@gmail.com','3023044753',NULL,NULL,NULL,'ACTIVO'),
(475,1,'MARIA FERNANDA CAMARGO MARTINEZ','DOCENTE SIN ESCALAFON',2,'1093743773','mfernanda.docente@gmail.com','3102707317',NULL,NULL,NULL,'ACTIVO'),
(476,16,'INDYRA YONAIRE CASTRELLON GUARIN','AUXILIAR III',2,'1093744550','indiyonai@gmail.com','3229155790',NULL,NULL,NULL,'ACTIVO'),
(477,1,'SIRLY PAOLA OCAMPO ANGARITA','AUXILIAR III',2,'1093746403','shirlyangarita@gmail.com','3243489529',NULL,NULL,NULL,'ACTIVO'),
(478,10,'ANGELICA ROCIO PEREZ GONZALEZ','ASISTENTE I',2,'1093748971','perezangelika@hotmail.com','3103617903',NULL,NULL,NULL,'ACTIVO'),
(479,1,'LESLIE KALINA FIGUEROA CACERES','DOCENTE ESCALAFON 7',2,'1093753973','cheylen4e@gmail.com','3008535161',NULL,NULL,NULL,'ACTIVO'),
(480,14,'JESSICA PAOLA QUINCHIA CRUCES','AUXILIAR 3RO',2,'1093760999','jessicaquinchia@gmail.com','3174401376',NULL,NULL,NULL,'ACTIVO'),
(481,16,'SANDRA PATRICIA LOPEZ HERNANDEZ','AUXILIAR I',2,'1093761557','sandraecoparque@gmail.com','3114457342',NULL,NULL,NULL,'ACTIVO'),
(482,1,'ANGELA MARIA MORENO GOMEZ','DOCENTE ESCALAFON 7',2,'1093762448','angeluzz1@hotmail.com','3219680975',NULL,NULL,NULL,'ACTIVO'),
(483,14,'LEIDY VIVIANA LEAL MUÑOZ','AUXILIAR I',2,'1093762677','leidyle23@hotmail.com','3162201927',NULL,NULL,NULL,'ACTIVO'),
(484,1,'JESSICA VIVIANA BLANCO GARCIA','DOCENTE ESCALAFON 7',2,'1093764722','vivianabg21@gmail.com','3156176448',NULL,NULL,NULL,'ACTIVO'),
(485,4,'FERNANDA ANDREA BARAJAS CALDERON','ASISTENTE II',2,'1093766807','ferbarajasc@hotmail.com','3102032646',NULL,NULL,NULL,'ACTIVO'),
(486,17,'JUNIOR BRAIAM CARREÑO PARADA','AUXILIAR III',2,'1093768110','junior25brian@gmail.com','3145450530',NULL,NULL,NULL,'ACTIVO'),
(487,4,'ANA KARINA CONTRERAS PARRA','ASISTENTE II',2,'1093768174','akcp93@hotmail.com','3006368472',NULL,NULL,NULL,'ACTIVO'),
(488,1,'DAYANA PAOLA RUEDA CARDENAS','DOCENTE SIN ESCALAFON',2,'1093772720','paoruedacar@gmail.com','3138070232',NULL,NULL,NULL,'ACTIVO'),
(489,3,'SANDRA PATRICIA MORENO HERNANDEZ','AUXILIAR III',2,'1093779726','moprenopaty09@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(490,9,'MERLY YULIETH LEAL DIAZ','AUXILIAR I',2,'1093782152','merlyleal_95@hotmail.com','3204135552',NULL,NULL,NULL,'ACTIVO'),
(491,15,'ALEXANDRA NERIETH RODRIGUEZ RIVERA','AUXILIAR II',2,'1093782222','alexa18@hotmail.es','3209785303',NULL,NULL,NULL,'ACTIVO'),
(492,16,'PAOLA ANDREA CILIBERTI VERA','AUXILIAR III',2,'1093782921','pao.ciliberti@hotmail.com','3012607503',NULL,NULL,NULL,'ACTIVO'),
(493,14,'JESSICA DANIELA ROJAS MORA','AUXILIAR I',2,'1093785613','jdrojas31@misena.edu.co','3193936175',NULL,NULL,NULL,'ACTIVO'),
(494,1,'KEYLA LILIANA ALVAREZ CASTELLANOS','DOCENTE SIN ESCALAFON',2,'1093786134','keyla.alvarez@comfanorte.edu.co','3115098867',NULL,NULL,NULL,'ACTIVO'),
(495,16,'MARIA FERNANDA AYALA ESCALANTE','AUXILIAR III',2,'1093786783','maferescalante558@gmail.com','3186665194',NULL,NULL,NULL,'ACTIVO'),
(496,16,'CRISTIAN DANUIL FLOREZ PORTILLA','AUXILIAR III',2,'1093796124','CDFLOREZ96@MISENA.EDU.CO','3143207370',NULL,NULL,NULL,'ACTIVO'),
(497,11,'MAYERLY ANDREA MENDOZA ORTIZ','AUXILIAR III',2,'1093797468','maye_9807@hotmail.com','3125600781',NULL,NULL,NULL,'ACTIVO'),
(498,17,'JESUS JOHANY CARDENAS GARCIA','AUXILIAR III',2,'1093797721','yohanny025@gmail.com','3186665194',NULL,NULL,NULL,'ACTIVO'),
(499,11,'ROSAURA ALTAMIRANO CASTRO','AUXILIAR III',2,'1093799977','rosaura010799@hotmail.com','3207969609',NULL,NULL,NULL,'ACTIVO'),
(500,4,'DANIELA HORTUA SAENZ','AUXILIAR III',2,'1093801950','daniela-hortua-saenz@hotmail.com','3103189961',NULL,NULL,NULL,'ACTIVO'),
(501,16,'ANGEL STIVEN GARCIA DIAZ','AUXILIAR III',2,'1093884224','leidygc32@gmail.com','3154582598',NULL,NULL,NULL,'ACTIVO'),
(502,16,'EIMER OMAR LLANES CAICEDO','AUXILIAR III',2,'1093885152','eimer0602@live.com','3123205911',NULL,NULL,NULL,'ACTIVO'),
(503,16,'SANDRA PATRICIA JIMENEZ SERRANO','AUXILIAR III MEDIO TIEMPO',2,'1093885307','sandriss2326@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(504,16,'ANGELICA MARIA ROMERO CARDENAS','AUXILIAR III',2,'1093885617','anita25021@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(505,16,'KAREN JULIETH DIAZ MUÑOZ','AUXILIAR I',2,'1093886348','karendiaz-gm@hotmail.com','3213017921',NULL,NULL,NULL,'ACTIVO'),
(506,17,'ERIKA VIVIANA RAMIREZ PEREZ','AUXILIAR III',2,'1093886360','evirape04@gmail.com','3112174523',NULL,NULL,NULL,'ACTIVO'),
(507,16,'MAYERLE KATHERINE CARDENAS VILLAMIZAR','AUXILIAR III',2,'1093886665','kathe_090116@hotmail.com','3134006313',NULL,NULL,NULL,'ACTIVO'),
(508,3,'ALEJANDRA MICHEL PEÑA ROMERO','APRENDICES SENA 75%',2,'1093905452','alejandram.p.romero@gmail.com','3209122940',NULL,NULL,NULL,'ACTIVO'),
(509,16,'ROSSY KATHERINE DURAN','LIDER DEPORTIVO Y RECREATIVO  (POR EVENT',2,'1093907350','rossyduran90@gmail.com','3124631947',NULL,NULL,NULL,'ACTIVO'),
(510,9,'LEIDY JACKELINE MARIN','AUXILIAR I',2,'1093908500','leidymarin528@gmail.com','3203948708',NULL,NULL,NULL,'ACTIVO'),
(511,20,'MARLIN JAZMIN VIVAS CACERES','AUXILIAR III',2,'1093917620','miluna_tqm@hotmail.com','3217400571',NULL,NULL,NULL,'ACTIVO'),
(512,4,'CHAROL DANIELA ORTIZ VELASQUEZ','AUXILIAR III',2,'1094044077','charol20j@gmail.com','3223588942',NULL,NULL,NULL,'ACTIVO'),
(513,1,'VICTOR MANUEL URIBE PALENCIA','AUXILIAR III',2,'1094161789','victor_uribe07@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(514,6,'EDWIN SANTIAGO ORELLANOS MARIÑO','PROFESIONAL II',2,'1094164948','santiago_orellanos@hotmail.com','3125501790',NULL,NULL,NULL,'ACTIVO'),
(515,2,'ENYISS YURAIMA RONDON RAMIREZ','AUXILIAR III',2,'1094165213','yuraimarondon338@gmail.com','3106731212',NULL,NULL,NULL,'ACTIVO'),
(516,1,'SANDRA YANETH SUAREZ VILLAMIZAR','DOCENTE SIN ESCALAFON',2,'1094240382','sandy0816mat@gmail.com','3213656363',NULL,NULL,NULL,'ACTIVO'),
(517,14,'YELITZA PARADA VERA','ASISTENTE II',2,'1094244045','yelipsicologia21@hotmail.com','3214665113',NULL,NULL,NULL,'ACTIVO'),
(518,16,'JAVIER MAURICIO ARIAS JAIMES','LIDER DEPORTIVO Y RECREATIVO (FIJO)',2,'1094245388','javier.arias@comfanorte.com.co','3125577251',NULL,NULL,NULL,'ACTIVO'),
(519,1,'JESSICA PAOLA SILVA VERA','DOCENTE ESCALAFON 7',2,'1094245413','jessicasv523@hotmail.com','3202581525',NULL,NULL,NULL,'ACTIVO'),
(520,1,'DERIS MAYLEN HERNANDEZ AMAYA','DOCENTES CICLOS COLEGIO',2,'1094247696','dmhernadez69@misena.edu.co','3188097948',NULL,NULL,NULL,'ACTIVO'),
(521,16,'CARLOS JOVANNY SANTOS QUINCHOA','LIDER DEPORTIVO Y RECREATIVO (FIJO)',2,'1094248112','qcjsl19@hotmail.com','3176575016',NULL,NULL,NULL,'ACTIVO'),
(522,1,'YOHAN JOSE MORA CONTRERAS','DOCENTE SIN ESCALAFON',2,'1094249010','gounter18@hotmail.com','3118080632',NULL,NULL,NULL,'ACTIVO'),
(523,16,'LEIDY ISAMAR CONTRERAS CASTELLANOS','AUXILIAR III',2,'1094265657','leidy.contreras@comfanorte.com.co','3042134598',NULL,NULL,NULL,'ACTIVO'),
(524,19,'SEBASTIAN TORRES SUAREZ','APRENDICES SENA 50%',2,'1094277909','sesuarez096@gmail.com','3138292454',NULL,NULL,NULL,'ACTIVO'),
(525,17,'KARENT YUDERKY PEREZ DELGADO','AUXILIAR III',2,'1094370694','karenyperez9.7@gmail.com','3219041131',NULL,NULL,NULL,'ACTIVO'),
(526,11,'SERGIO OMAR GRANADOS ARAQUE','AUXILIAR I',2,'1094552085','seromarga2012@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(527,11,'ANDREA CAROLINA CARRERO RUBIO','ASISTENTE II',2,'1094859217','accarreror@gmail.com','3102829700',NULL,NULL,NULL,'ACTIVO'),
(528,2,'PEDRO ALBERT KAYE SANCHEZ','AUXILIAR III',2,'1095816287','xl_rz@hotmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(529,1,'MARISOL FLOREZ COBOS','DOCENTE SIN ESCALAFON',2,'1096950458','marisolflorezcobos1625@gmail.com','3207503059',NULL,NULL,NULL,'ACTIVO'),
(530,1,'YOHANNA PRIETO IBAÑEZ','DOCENTE SIN ESCALAFON',2,'1096951471','yprieto@outlook.es','3012759168',NULL,NULL,NULL,'ACTIVO'),
(531,1,'EVER ALBERTO LIZARAZO CARDENAS','DOCENTE SIN ESCALAFON',2,'1098822138','evertlizarazo@gmail.com','3186665194',NULL,NULL,NULL,'ACTIVO'),
(532,16,'EDGAR ARMANDO VASQUEZ PARADA','AUXILIAR III',2,'1106899574','ev8694895@gmail.com','3204023186',NULL,NULL,NULL,'ACTIVO'),
(533,13,'ERIKA LISBETH STAPERS BOHORQUEZ','APRENDICES SENA 50%',2,'1116788855','mis_princesas02@hotmail.com','3135126311',NULL,NULL,NULL,'ACTIVO'),
(534,4,'JERSON FABIAN CASTRO RIVERA','AUXILIAR III',2,'1118563440','jfcr.95@outlook.com','3184248316',NULL,NULL,NULL,'ACTIVO'),
(535,4,'WENDY NIKOL GODOY SANCHEZ','AUXILIAR III',2,'1118873240','wendynikol-1060@hotmail.com','3227728980',NULL,NULL,NULL,'ACTIVO'),
(536,17,'YASMEIDA COROMOTO ROPERO PAEZ','AUXILIAR III',2,'1126119314','yasmeida.ropero1@misena.edu.co','3106906883',NULL,NULL,NULL,'ACTIVO'),
(537,21,'SERGIO EDUARDO PEÑARANDA CORREA','APRENDICES SENA 75%',2,'1127045253','sergiopenarandaca534@gmail.com','3143273133',NULL,NULL,NULL,'ACTIVO'),
(538,1,'SANTIAGO DAVID GAMBOA PARRA','LIDER DEPORTIVO Y RECREATIVO (FIJO)',2,'1127048066','santiagodavidgamboa19@gmail.com','3026787241',NULL,NULL,NULL,'ACTIVO'),
(539,1,'GENNY ESPERANZA CACERES GUALDRON','DOCENTE ESCALAFON 7',2,'1135004074','genny123caceres@gmail.com','3144823926',NULL,NULL,NULL,'ACTIVO'),
(540,16,'YURGEN BLADIMIR BONILLA BUITRAGO','AUXILIAR III',2,'1148145618','yurgenbbb@gmail.com','3012649087',NULL,NULL,NULL,'ACTIVO'),
(541,1,'SORANYI VALENTINA RIOS BOBADILLA','DOCENTE ESCALAFON 7',2,'1192792379','riosvalentina04@gmail.com','3165392723',NULL,NULL,NULL,'ACTIVO'),
(542,16,'KALET MEJIA PEREZ','AUXILIAR III',2,'1192798390','mejiakalet9@gmail.com','3160485897',NULL,NULL,NULL,'ACTIVO'),
(543,5,'SABRINA CANDELO ORTEGA','AUXILIAR III',2,'1193136015','sabry160997@gmail.com','3204700409',NULL,NULL,NULL,'ACTIVO'),
(544,1,'JULIETH KATHERINNE MANTILLA RAMIREZ','APRENDICES SENA 75%',2,'1193207536','jkmantilla6@misena.edu.co','3006281925',NULL,NULL,NULL,'ACTIVO'),
(545,12,'IVAN ALBERTO PEREZ RODRIGUEZ','AUXILIAR I',2,'1193236335','ivanperez0224@gmail.com','3207796430',NULL,NULL,NULL,'ACTIVO'),
(546,17,'ROBIN ALEJANDRO KELIN GELVEZ','AUXILIAR III',2,'1193387944','robinalejandrokelingel@gmail.com','3106791848',NULL,NULL,NULL,'ACTIVO'),
(547,16,'FABIO ALEJANDRO QUIJANO ZAMBRANO','AUXILIAR III',2,'1193396978','algimar7@gmail.com','3125271207',NULL,NULL,NULL,'ACTIVO'),
(548,4,'JEISSON JAVIER CARDENAS FIGUEROA','AUXILIAR III',2,'1193475532','jeissoncardenas01@gmail.com','3222429453',NULL,NULL,NULL,'ACTIVO'),
(549,13,'INGRID MAYERLY CACEREZ TELLEZ','AUXILIAR III',2,'1193514909','ingridcaceres1529@gmail.com','3102122858',NULL,NULL,NULL,'ACTIVO'),
(550,13,'DAYANNA PATRICIA MARIN DAVILA','AUXILIAR I',2,'1193523217','dayannamarin1909@gmail.com','NULL',NULL,NULL,NULL,'ACTIVO'),
(551,17,'YURY NAYELY MARTINEZ GARCIA','AUXILIAR III',2,'1214214402','yurynayely23@gmail.com','3008451297',NULL,NULL,NULL,'ACTIVO'),
(552,3,'BEIKER JAVIER DIAZ AGUDELO','APRENDICES SENA 50%',2,'1241590541','beikerjavierdiaz@gmail.com','3104846264',NULL,NULL,NULL,'ACTIVO');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_evento` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `modalidad` varchar(20) NOT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_tipo_evento` (`id_tipo_evento`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_tipo_evento`) REFERENCES `tipo_evento` (`id_tipo_evento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES
(1,2,'Toma de conciencia','SGC - Toma de conciencia - Gobierno Corporativo','VIRTUAL',NULL,'https://meet.google.com/qdd-syqi-ymx','2023-12-22 20:00:00','ACTIVO'),
(2,1,'Bingo comienzo de la Novena de Navidad','La magia de la navidad ya llegó! Participa del gran Bingo comienzo de la Novena Navideña este sábado 16 de diciembre a las 6:30 p. m., donde podrás ganar espectaculares premios.','VIRTUAL',NULL,'https://acortar.link/ICbHbK','2023-12-16 23:00:00','ACTIVO'),
(3,1,'Novenas Navideñas 2023','La Familia Comfanorte tiene el gusto de invitarte a participar en la plazoleta Moisés Sanjuan López \r\nde las novenas de Aguinaldos 2023.','PRESENCIAL','Plazoleta Moisés Sanjuan López',NULL,'2023-12-15 21:00:00','ACTIVO');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceso` (
  `id_proceso` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id_proceso`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
INSERT INTO `proceso` VALUES
(1,'EDUCACION COLEGIO','ACTIVO'),
(2,'EDUCACION INSTITUTO','ACTIVO'),
(3,'GESTION ADMINISTRATIVA       ','ACTIVO'),
(4,'GESTION COMERCIAL Y MERCADEO','ACTIVO'),
(5,'GESTION CONTABLE','ACTIVO'),
(6,'GESTION DE AUDITORIAS','ACTIVO'),
(7,'GESTION DE RIESGOS','ACTIVO'),
(8,'GESTION FINANCIERA','ACTIVO'),
(9,'GESTION HUMANA','ACTIVO'),
(10,'GESTION JURIDICA','ACTIVO'),
(11,'GESTION SOCIAL','ACTIVO'),
(12,'GESTION TECNOLOGICA','ACTIVO'),
(13,'GESTION TESORERIA Y CARTERA','ACTIVO'),
(14,'MECANISMO DE PROTECCION AL CENSANTE','ACTIVO'),
(15,'PLANEACION','ACTIVO'),
(16,'RECREACION','ACTIVO'),
(17,'SUBSIDIO','ACTIVO'),
(18,'UISC OCAÑA','ACTIVO'),
(19,'UISC PAMPLONA','ACTIVO'),
(20,'UISC TIBU','ACTIVO'),
(21,'VIVIENDA Y CREDITO SOCIAL','ACTIVO');
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_anuncio`
--

DROP TABLE IF EXISTS `tipo_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_anuncio` (
  `id_tipo_anuncio` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_anuncio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_anuncio`
--

LOCK TABLES `tipo_anuncio` WRITE;
/*!40000 ALTER TABLE `tipo_anuncio` DISABLE KEYS */;
INSERT INTO `tipo_anuncio` VALUES
(1,'NOTICIA','ACTIVO'),
(2,'COMUNICADO','ACTIVO');
/*!40000 ALTER TABLE `tipo_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_aplicacion`
--

DROP TABLE IF EXISTS `tipo_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_aplicacion` (
  `id_tipo_aplicacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_aplicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_aplicacion`
--

LOCK TABLES `tipo_aplicacion` WRITE;
/*!40000 ALTER TABLE `tipo_aplicacion` DISABLE KEYS */;
INSERT INTO `tipo_aplicacion` VALUES
(1,'APLICACIÓN DE ESCRITORIO','ACTIVO'),
(2,'APLICACIÓN WEB EN LOCAL','ACTIVO'),
(3,'APLICACIÓN WEB EN LA NUBE','ACTIVO');
/*!40000 ALTER TABLE `tipo_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_archivo`
--

DROP TABLE IF EXISTS `tipo_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_archivo` (
  `id_tipo_archivo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_archivo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_archivo`
--

LOCK TABLES `tipo_archivo` WRITE;
/*!40000 ALTER TABLE `tipo_archivo` DISABLE KEYS */;
INSERT INTO `tipo_archivo` VALUES
(1,'MANUAL','ACTIVO'),
(2,'TUTORIAL','ACTIVO'),
(3,'FORMATO','ACTIVO'),
(4,'DOCUMENTO','ACTIVO');
/*!40000 ALTER TABLE `tipo_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES
(1,'CARNET DIPLOMATICO','CD','ACTIVO'),
(2,'CEDULA DE CIUDADANIA','CC','ACTIVO'),
(3,'CEDULA DE EXTRANJERIA','CE','ACTIVO'),
(4,'DOCUMENTO DE IDENTIFICACION EXTRANJERO','NE','ACTIVO'),
(5,'NUMERO DE IDENTIFICACION TRIBUTARIA','NI','ACTIVO'),
(6,'NUIP','UN','ACTIVO'),
(7,'OTROS DOCUMENTOS','OD','ACTIVO'),
(8,'PASAPORTE','PA','ACTIVO'),
(9,'PERMISO ESPECIAL DE PERMANENCIA (P.E.P)','PE','ACTIVO'),
(10,'PERMISO POR PROTECCION TEMPORAL','PT','ACTIVO'),
(11,'REGISTRO CIVIL','RC','ACTIVO'),
(12,'SALVO CONDUCTO','SC','ACTIVO'),
(13,'SIN DOCUMENTO','SD','ACTIVO'),
(14,'TARJETA DE EXTRANJERIA','TE','ACTIVO'),
(15,'TARJETA DE IDENTIDAD','TI','ACTIVO');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_evento`
--

DROP TABLE IF EXISTS `tipo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evento` (
  `id_tipo_evento` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_evento`
--

LOCK TABLES `tipo_evento` WRITE;
/*!40000 ALTER TABLE `tipo_evento` DISABLE KEYS */;
INSERT INTO `tipo_evento` VALUES
(1,'EVENTO',''),
(2,'CAPACITACIÓN','ACTIVO');
/*!40000 ALTER TABLE `tipo_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `perfil` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES
(1,'YERSON CARMONA','YERSON.CARMONA@COMFANORTE.COM.CO','083ccfda7f438790f114630d0f08bcd9','ADMINISTRADOR','ACTIVO');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'intranet_comfanorte'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-09-25 11:26:44
