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
        `INSERT INTO areas_de_incidencia (nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES ($1, $2, NOW(), NOW()) ON CONFLICT (nombre) DO NOTHING`, [nom, desc]
      );
    }
    console.log('✅ Áreas de incidencia procesadas');

    // 4. SEMBRADO DE TIPOS DE INCIDENCIA (Relacionados por nombre de área)
    const tipos = [
      ['Transporte primario', 'Productos con faltante', 'Faltantes de cajas o unidades'],
      ['Transporte primario', 'Productos con sobrante', 'Sobrantes de cajas'],
      ['Pulmón', 'Error de almacenaje', 'Incumplimiento del FIFO'],
      ['Picking', 'Inversión', 'Productos no correspondientes a la guía'],
      ['Facturación', 'Saltos de correlativo', 'Fuera de secuencia número de factura']
      // ... puedes agregar el resto de la lista de tus archivos SQL aquí siguiendo el mismo formato
    ];
    for (const [areaNom, nom, desc] of tipos) {
      await client.query(
        `INSERT INTO tipos_de_incidencia (area_id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
         SELECT id, $2, $3, NOW(), NOW() FROM areas_de_incidencia WHERE nombre = $1
         ON CONFLICT DO NOTHING`, [areaNom, nom, desc]
      );
    }
    console.log('✅ Tipos de incidencia procesados');

    // 5. SEMBRADO DE USUARIOS
    const usuarios = [
      ['V12345678','ANA MARIA','VASQUEZ PEREZ','av@correo.com','+5841412345678'],
      ['V22345678','YOLANDA MARIA','TORTOZA DIAZ','yt@correo.com','+5841223456789']
    ];
    for (const [ced, nom, ape, mail, tel] of usuarios) {
      await client.query(
        `INSERT INTO usuarios (cedula, nombres, apellidos, correo_electronico, telefono, clave, cargo_id, estatus_id, fecha_hora_creacion, fecha_hora_actualizacion) 
         VALUES ($1, $2, $3, $4, $5, md5($1), 1, 1, NOW(), NOW()) 
         ON CONFLICT (cedula) DO NOTHING`, [ced, nom, ape, mail, tel]
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