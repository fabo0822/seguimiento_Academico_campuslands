# Seguimiento Academico campuslands

-base de datos que permita gestionar de manera eficiente todas las operaciones relacionadas con el seguimiento académico de los *campers* matriculados en el programa intensivo de programación de CampusLands.

## Requisitos del Sistema
- **MySQL**: Versión 8.0 o superior.
- **Cliente MySQL**: MySQL Workbench o cualquier cliente compatible con MySQL.



## Instalación y Configuración

### 1. Configuración del Entorno
Para comenzar, asegúrate de tener instalado MySQL y un cliente de MySQL, como MySQL Workbench. Si no lo tienes, puedes descargarlo desde el sitio oficial de MySQL.

### 2. Crear la Base de Datos
1. **Abrir MySQL Workbench**: Inicia el cliente de MySQL y conéctate a tu servidor de base de datos.
2. **Crear una nueva base de datos**: Ejecuta el siguiente comando en una nueva consulta para crear la base de datos:
   ```sql
   CREATE DATABASE campuslands;
   USE campuslands;
   ```

### 3. Ejecutar el archivo `ddl.sql`
El archivo `ddl.sql` contiene las instrucciones para crear la estructura de la base de datos, incluyendo todas las tablas y relaciones necesarias.

1. **Cargar el archivo `ddl.sql`**: En MySQL Workbench, abre el archivo `ddl.sql` desde tu sistema de archivos.
2. **Ejecutar el script**: Haz clic en el botón de ejecutar (el rayo) o presiona `Ctrl + Shift + Enter` para ejecutar el script. Esto creará todas las tablas y relaciones definidas en el archivo.

### 4. Cargar los datos iniciales con el archivo `dml.sql`
El archivo `dml.sql` inserta datos de ejemplo en las tablas que has creado.

1. **Cargar el archivo `dml.sql`**: Abre el archivo `dml.sql` en MySQL Workbench.
2. **Ejecutar el script**: Haz clic en el botón de ejecutar (el rayo) o presiona `Ctrl + Shift + Enter` para cargar los datos iniciales.

### 5. Ejecutar Consultas, Procedimientos Almacenados, Funciones, Eventos y Triggers
Los demás archivos contienen consultas y objetos de base de datos que se pueden ejecutar según sea necesario.

- **Consultas**: Puedes ejecutar cualquier consulta SQL directamente en MySQL Workbench. Por ejemplo:
   ```sql
   SELECT * FROM productos;  -- Obtiene todos los productos disponibles
   ```

- **Procedimientos Almacenados**: Para ejecutar un procedimiento almacenado, usa la siguiente sintaxis:
   ```sql
   CALL nombre_del_procedimiento(parametros);
   ```

- **Funciones**: Para usar una función, simplemente inclúyela en una consulta:
   ```sql
   SELECT nombre_de_la_funcion(parametros);
   ```

- **Triggers y Eventos**: Los triggers se ejecutan automáticamente en respuesta a eventos en la base de datos (como inserciones o actualizaciones), por lo que no necesitas ejecutarlos manualmente. Los eventos programados se ejecutan según la programación que hayas definido.

### 6. Verificación
Después de ejecutar los scripts, verifica que las tablas se hayan creado correctamente y que los datos se hayan insertado. Puedes hacer esto ejecutando consultas simples para contar registros o seleccionar datos de las tablas.

```sql
SELECT COUNT(*) FROM productos;  -- Verifica cuántos productos se han insertado
```

### 7. Solución de Problemas
Si encuentras errores al ejecutar los scripts, revisa los mensajes de error en MySQL Workbench. Asegúrate de que:
- No haya errores de sintaxis en los scripts.
- Las tablas y columnas referenciadas existan en la base de datos.
- Estés utilizando la base de datos correcta (`USE campuslands;`).

Si necesitas más ayuda, consulta la documentación de MySQL o contacta a un administrador de base de datos.

## Estructura de la Base de Datos
- **campers**: Almacena información sobre los campers matriculados en el programa, incluyendo su identificación, nombres, apellidos y estado.
- **productos**: Contiene los detalles de los disfraces disponibles para la venta.
- **pedidos**: Registra los pedidos realizados por los campers.
- **detalles_pedido**: Relaciona los productos con los pedidos, especificando cantidades y precios.
- **modulos**: Contiene los módulos disponibles en el programa, incluyendo su nombre y descripción.
- **matriculas**: Almacena información sobre las inscripciones de los campers en diferentes rutas.
- **trainers**: Almacena información sobre los trainers, incluyendo su identificación, nombres, apellidos y especialidad.
- **evaluaciones**: Registra las evaluaciones realizadas a los campers, incluyendo notas y fechas.
- **campers_estados**: Almacena el historial de cambios de estado de los campers, permitiendo un seguimiento de su situación a lo largo del tiempo.

## Ejemplos de Consultas
- **Consulta básica**: Obtener todos los campers matriculados.
   ```sql
   SELECT id, nombre, apellido FROM campers;  -- Selecciona columnas específicas
   ```

- **Consulta avanzada**: Obtener el historial de pedidos de un camper específico.
   ```sql
   SELECT p.nombre, d.cantidad, o.fecha_pedido
   FROM pedidos o
   JOIN detalles_pedido d ON o.id = d.pedido_id
   JOIN productos p ON d.producto_id = p.id
   WHERE o.camper_id = 1;  -- Cambia el ID según sea necesario
   ```

- **Consulta para obtener todos los módulos disponibles**:
   ```sql
   SELECT id, nombre, descripcion FROM modulos;  -- Selecciona columnas específicas
   ```

- **Consulta para obtener el estado de un pedido específico**:
   ```sql
   SELECT estado FROM estados WHERE id = (SELECT estado_id FROM pedidos WHERE id = 1);  -- Cambia el ID según sea necesario
   ```

## Procedimientos, Funciones, Triggers y Eventos
- **Procedimientos Almacenados**: Se han creado procedimientos para gestionar la inserción de pedidos y la actualización del inventario.
- **Funciones**: Se han implementado funciones para calcular descuentos y totales de pedidos.
- **Triggers**: Los triggers se utilizan para actualizar automáticamente el estado de los pedidos y registrar cambios en la tabla de historial.


```



