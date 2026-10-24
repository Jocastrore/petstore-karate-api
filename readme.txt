Prueba tecnica - Ejercicio 2: Api Rest PetStore con Karate

Requisitos 
- Java 21
- Maven 3.9.16  
- Conexion a internet

Pasos a ejecutar
1) Clonar el repositorio:
    git clone https://github.com/Jocastrore/petstore-karate-api.git
2) Entrar a la carpeta:
    cd petstore-karate-api
3) Ejecutar las pruebas
    mvn clean test
4) Ver el reporte en el navegador:
    target/karate-reports/karate-summary.html
    (una copia de una ejecucion exitosa esta en evidencias/karate-reports/)

URL base de la API
https://petstore.swagger.io/v2 (indicada en la documentacion de Swagger Petstore)

Que se prueba
POST, GET, PUT, GET, DELETE y GET sobre /user (crear, buscar, actualizar,
buscar el actualizado, eliminar y verificar que ya no existe).