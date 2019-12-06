<!DOCTYPE html>
<html lang="es_do">
    <head>
        <meta charset="UTF-8">
        <title>CRUD Programacion Web</title>
        <link href="/css/font-awesome-4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
        <link href="/css/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="/css/extra.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <h1>Bienvenidos</h1>
        </header>

        <nav class="navbar navbar-light bg-light">
            <button class="btn btn-outline-success" type="button" > <a href="/"> Pagina Principal </a>  </button>
            <button class="btn btn-sm btn-outline-secondary" type="button"> <a href="/create"> Nuevo Estudiante </a></button>

        </nav>




        <main>

            <br/><br/>
            <#if estudiantes?size != 0>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>Matricula</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Telefono</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list estudiantes as est>
                            <tr>
                                <td colspan="2"><a href="/read/${est.matricula?string["0"]}"><i class="fa fa-envelope-open-o" aria-hidden="true"></i> </a>
                                    <a href="/update/${est.matricula?string["0"]}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                        <form method="POST" action="/delete/${est.matricula?string["0"]}">
                                            <button type="submit" id="submit" style="background: none; padding: 0px; border: none;">
                                                <i class="fa fa-user-times" aria-hidden="true"></i>
                                            </button>
                                        </form>
                                </td>
                                <td>${est.matricula?string["0"]}</td>
                                <td>${est.nombre}</td>
                                <td>${est.apellido}</td>
                                <td>${est.telefono}</td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <article>
                    <p>
                        No hay estudiantes registrados.
                    </p>
                </article>
            </#if>
        </main>
    </body>
</html>