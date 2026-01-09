import pg from 'pg';
import 'dotenv/config';

const { Pool } = pg;
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

async function seed() {
  const client = await pool.connect();
  try {
    console.log('🚀 Iniciando sembrado de datos maestro...');

    // 1. SEMBRADO DE CARGOS
    const cargos = [
      ['Analista comercial de almacen I', 'Analista comercial de almacen I'],
      ['Supervisor de almacen', 'Supervisor de almacen']
    ];
    for (const [nom, desc] of cargos) {
      await client.query(
        `INSERT INTO cargos (nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES ($1, $2, NOW(), NOW()) ON CONFLICT (nombre) DO NOTHING`, [nom, desc]
      );
    }
    console.log('✅ Cargos procesados');

    // 2. SEMBRADO DE ESTATUS
    const estatus = [
      ['Activo', 'Activo en funciones'],
      ['Inactivo', 'Inactivo motivado a permiso, reposo, vacaciones, desvinculación, otros']
    ];
    for (const [nom, desc] of estatus) {
      await client.query(
        `INSERT INTO estatus (nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES ($1, $2, NOW(), NOW()) ON CONFLICT (nombre) DO NOTHING`, [nom, desc]
      );
    }
    console.log('✅ Estatus procesados');

    // 3. SEMBRADO DE ÁREAS DE INCIDENCIA
    const areas = [
      ['Transporte primario', 'Zona de recepción de transporte primario'],
      ['Pulmón', 'Zona de almacenamiento de productos terminados'],
      ['Picking', 'Zona de armado de rutas'],
      ['Patio', 'Zona de recepción de transporte secundario'],
      ['Reempaque', 'Zona de recuperación de productos'],
      ['Facturación', 'Zona de facturación de franquicias y ETS']
    ];
    for (const [nom, desc] of areas) {
      await client.query(
        `INSERT INTO areas_de_incidencias (nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES ($1, $2, NOW(), NOW()) ON CONFLICT (nombre) DO NOTHING`, [nom, desc]
      );
    }
    console.log('✅ Áreas de incidencia procesadas');

    // 4. SEMBRADO DE TIPOS DE INCIDENCIA (Relacionados por nombre de área)
    // Área Id
    // 1 : TRANSPORTE PRIMARIO
    // 2 : PULMÓN
    // 3 : PICKING
    // 4 : PATIO
    // 5 : REEMPAQUE
    // 6 : FACTURACIÓN
    const tipos = [
      [1,'Productos con faltante', 'Faltantes de cajas o unidades'],
      [1,'Productos con sobrante', 'Sobrantes de cajas'],
      [1,'Productos en mal estado', 'Productos deteriorados'],
      [1,'Productos con fecha próxima a vencerse', 'Productos no apto para consumo'],
      [1,'Productos sin fecha de vencimiento', 'Productos con error en el fechado'],
      [1,'Productos con error en la etiqueta', 'Productos mal identificados o sin identificación'],
      [1,'Productos sin tapa', 'Productos sin sello o mal sellado'],
      [1,'Paleta deteriorada', 'Paleta en riesgo'],
      [1,'Gandola no correspondiente al centro logístico', 'Gandola con destino no correspondiente'],
      [1,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación'],
      [2,'Error de almacenaje', 'Incumplimiento del FIFO (primero en entrar primero en salir)'], 
      [2,'Productos con faltante', 'Faltantes de cajas o unidades'],
      [2,'Productos con sobrante', 'Sobrantes de cajas'],
      [2,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación'],
      [3,'Inversión', 'Productos no correspondientes a la guía'],
      [3,'Productos con fechas de consumo no correspondientes', 'Productos con fechas más nuevas que en el pulmón'],
      [3,'Resto que supera altura límite', 'Productos con fechas más nuevas que en el pulmón'],
      [3,'Transpaleta con falla', 'Transpaleta inoperativo'],
      [3,'Montacarga con falla', 'Montacarga inoperativo'],
      [3,'Productos con faltante', 'Faltantes de cajas o unidades'],
      [3,'Productos con sobrante', 'Sobrantes de cajas'],
      [3,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación'],
      [4,'Mala recepción de vacíos', 'Error en conteo'],
      [4,'Paleta deterioriada', 'Paleta no apta para traslado'],
      [4,'Paleta con basura', 'Paleta con desechos incrustados'],
      [4,'Devolución por productos vencidos', 'Productos no conforme'],
      [4,'Productos con faltante', 'Faltantes de cajas o unidades'],
      [4,'Productos con sobrante', 'Sobrantes de cajas'],
      [4,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación'],
      [5,'Productos vencidos', 'Productos no conforme'],
      [5,'Productos con faltante', 'Faltantes de cajas o unidades'],
      [5,'Productos con sobrante', 'Sobrantes de cajas'],
      [5,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación'],
      [6,'Saltos de correlativo', 'Fuera de secuencia número de factura'],
      [6,'Error en placa vehículo ETS o Franquicia', 'Número de placa no correspondiente al vehículo'],
      [6,'Error en pedido', 'Despacho no acorde al pedido del cliente'],
      [6,'Obsequio sin presupuesto', 'Ausencia de fondos en cuenta de obsequios para ser facturado']
    ];
    for (const [areaId, nom, desc] of tipos) {
      await client.query(
        `INSERT INTO tipos_de_incidencias (area_id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES  ($1, $2, $3, NOW(), NOW())`, [areaId, nom, desc]
      );
    }
    console.log('✅ Tipos de incidencia procesados');

    // 5. SEMBRADO DE USUARIOS
    const usuarios = [
      ['V12345678','ANA MARIA','VASQUEZ PEREZ','av@correo.com','+5841412345678',1,1],
      ['V22345678','YOLANDA MARIA','TORTOZA DIAZ','yt@correo.com','+5841223456789',2,1]
    ];
    for (const [ced, nom, ape, mail, tel, cargoId, estatusId] of usuarios) {
      await client.query(
        `INSERT INTO usuarios (cedula, nombres, apellidos, correo_electronico, telefono, clave, cargo_id, estatus_id, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES ($1::text, $2::text, $3::text, $4::text, $5::text, md5($1::text), $6, $7, NOW(), NOW())`, [ced, nom, ape, mail, tel, cargoId, estatusId]
      );
    }
    console.log('✅ Usuarios iniciales procesados');

    console.log('🚀 Sembrado finalizado con éxito');
  } catch (err) {
    console.error('❌ Error crítico en el sembrado:', err);
  } finally {
    client.release();
    await pool.end();
  }
}

seed();