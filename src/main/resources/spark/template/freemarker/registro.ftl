<!DOCTYPE html>
<html lang="es_do">
<head>
    <meta charset="UTF-8">
    <title>CRUD Programación Web | Create</title>
    <link href="/css/font-awesome-4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="/css/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/extra.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <h1>Registrar</h1>
    </header>
   <nav class="navbar navbar-light bg-light">
               <button class="btn btn-outline-success" type="button" > <a href="/"> Pagina Principal </a>  </button>
               <button class="btn btn-sm btn-outline-secondary" type="button"> <a href="/create"> Nuevo Estudiante </a></button>

           </nav>
    <main>
        <h3>
            <#if modificar??>
                Modificación de estudiante de estudiantes
            <#else>
                Registro de estudiantes
            </#if>
        </h3>
        <#if modificar??>
        <form action="/update" method="POST" class="registro">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" value="${estudiante.nombre}"/>

            <label for="apellido">Apellido</label>
            <input type="text" id="apellido" name="apellido" value="${estudiante.apellido}"/>

            <label for="matricula">Matricula</label>
            <input type="text" id="matricula" name="matricula" value="${estudiante.matricula?string["0"]}"/>

            <label for="telefono">Telefono</label>
            <input type="text" id="telefono" name="telefono" value="${estudiante.telefono}"/>

            <input type="submit" value="Submit"/>





        </form>
        <#else>
        <form action="/create" method="POST">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" />

            <label for="apellido">Apellido</label>
            <input type="text" id="apellido" name="apellido" />

            <label for="matricula">Matricula</label>
            <input type="text" id="matricula" name="matricula" />

            <label for="telefono">Telefono</label>
            <input type="text" id="telefono" name="telefono" />

            <input type="submit" value="Submit"/>
        </form>
        </#if>

    </main>
</body>
</html>