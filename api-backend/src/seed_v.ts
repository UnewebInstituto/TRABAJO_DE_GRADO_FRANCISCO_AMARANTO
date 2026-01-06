import { pool } from './db.js';

async function seed() {
  const client = await pool.connect();
  try {
    const query = `
      INSERT INTO cargos (nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion)
      VALUES ($1, $2, NOW(), NOW())
      ON CONFLICT (nombre) DO UPDATE SET fecha_hora_actualizacion = NOW();
    `;

    await client.query(query, ['Analista comercial de almacen II', 'Analista comercial de almacen II']);
    await client.query(query, ['Supervisor de almacen I', 'Supervisor de almacen I']);

    console.log('🚀 Sembrado completado con éxito');
  } catch (err) {
    console.error('❌ Error en el sembrado:', err);
  } finally {
    client.release();
    process.exit();
  }
}

seed();