import controladoras.ControladorLista;
import modelos.Estudiante;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;
public class Main {

    public static void main(String[] args){
        //Puerto Heroku

        ProcessBuilder processBuilder = new ProcessBuilder();
        if (processBuilder.environment().get("PORT") != null) {
            port(Integer.parseInt(processBuilder.environment().get("PORT")));
        }else{
            port(8080);
        }
        staticFiles.location("/publico");
        get("/",((request, response) -> {
            ArrayList<Estudiante> estudiantes = ControladorLista.getInstance().getListaEstudiantes();
            Map<String,Object> paramet = new HashMap<>();
            paramet.put("estudiantes", estudiantes);
            return new FreeMarkerEngine().render(new ModelAndView(paramet,"listado.ftl"));
        }));

        get("/read/:matricula",((request, response) -> {
            Estudiante estudiante = ControladorLista.getInstance().getEstudiante(Integer.parseInt(request.params("matricula")));
            Map<String,Object> paramet = new HashMap<>();
            paramet.put("estudiante", estudiante);
            return new FreeMarkerEngine().render(new ModelAndView(paramet,"vista.ftl"));
        }));

        get("/create",((request, response) -> {
            return new FreeMarkerEngine().render(new ModelAndView(null,"registro.ftl"));
        }));

        post("/create",((request, response) -> {
            Estudiante nuevo = new Estudiante(Integer.parseInt(request.queryParams("matricula")), request.queryParams("nombre"), request.queryParams("apellido"), request.queryParams("telefono"));
            ControladorLista.getInstance().addEstudiante(nuevo);
            response.redirect("/", 303);
            return null;
        }));

        get("/update/:matricula",((request, response) -> {
            Estudiante mod = ControladorLista.getInstance().getEstudiante(Integer.parseInt(request.params("matricula")));
            Map<String,Object> paramet = new HashMap<>();
            paramet.put("estudiante", mod);
            paramet.put("modificar", true);
            return new FreeMarkerEngine().render(new ModelAndView(paramet,"registro.ftl"));
        }));

        post("/update", ((request, response) -> {
            Estudiante nuevo = new Estudiante(Integer.parseInt(request.queryParams("matricula")), request.queryParams("nombre"), request.queryParams("apellido"), request.queryParams("telefono"));
            ControladorLista.getInstance().updateEstudiante(Integer.parseInt(request.queryParams("matricula")),nuevo);
            response.redirect("/", 303);
            return null;
        }));

        post("/delete/:matricula", (request, response) -> {
            ControladorLista.getInstance().deleteEstudiante(Integer.parseInt(request.params(":matricula")));
            response.redirect("/",303);
            return null;
        });


    }
}
