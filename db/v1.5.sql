CREATE TABLE "agenda_usuario" (
  "id" int4 NOT NULL,
  "id_servicio" int4 NOT NULL,
  "id_cliente_agenda" int4,
  "id_venta" int4,
  "fecha_reservada" date,
  PRIMARY KEY ("id")
);

CREATE TABLE "categoria" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "cliente_eshop" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) NOT NULL,
  "correo" varchar(255) NOT NULL,
  "direccion" varchar(255) NOT NULL,
  "tcredito" varchar(255),
  "monedero" int4,
  PRIMARY KEY ("id")
);

CREATE TABLE "clientes_agenda" (
  "id" int4 NOT NULL,
  "nombre" varchar(255),
  "correo" varchar(255),
  "direccion" varchar(255),
  "tajeta_credito" varchar(255),
  PRIMARY KEY ("id")
);

CREATE TABLE "inventario" (
  "id" int4 NOT NULL,
  "id_eshop" int4 NOT NULL,
  "id_producto" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "pago" (
  "id" int4 NOT NULL,
  "id_usuario" int4 NOT NULL,
  "id_servicio" int4 NOT NULL,
  "fecha" date NOT NULL,
  "monto" int4 NOT NULL,
  "pagado" bool NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "perfil" (
  "id" int4 NOT NULL,
  "descripcion" varchar NOT NULL,
  "grado" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "producto" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) NOT NULL,
  "descripcion" varchar(255) NOT NULL,
  "precio" int4 NOT NULL,
  "stock" int4 NOT NULL,
  "id_categoria" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "servicio" (
  "id" int4 NOT NULL,
  "nombre" varchar,
  "descripcion" varchar,
  "costo" int4,
  "habilitado" bool,
  PRIMARY KEY ("id")
);

CREATE TABLE "sistema" (
  "id" int4 NOT NULL,
  "id_usuario" int4,
  "id_sistema_especifico" varchar(255),
  "fecha_inicio" timestamp NOT NULL,
  "fecha_fin" timestamp NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "sistema_agenda" (
  "id" int4 NOT NULL,
  "id_tematica" int4 NOT NULL,
  "id_agenda_usuario" int4 NOT NULL,
  "nombre" varchar NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "sistema_eshop" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) NOT NULL,
  "id_tematica" int4 NOT NULL,
  "id_productos" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "sistema_especifico" (
  "id" int4 NOT NULL,
  "id_sistema" int4 NOT NULL,
  "id_especifico" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "tematica" (
  "id" int4 NOT NULL,
  "descripcion" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "usuario" (
  "id" int4 NOT NULL,
  "correo" varchar(255) NOT NULL,
  "contrasena" varchar(255) NOT NULL,
  "habilitado" bool NOT NULL,
  "es_premium" bool NOT NULL,
  "id_perfil" int4 NOT NULL,
  "id_usu_sist" int4 NOT NULL,
  "monedero" int4,
  PRIMARY KEY ("id")
);
COMMENT ON COLUMN "usuario"."id_usu_sist" IS 'Foreign
';

CREATE TABLE "usuario_sistema" (
  "id" int4 NOT NULL,
  "id_usuario" int4 NOT NULL,
  "id_sistema" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "venta_agenda" (
  "id" int4 NOT NULL,
  "id_pago" int4,
  "id_cliente_agenda" int4,
  "id_servicio" int4,
  "abono" int4,
  PRIMARY KEY ("id")
);

CREATE TABLE "venta_eshop" (
  "id" int4 NOT NULL,
  "id_cliente_eshop" int4 NOT NULL,
  "id_producto" int4 NOT NULL,
  "cantidad" int4 NOT NULL,
  "id_pago" int4 NOT NULL,
  PRIMARY KEY ("id")
);

ALTER TABLE "agenda_usuario" ADD CONSTRAINT "fk_agenda_usuario_servicio_1" FOREIGN KEY ("id_servicio") REFERENCES "servicio" ("id");
ALTER TABLE "agenda_usuario" ADD CONSTRAINT "fk_agenda_usuario_clientes_agenda_1" FOREIGN KEY ("id_cliente_agenda") REFERENCES "clientes_agenda" ("id");
ALTER TABLE "inventario" ADD CONSTRAINT "fk_tienda_invent" FOREIGN KEY ("id_eshop") REFERENCES "sistema_eshop" ("id") ON DELETE CASCADE;
ALTER TABLE "inventario" ADD CONSTRAINT "fk_producto_invent" FOREIGN KEY ("id_producto") REFERENCES "producto" ("id") ON DELETE CASCADE;
ALTER TABLE "producto" ADD CONSTRAINT "fk_categoria_prod" FOREIGN KEY ("id_categoria") REFERENCES "categoria" ("id") ON DELETE CASCADE;
ALTER TABLE "sistema_agenda" ADD CONSTRAINT "fk_tematica_agenda" FOREIGN KEY ("id_tematica") REFERENCES "tematica" ("id") ON DELETE CASCADE;
ALTER TABLE "sistema_agenda" ADD CONSTRAINT "fk_agenda_sistema" FOREIGN KEY ("id_agenda_usuario") REFERENCES "agenda_usuario" ("id") ON DELETE CASCADE;
ALTER TABLE "sistema_agenda" ADD CONSTRAINT "fk_sistema_agenda_sistema_especifico_1" FOREIGN KEY ("id") REFERENCES "sistema_especifico" ("id");
ALTER TABLE "sistema_eshop" ADD CONSTRAINT "fk_tematica_eshop" FOREIGN KEY ("id_tematica") REFERENCES "tematica" ("id") ON DELETE CASCADE;
ALTER TABLE "sistema_especifico" ADD CONSTRAINT "fk_sistema_especifico_sistema_especifico_1" FOREIGN KEY ("id") REFERENCES "sistema" ("id_sistema_especifico") ON DELETE CASCADE;
ALTER TABLE "sistema_especifico" ADD CONSTRAINT "fk_sistema_especifico_sistema_eshop_1" FOREIGN KEY ("id") REFERENCES "sistema_eshop" ("id");
ALTER TABLE "sistema_especifico" ADD CONSTRAINT "fk_sistema_especifico_sistema_1" FOREIGN KEY ("id") REFERENCES "sistema" ("id_sistema_especifico");
ALTER TABLE "usuario" ADD CONSTRAINT "fk_perfil_usuario" FOREIGN KEY ("id_perfil") REFERENCES "perfil" ("id") ON DELETE CASCADE;
ALTER TABLE "usuario_sistema" ADD CONSTRAINT "fk_usuario_sistema" FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id") ON DELETE CASCADE;
ALTER TABLE "usuario_sistema" ADD CONSTRAINT "fk_sistema_usuario" FOREIGN KEY ("id_sistema") REFERENCES "sistema" ("id") ON DELETE CASCADE;
ALTER TABLE "venta_agenda" ADD CONSTRAINT "fk_venta_agenda_agenda_usuario_1" FOREIGN KEY ("id") REFERENCES "agenda_usuario" ("id_venta");
ALTER TABLE "venta_agenda" ADD CONSTRAINT "fk_venta_agenda_pago_1" FOREIGN KEY ("id_pago") REFERENCES "pago" ("id");
ALTER TABLE "venta_eshop" ADD CONSTRAINT "fk_cliente_venta" FOREIGN KEY ("id_cliente_eshop") REFERENCES "cliente_eshop" ("id") ON DELETE CASCADE;
ALTER TABLE "venta_eshop" ADD CONSTRAINT "fk_producto_venta" FOREIGN KEY ("id_producto") REFERENCES "producto" ("id") ON DELETE CASCADE;
ALTER TABLE "venta_eshop" ADD CONSTRAINT "fk_pago_venta" FOREIGN KEY ("id_pago") REFERENCES "pago" ("id") ON DELETE CASCADE;

