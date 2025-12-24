insert into tipos_de_incidencia(area_id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) 
VALUES
-- TRANSPORTE PRIMARIO
(1,'Productos con faltante', 'Faltantes de cajas o unidades', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Productos con sobrante', 'Sobrantes de cajas', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Productos en mal estado', 'Productos deteriorados', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Productos con fecha próxima a vencerse', 'Productos no apto para consumo', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Productos sin fecha de vencimiento', 'Productos con error en el fechado', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Productos con error en la etiqueta', 'Productos mal identificados o sin identificación', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Productos sin tapa', 'Productos sin sello o mal sellado', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Paleta deteriorada', 'Paleta en riesgo', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Gandola no correspondiente al centro logístico', 'Gandola con destino no correspondiente', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(1,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
-- PULMÓN
(2,'Error de almacenaje', 'Incumplimiento del FIFO (primero en entrar primero en salir)', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(2,'Productos con faltante', 'Faltantes de cajas o unidades', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(2,'Productos con sobrante', 'Sobrantes de cajas', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(2,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
-- PICKING
(3,'Inversión', 'Productos no correspondientes a la guía', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(3,'Productos con fechas de consumo no correspondientes', 'Productos con fechas más nuevas que en el pulmón', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(3,'Resto que supera altura límite', 'Productos con fechas más nuevas que en el pulmón', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(3,'Transpaleta con falla', 'Transpaleta inoperativo', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(3,'Montacarga con falla', 'Montacarga inoperativo', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(3,'Productos con faltante', 'Faltantes de cajas o unidades', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(3,'Productos con sobrante', 'Sobrantes de cajas', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
(3,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación', '2025-12-17 22:07:00', '2025-12-17 22:07:00'),
-- PATIO
(4,'Mala recepción de vacíos', 'Error en conteo', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(4,'Paleta deterioriada', 'Paleta no apta para traslado', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(4,'Paleta con basura', 'Paleta con desechos incrustados', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(4,'Devolución por productos vencidos', 'Productos no conforme', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(4,'Productos con faltante', 'Faltantes de cajas o unidades', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(4,'Productos con sobrante', 'Sobrantes de cajas', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(4,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación', '2025-12-18 08:19:00', '2025-12-18 09:19:00'),
-- REEMPAQUE
(5,'Productos vencidos', 'Productos no conforme', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(5,'Productos con faltante', 'Faltantes de cajas o unidades', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(5,'Productos con sobrante', 'Sobrantes de cajas', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(5,'Rotura de productos', 'Rotura o deterioro de productos por mala manipulación', '2025-12-18 08:19:00', '2025-12-18 09:19:00'),
-- FACTURACIÓN
(6,'Saltos de correlativo', 'Fuera de secuencia número de factura', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(6,'Error en placa vehículo ETS o Franquicia', 'Número de placa no correspondiente al vehículo', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(6,'Error en pedido', 'Despacho no acorde al pedido del cliente', '2025-12-18 08:19:00', '2025-12-18 08:19:00'),
(6,'Obsequio sin presupuesto', 'Ausencia de fondos en cuenta de obsequios para ser facturado', '2025-12-18 08:19:00', '2025-12-18 08:19:00');