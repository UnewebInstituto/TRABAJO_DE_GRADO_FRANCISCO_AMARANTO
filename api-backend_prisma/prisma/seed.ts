import 'dotenv/config'
import { PrismaClient } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'
import { Pool } from 'pg'

const connectionString = `${process.env.DATABASE_URL}`.trim();

const pool = new Pool({ connectionString })
const adapter = new PrismaPg(pool)
const prisma = new PrismaClient({ adapter })

async function main() {
  const cargos = [
    {
      nombre: 'Analista comercial de almacen I',
      descripcion: 'Analista comercial de almacen I',
      fecha_hora_creacion: new Date(),
      fecha_hora_actualizacion: new Date(),
    },
    {
      nombre: 'Supervisor de almacen',
      descripcion: 'Supervisor de almacen',
      fecha_hora_creacion: new Date(),
      fecha_hora_actualizacion: new Date(),
    },
  ];

  console.log('Sembrando tabla de cargos...');

  for (const cargo of cargos) {
    await prisma.cargo.upsert({
      where: { nombre: cargo.nombre }, // Asumiendo que 'nombre' es único en tu schema
      update: {}, // No actualiza nada si ya existe
      create: cargo,
    });
  }

  console.log('Sembrado de cargos finalizado.');
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })