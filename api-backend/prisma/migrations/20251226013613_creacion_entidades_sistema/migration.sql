-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "cedula" VARCHAR(10),
    "nombres" VARCHAR(255),
    "apellidos" VARCHAR(255),
    "correo_electronico" VARCHAR(255),
    "telefono" VARCHAR(255),
    "clave" VARCHAR(255),
    "cargo_id" INTEGER,
    "estatus_id" INTEGER,
    "fecha_hora_creacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "fecha_hora_actualizacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cargos" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(255),
    "descripcion" VARCHAR(255),
    "fecha_hora_creacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "fecha_hora_actualizacion" TIME(6),

    CONSTRAINT "cargos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "estatus" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(255),
    "descripcion" VARCHAR(255),
    "fecha_hora_creacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "fecha_hora_actaulizacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "estatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "areas_de_incidencia" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(255),
    "descripcion" VARCHAR(255),
    "fecha_hora_creacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "fecha_hora_actualizacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "areas_de_incidencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipos_de_incidencia" (
    "id" SERIAL NOT NULL,
    "area_id" INTEGER,
    "nombre" VARCHAR(255),
    "descripcion" VARCHAR(255),
    "fecha_hora_creacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "fecha_hora_actualizacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tipos_de_incidencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "incidencias" (
    "id" SERIAL NOT NULL,
    "tipo_id" INTEGER,
    "usuario_id" INTEGER,
    "fecha_hora_creacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "fecha_hora_actualizacion" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "incidencias_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_estatus_id_fkey" FOREIGN KEY ("estatus_id") REFERENCES "estatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tipos_de_incidencia" ADD CONSTRAINT "tipos_de_incidencia_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "areas_de_incidencia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "incidencias" ADD CONSTRAINT "incidencias_tipo_id_fkey" FOREIGN KEY ("tipo_id") REFERENCES "tipos_de_incidencia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "incidencias" ADD CONSTRAINT "incidencias_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;
