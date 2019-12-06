package controladoras;

import modelos.Estudiante;

import java.util.ArrayList;

public class ControladorLista {
    private ArrayList<Estudiante> listaEstudiantes;
    private static ControladorLista instance;


    public ControladorLista() {
        this.listaEstudiantes = new ArrayList<Estudiante>();
    }

    public static ControladorLista getInstance() {
        if(instance==null){
            instance = new ControladorLista();
        }
        return instance;
    }


    public ArrayList<Estudiante> getListaEstudiantes() {
        return listaEstudiantes;
    }

    public void addEstudiante(Estudiante nuevo){
        listaEstudiantes.add(nuevo);
    }

    public Estudiante getEstudiante(int matricula){
        for (Estudiante est: listaEstudiantes) {
            if (est.getMatricula()==matricula){
                return est;
            }
        }
        return null;
    }

    public Estudiante updateEstudiante(int matricula, Estudiante noveau){
        for (Estudiante est: listaEstudiantes) {
            if (est.getMatricula()==matricula){
                listaEstudiantes.set(listaEstudiantes.indexOf(est), noveau);
            }
        }
        return null;
    }

    public void deleteEstudiante(int matricula){
        for (Estudiante est: listaEstudiantes) {
            if (est.getMatricula()==matricula){
                listaEstudiantes.remove(listaEstudiantes.indexOf(est));
                return;
            }
        }
        return;
    }

    public void setListaEstudiantes(ArrayList<Estudiante> listaEstudiantes) {
        this.listaEstudiantes = listaEstudiantes;
    }
}
