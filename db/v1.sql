/*
 Navicat Premium Data Transfer

 Source Server         : Fasto
 Source Server Type    : PostgreSQL
 Source Server Version : 100011
 Source Host           : localhost:5432
 Source Catalog        : Fasto
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100011
 File Encoding         : 65001

 Date: 02/12/2019 17:25:19
*/


-- ----------------------------
-- Table structure for agenda_usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."agenda_usuario";
CREATE TABLE "public"."agenda_usuario" (
  "id" int4 NOT NULL,
  "id_usuario" int4 NOT NULL,
  "id_servicio" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS "public"."categoria";
CREATE TABLE "public"."categoria" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO "public"."categoria" VALUES (1, 'Robots');

-- ----------------------------
-- Table structure for cliente_eshop
-- ----------------------------
DROP TABLE IF EXISTS "public"."cliente_eshop";
CREATE TABLE "public"."cliente_eshop" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "correo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "direccion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tcredito" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for inventario
-- ----------------------------
DROP TABLE IF EXISTS "public"."inventario";
CREATE TABLE "public"."inventario" (
  "id" int4 NOT NULL,
  "id_tienda" int4 NOT NULL,
  "id_producto" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS "public"."pago";
CREATE TABLE "public"."pago" (
  "id" int4 NOT NULL,
  "id_usuario" int4 NOT NULL,
  "id_servicio" int4 NOT NULL,
  "fecha" date NOT NULL,
  "monto" int4 NOT NULL,
  "pagado" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS "public"."perfil";
CREATE TABLE "public"."perfil" (
  "id" int4 NOT NULL,
  "descripcion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "grado" int4 NOT NULL
)
;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO "public"."perfil" VALUES (1, 'SuperAdmin', 0);

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS "public"."producto";
CREATE TABLE "public"."producto" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "precio" int4 NOT NULL,
  "stock" int4 NOT NULL,
  "id_categoria" int4 NOT NULL
)
;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO "public"."producto" VALUES (1, 'Robotin', 'robot de pruebas', 1000, 10, 1);

-- ----------------------------
-- Table structure for sistema
-- ----------------------------
DROP TABLE IF EXISTS "public"."sistema";
CREATE TABLE "public"."sistema" (
  "id" int4 NOT NULL,
  "fecha_inicio" timestamp(6) NOT NULL,
  "fecha_fin" timestamp(6) NOT NULL,
  "id_sistema_especifico" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of sistema
-- ----------------------------
INSERT INTO "public"."sistema" VALUES (1, '2019-12-02 00:00:00', '2099-12-02 00:00:00', '1');

-- ----------------------------
-- Table structure for sistema_agenda
-- ----------------------------
DROP TABLE IF EXISTS "public"."sistema_agenda";
CREATE TABLE "public"."sistema_agenda" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fechas_disponibles" varchar(255) COLLATE "pg_catalog"."default",
  "id_tematica" int4 NOT NULL,
  "id_agenda_usuario" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for sistema_eshop
-- ----------------------------
DROP TABLE IF EXISTS "public"."sistema_eshop";
CREATE TABLE "public"."sistema_eshop" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_tematica" int4 NOT NULL,
  "id_productos" int4 NOT NULL
)
;

-- ----------------------------
-- Records of sistema_eshop
-- ----------------------------
INSERT INTO "public"."sistema_eshop" VALUES (1, 'La tiendita de pruebita', 1, 1);

-- ----------------------------
-- Table structure for table_1
-- ----------------------------
DROP TABLE IF EXISTS "public"."table_1";
CREATE TABLE "public"."table_1" (

)
;

-- ----------------------------
-- Table structure for tematica
-- ----------------------------
DROP TABLE IF EXISTS "public"."tematica";
CREATE TABLE "public"."tematica" (
  "id" int4 NOT NULL,
  "descripcion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of tematica
-- ----------------------------
INSERT INTO "public"."tematica" VALUES (1, 'Robótica');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario";
CREATE TABLE "public"."usuario" (
  "id" int4 NOT NULL,
  "correo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "contrasena" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "habilitado" bool NOT NULL,
  "es_premium" bool NOT NULL,
  "id_perfil" int4 NOT NULL,
  "id_usu_sist" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."usuario"."id_usu_sist" IS 'Foreign
';

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO "public"."usuario" VALUES (1, '1', '1', 't', 't', 1, 1);

-- ----------------------------
-- Table structure for usuario_sistema
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario_sistema";
CREATE TABLE "public"."usuario_sistema" (
  "id" int4 NOT NULL,
  "id_usuario" int4 NOT NULL,
  "id_sistema" int4 NOT NULL
)
;

-- ----------------------------
-- Records of usuario_sistema
-- ----------------------------
INSERT INTO "public"."usuario_sistema" VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for venta_eshop
-- ----------------------------
DROP TABLE IF EXISTS "public"."venta_eshop";
CREATE TABLE "public"."venta_eshop" (
  "id" int4 NOT NULL,
  "id_cliente_eshop" int4 NOT NULL,
  "id_producto" int4 NOT NULL,
  "cantidad" int4 NOT NULL,
  "id_venta" int4 NOT NULL
)
;

-- ----------------------------
-- Primary Key structure for table agenda_usuario
-- ----------------------------
ALTER TABLE "public"."agenda_usuario" ADD CONSTRAINT "agenda_usuario_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table categoria
-- ----------------------------
ALTER TABLE "public"."categoria" ADD CONSTRAINT "categoria_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cliente_eshop
-- ----------------------------
ALTER TABLE "public"."cliente_eshop" ADD CONSTRAINT "cliente_eshop_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table inventario
-- ----------------------------
ALTER TABLE "public"."inventario" ADD CONSTRAINT "inventario_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pago
-- ----------------------------
ALTER TABLE "public"."pago" ADD CONSTRAINT "pago_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table perfil
-- ----------------------------
ALTER TABLE "public"."perfil" ADD CONSTRAINT "perfil_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table producto
-- ----------------------------
ALTER TABLE "public"."producto" ADD CONSTRAINT "producto_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sistema
-- ----------------------------
ALTER TABLE "public"."sistema" ADD CONSTRAINT "sistema_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sistema_agenda
-- ----------------------------
ALTER TABLE "public"."sistema_agenda" ADD CONSTRAINT "sistema_agenda_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sistema_eshop
-- ----------------------------
ALTER TABLE "public"."sistema_eshop" ADD CONSTRAINT "sistema_eshop_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table sistema_eshop
-- ----------------------------
ALTER TABLE "public"."sistema_eshop" ADD CONSTRAINT "fk_tematica_eshop" FOREIGN KEY ("id_tematica") REFERENCES "public"."tematica" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table tematica
-- ----------------------------
ALTER TABLE "public"."tematica" ADD CONSTRAINT "tematica_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD CONSTRAINT "usuario_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD CONSTRAINT "fk_perfil_usuario" FOREIGN KEY ("id_perfil") REFERENCES "public"."perfil" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table usuario_sistema
-- ----------------------------
ALTER TABLE "public"."usuario_sistema" ADD CONSTRAINT "usuario_sistema_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table usuario_sistema
-- ----------------------------
ALTER TABLE "public"."usuario_sistema" ADD CONSTRAINT "fk_sistema_usuario" FOREIGN KEY ("id_sistema") REFERENCES "public"."sistema" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."usuario_sistema" ADD CONSTRAINT "fk_usuario_sistema" FOREIGN KEY ("id_usuario") REFERENCES "public"."usuario" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table venta_eshop
-- ----------------------------
ALTER TABLE "public"."venta_eshop" ADD CONSTRAINT "venta_eshop_pkey" PRIMARY KEY ("id");
