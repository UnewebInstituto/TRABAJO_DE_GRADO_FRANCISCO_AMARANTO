import express from 'express';
import cors from 'cors';
import crypto from 'crypto';
import { pool } from './db.js';

const app = express();
app.use(cors());
app.use(express.json());

app.post('/api/login', async (req, res) => {
  const { cedula, clave } = req.body;

  if (!cedula || !clave) {
    return res.status(400).json({ error: 'Cédula y clave son requeridas' });
  }

  try {
    // Generar hash MD5 para comparar con la base de datos
    const claveHash = crypto.createHash('md5').update(clave).digest('hex');

    // Consulta que une usuarios, cargos y estatus
    const query = `
      SELECT u.id, u.cedula, u.nombres, u.apellidos, u.correo_electronico, 
             c.nombre as cargo, e.nombre as estatus
      FROM public.usuarios u
      JOIN public.cargos c ON u.cargo_id = c.id
      JOIN public.estatus e ON u.estatus_id = e.id
      WHERE u.cedula = $1 AND u.clave = $2 AND e.nombre = 'Activo'
    `;

    const result = await pool.query(query, [cedula, claveHash]);

    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'Credenciales inválidas o usuario inactivo' });
    }

    res.json({
      message: 'Bienvenido a Incidencias',
      usuario: result.rows[0]
    });

  } catch (error) {
    console.error('Error en el servidor:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});


// Endpoint para obtener todas las áreas de incidencia
app.get('/api/areas', async (req, res) => {
  try {
    const query = `
      SELECT id, nombre, descripcion 
      FROM public.areas_de_incidencias 
      ORDER BY nombre ASC
    `;
    
    const result = await pool.query(query);
    
    res.json({
      total: result.rowCount,
      areas: result.rows
    });
  } catch (error) {
    console.error('Error al consultar áreas:', error);
    res.status(500).json({ error: 'Error interno al obtener las áreas' });
  }
});

// Endpoint para obtener tipos de incidencia (opcionalmente filtrados por área)
app.get('/api/tipos-incidencias', async (req, res) => {
  const { area_id } = req.query;

  try {
    let query = `
      SELECT t.id, t.nombre, t.descripcion, t.area_id, a.nombre as nombre_area
      FROM public.tipos_de_incidencias t
      JOIN public.areas_de_incidencias a ON t.area_id = a.id
    `;
    const params = [];

    if (area_id) {
      query += ` WHERE t.area_id = $1`;
      params.push(area_id);
    }

    query += ` ORDER BY t.nombre ASC`;

    const result = await pool.query(query, params);

    res.json({
      total: result.rowCount,
      tipos: result.rows
    });
  } catch (error) {
    console.error('Error al consultar tipos de incidencia:', error);
    res.status(500).json({ error: 'Error interno al obtener los tipos de incidencia' });
  }
});


const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🚀 API de Incidencias lista en http://localhost:${PORT}`);
});