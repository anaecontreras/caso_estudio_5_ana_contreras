/*
 Navicat Premium Dump SQL

 Source Server         : PostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 170003 (170003)
 Source Host           : localhost:5432
 Source Catalog        : rutas_seguras
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170003 (170003)
 File Encoding         : 65001

 Date: 21/02/2025 15:17:53
*/


-- ----------------------------
-- Sequence structure for asignacion_conductor_vehiculo_id_asignacion_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."asignacion_conductor_vehiculo_id_asignacion_seq";
CREATE SEQUENCE "public"."asignacion_conductor_vehiculo_id_asignacion_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for combustible_id_combustible_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."combustible_id_combustible_seq";
CREATE SEQUENCE "public"."combustible_id_combustible_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for mantenimiento_id_mantenimiento_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mantenimiento_id_mantenimiento_seq";
CREATE SEQUENCE "public"."mantenimiento_id_mantenimiento_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for neumatico_id_neumatico_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."neumatico_id_neumatico_seq";
CREATE SEQUENCE "public"."neumatico_id_neumatico_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ruta_id_ruta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ruta_id_ruta_seq";
CREATE SEQUENCE "public"."ruta_id_ruta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seguro_id_seguro_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seguro_id_seguro_seq";
CREATE SEQUENCE "public"."seguro_id_seguro_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for asignacion_conductor_vehiculo
-- ----------------------------
DROP TABLE IF EXISTS "public"."asignacion_conductor_vehiculo";
CREATE TABLE "public"."asignacion_conductor_vehiculo" (
  "id_asignacion" int4 NOT NULL DEFAULT nextval('asignacion_conductor_vehiculo_id_asignacion_seq'::regclass),
  "matricula" varchar(10) COLLATE "pg_catalog"."default",
  "dni_nie" varchar(15) COLLATE "pg_catalog"."default",
  "fechaasignacion" date
)
;

-- ----------------------------
-- Table structure for combustible
-- ----------------------------
DROP TABLE IF EXISTS "public"."combustible";
CREATE TABLE "public"."combustible" (
  "id_combustible" int4 NOT NULL DEFAULT nextval('combustible_id_combustible_seq'::regclass),
  "matricula" varchar(10) COLLATE "pg_catalog"."default",
  "fecha" date,
  "cantidad" numeric(10,2),
  "costo" numeric(10,2),
  "lugarcarga" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for conductor
-- ----------------------------
DROP TABLE IF EXISTS "public"."conductor";
CREATE TABLE "public"."conductor" (
  "dni_nie" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar(50) COLLATE "pg_catalog"."default",
  "apellidos" varchar(50) COLLATE "pg_catalog"."default",
  "numerolicencia" varchar(20) COLLATE "pg_catalog"."default",
  "fechacaducidadlicencia" date,
  "historialconduccion" text COLLATE "pg_catalog"."default",
  "informacioncontacto" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for mantenimiento
-- ----------------------------
DROP TABLE IF EXISTS "public"."mantenimiento";
CREATE TABLE "public"."mantenimiento" (
  "id_mantenimiento" int4 NOT NULL DEFAULT nextval('mantenimiento_id_mantenimiento_seq'::regclass),
  "matricula" varchar(10) COLLATE "pg_catalog"."default",
  "tipomantenimiento" varchar(50) COLLATE "pg_catalog"."default",
  "fechainicio" date,
  "fechafin" date,
  "taller" varchar(100) COLLATE "pg_catalog"."default",
  "costo" numeric(10,2),
  "descripcion" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for neumatico
-- ----------------------------
DROP TABLE IF EXISTS "public"."neumatico";
CREATE TABLE "public"."neumatico" (
  "id_neumatico" int4 NOT NULL DEFAULT nextval('neumatico_id_neumatico_seq'::regclass),
  "matricula" varchar(10) COLLATE "pg_catalog"."default",
  "posicion" varchar(20) COLLATE "pg_catalog"."default",
  "fechainstalacion" date,
  "kilometrajeactual" numeric(10,2),
  "estado" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ruta
-- ----------------------------
DROP TABLE IF EXISTS "public"."ruta";
CREATE TABLE "public"."ruta" (
  "id_ruta" int4 NOT NULL DEFAULT nextval('ruta_id_ruta_seq'::regclass),
  "origen" varchar(100) COLLATE "pg_catalog"."default",
  "destino" varchar(100) COLLATE "pg_catalog"."default",
  "distancia" numeric(10,2),
  "tiempoestimadoviaje" interval(6),
  "estado" varchar(20) COLLATE "pg_catalog"."default",
  "fechainicio" date,
  "fechafin" date,
  "matricula" varchar(10) COLLATE "pg_catalog"."default",
  "dni_nie" varchar(15) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for seguro
-- ----------------------------
DROP TABLE IF EXISTS "public"."seguro";
CREATE TABLE "public"."seguro" (
  "id_seguro" int4 NOT NULL DEFAULT nextval('seguro_id_seguro_seq'::regclass),
  "matricula" varchar(10) COLLATE "pg_catalog"."default",
  "poliza" varchar(50) COLLATE "pg_catalog"."default",
  "fechavencimiento" date,
  "companiaaseguradora" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for vehiculo
-- ----------------------------
DROP TABLE IF EXISTS "public"."vehiculo";
CREATE TABLE "public"."vehiculo" (
  "matricula" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "marca" varchar(50) COLLATE "pg_catalog"."default",
  "modelo" varchar(50) COLLATE "pg_catalog"."default",
  "tipo" varchar(20) COLLATE "pg_catalog"."default",
  "anofabricacion" int4,
  "kilometraje" numeric(10,2),
  "capacidadcarga" numeric(10,2),
  "fechaultimarevision" date,
  "estado" varchar(20) COLLATE "pg_catalog"."default",
  "consumocombustible" numeric(5,2)
)
;

-- ----------------------------
-- View structure for vista_rendimiento_vehiculos
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_rendimiento_vehiculos";
CREATE VIEW "public"."vista_rendimiento_vehiculos" AS  SELECT matricula,
    marca,
    modelo,
    tipo,
    kilometraje,
    consumocombustible,
    estado,
    fechaultimarevision
   FROM vehiculo;

-- ----------------------------
-- View structure for vista_conductores_licencia_proxima
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_conductores_licencia_proxima";
CREATE VIEW "public"."vista_conductores_licencia_proxima" AS  SELECT dni_nie,
    nombre,
    apellidos,
    numerolicencia,
    fechacaducidadlicencia
   FROM conductor
  WHERE fechacaducidadlicencia <= (CURRENT_DATE + '30 days'::interval);

-- ----------------------------
-- View structure for vista_rutas_completadas_por_conductor
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_rutas_completadas_por_conductor";
CREATE VIEW "public"."vista_rutas_completadas_por_conductor" AS  SELECT r.id_ruta,
    (c.nombre::text || ' '::text) || c.apellidos::text AS nombrecompletoconductor,
    r.origen,
    r.destino,
    r.fechainicio,
    r.fechafin
   FROM ruta r
     JOIN conductor c ON r.dni_nie::text = c.dni_nie::text
  WHERE r.estado::text = 'completada'::text;

-- ----------------------------
-- View structure for vista_costos_mantenimiento_por_vehiculo
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_costos_mantenimiento_por_vehiculo";
CREATE VIEW "public"."vista_costos_mantenimiento_por_vehiculo" AS  SELECT m.matricula,
    v.marca,
    v.modelo,
    sum(m.costo) AS costototalmantenimiento
   FROM mantenimiento m
     JOIN vehiculo v ON m.matricula::text = v.matricula::text
  GROUP BY m.matricula, v.marca, v.modelo;

-- ----------------------------
-- View structure for vista_consumo_combustible_por_vehiculo
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_consumo_combustible_por_vehiculo";
CREATE VIEW "public"."vista_consumo_combustible_por_vehiculo" AS  SELECT c.matricula,
    v.marca,
    v.modelo,
    sum(c.cantidad) AS totalcombustibleconsumido,
    sum(c.costo) AS costototalcombustible
   FROM combustible c
     JOIN vehiculo v ON c.matricula::text = v.matricula::text
  GROUP BY c.matricula, v.marca, v.modelo;

-- ----------------------------
-- View structure for vista_neumaticos_desgastados
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_neumaticos_desgastados";
CREATE VIEW "public"."vista_neumaticos_desgastados" AS  SELECT n.id_neumatico,
    n.matricula,
    (v.marca::text || ' '::text) || v.modelo::text AS vehiculo,
    n.posicion,
    n.kilometrajeactual,
    n.estado
   FROM neumatico n
     JOIN vehiculo v ON n.matricula::text = v.matricula::text
  WHERE n.estado::text = 'desgastado'::text;

-- ----------------------------
-- View structure for vista_seguros_proximos_a_vencer
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_seguros_proximos_a_vencer";
CREATE VIEW "public"."vista_seguros_proximos_a_vencer" AS  SELECT s.id_seguro,
    s.matricula,
    (v.marca::text || ' '::text) || v.modelo::text AS vehiculo,
    s.poliza,
    s.fechavencimiento,
    s.companiaaseguradora
   FROM seguro s
     JOIN vehiculo v ON s.matricula::text = v.matricula::text
  WHERE s.fechavencimiento <= (CURRENT_DATE + '30 days'::interval);

-- ----------------------------
-- View structure for vista_asignaciones_actuales
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_asignaciones_actuales";
CREATE VIEW "public"."vista_asignaciones_actuales" AS  SELECT acv.id_asignacion,
    acv.matricula,
    (v.marca::text || ' '::text) || v.modelo::text AS vehiculo,
    acv.dni_nie,
    (c.nombre::text || ' '::text) || c.apellidos::text AS nombrecompletoconductor,
    acv.fechaasignacion
   FROM asignacion_conductor_vehiculo acv
     JOIN vehiculo v ON acv.matricula::text = v.matricula::text
     JOIN conductor c ON acv.dni_nie::text = c.dni_nie::text
  WHERE acv.fechaasignacion >= (CURRENT_DATE - '30 days'::interval);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."asignacion_conductor_vehiculo_id_asignacion_seq"
OWNED BY "public"."asignacion_conductor_vehiculo"."id_asignacion";
SELECT setval('"public"."asignacion_conductor_vehiculo_id_asignacion_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."combustible_id_combustible_seq"
OWNED BY "public"."combustible"."id_combustible";
SELECT setval('"public"."combustible_id_combustible_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mantenimiento_id_mantenimiento_seq"
OWNED BY "public"."mantenimiento"."id_mantenimiento";
SELECT setval('"public"."mantenimiento_id_mantenimiento_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."neumatico_id_neumatico_seq"
OWNED BY "public"."neumatico"."id_neumatico";
SELECT setval('"public"."neumatico_id_neumatico_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ruta_id_ruta_seq"
OWNED BY "public"."ruta"."id_ruta";
SELECT setval('"public"."ruta_id_ruta_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."seguro_id_seguro_seq"
OWNED BY "public"."seguro"."id_seguro";
SELECT setval('"public"."seguro_id_seguro_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table asignacion_conductor_vehiculo
-- ----------------------------
ALTER TABLE "public"."asignacion_conductor_vehiculo" ADD CONSTRAINT "asignacion_conductor_vehiculo_pkey" PRIMARY KEY ("id_asignacion");

-- ----------------------------
-- Indexes structure for table combustible
-- ----------------------------
CREATE INDEX "idx_combustible_matricula_fecha" ON "public"."combustible" USING btree (
  "matricula" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "fecha" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table combustible
-- ----------------------------
ALTER TABLE "public"."combustible" ADD CONSTRAINT "combustible_pkey" PRIMARY KEY ("id_combustible");

-- ----------------------------
-- Indexes structure for table conductor
-- ----------------------------
CREATE INDEX "idx_conductor_fecha_caducidad" ON "public"."conductor" USING btree (
  "fechacaducidadlicencia" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_conductor_nombre_apellidos" ON "public"."conductor" USING btree (
  "nombre" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "apellidos" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table conductor
-- ----------------------------
ALTER TABLE "public"."conductor" ADD CONSTRAINT "conductor_pkey" PRIMARY KEY ("dni_nie");

-- ----------------------------
-- Indexes structure for table mantenimiento
-- ----------------------------
CREATE INDEX "idx_mantenimiento_fecha_inicio" ON "public"."mantenimiento" USING btree (
  "fechainicio" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_mantenimiento_matricula" ON "public"."mantenimiento" USING btree (
  "matricula" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table mantenimiento
-- ----------------------------
ALTER TABLE "public"."mantenimiento" ADD CONSTRAINT "mantenimiento_pkey" PRIMARY KEY ("id_mantenimiento");

-- ----------------------------
-- Indexes structure for table neumatico
-- ----------------------------
CREATE INDEX "idx_neumatico_matricula_estado" ON "public"."neumatico" USING btree (
  "matricula" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "estado" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table neumatico
-- ----------------------------
ALTER TABLE "public"."neumatico" ADD CONSTRAINT "neumatico_pkey" PRIMARY KEY ("id_neumatico");

-- ----------------------------
-- Indexes structure for table ruta
-- ----------------------------
CREATE INDEX "idx_ruta_estado" ON "public"."ruta" USING btree (
  "estado" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_ruta_origen_destino" ON "public"."ruta" USING btree (
  "origen" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "destino" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ruta
-- ----------------------------
ALTER TABLE "public"."ruta" ADD CONSTRAINT "ruta_pkey" PRIMARY KEY ("id_ruta");

-- ----------------------------
-- Indexes structure for table seguro
-- ----------------------------
CREATE INDEX "idx_seguro_fecha_vencimiento" ON "public"."seguro" USING btree (
  "fechavencimiento" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table seguro
-- ----------------------------
ALTER TABLE "public"."seguro" ADD CONSTRAINT "seguro_matricula_key" UNIQUE ("matricula");

-- ----------------------------
-- Primary Key structure for table seguro
-- ----------------------------
ALTER TABLE "public"."seguro" ADD CONSTRAINT "seguro_pkey" PRIMARY KEY ("id_seguro");

-- ----------------------------
-- Indexes structure for table vehiculo
-- ----------------------------
CREATE INDEX "idx_vehiculo_estado" ON "public"."vehiculo" USING btree (
  "estado" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_vehiculo_kilometraje" ON "public"."vehiculo" USING btree (
  "kilometraje" "pg_catalog"."numeric_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table vehiculo
-- ----------------------------
ALTER TABLE "public"."vehiculo" ADD CONSTRAINT "vehiculo_pkey" PRIMARY KEY ("matricula");

-- ----------------------------
-- Foreign Keys structure for table asignacion_conductor_vehiculo
-- ----------------------------
ALTER TABLE "public"."asignacion_conductor_vehiculo" ADD CONSTRAINT "asignacion_conductor_vehiculo_dni_nie_fkey" FOREIGN KEY ("dni_nie") REFERENCES "public"."conductor" ("dni_nie") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."asignacion_conductor_vehiculo" ADD CONSTRAINT "asignacion_conductor_vehiculo_matricula_fkey" FOREIGN KEY ("matricula") REFERENCES "public"."vehiculo" ("matricula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table combustible
-- ----------------------------
ALTER TABLE "public"."combustible" ADD CONSTRAINT "combustible_matricula_fkey" FOREIGN KEY ("matricula") REFERENCES "public"."vehiculo" ("matricula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table mantenimiento
-- ----------------------------
ALTER TABLE "public"."mantenimiento" ADD CONSTRAINT "mantenimiento_matricula_fkey" FOREIGN KEY ("matricula") REFERENCES "public"."vehiculo" ("matricula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table neumatico
-- ----------------------------
ALTER TABLE "public"."neumatico" ADD CONSTRAINT "neumatico_matricula_fkey" FOREIGN KEY ("matricula") REFERENCES "public"."vehiculo" ("matricula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ruta
-- ----------------------------
ALTER TABLE "public"."ruta" ADD CONSTRAINT "ruta_dni_nie_fkey" FOREIGN KEY ("dni_nie") REFERENCES "public"."conductor" ("dni_nie") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."ruta" ADD CONSTRAINT "ruta_matricula_fkey" FOREIGN KEY ("matricula") REFERENCES "public"."vehiculo" ("matricula") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table seguro
-- ----------------------------
ALTER TABLE "public"."seguro" ADD CONSTRAINT "seguro_matricula_fkey" FOREIGN KEY ("matricula") REFERENCES "public"."vehiculo" ("matricula") ON DELETE CASCADE ON UPDATE NO ACTION;
