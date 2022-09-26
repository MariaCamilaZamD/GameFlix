package beans;

import java.sql.Date;

public class Videojuegos {
    private int id;
    private String nombre;
    private Date fecha_estreno;
    private String genero;
    private String descripcion;
    private String modo_juego;
    private String clasificacion;
    private String idioma;
    private int copias;
    private boolean novedad;

    public Videojuegos(int id, String nombre, Date fecha_estreno, String genero, String descripcion, String modo_juego, String clasificacion, String idioma, int copias, boolean novedad) {
        this.id = id;
        this.nombre = nombre;
        this.fecha_estreno = fecha_estreno;
        this.genero = genero;
        this.descripcion = descripcion;
        this.modo_juego = modo_juego;
        this.clasificacion = clasificacion;
        this.idioma = idioma;
        this.copias = copias;
        this.novedad = novedad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha_estreno() {
        return fecha_estreno;
    }

    public void setFecha_estreno(Date fecha_estreno) {
        this.fecha_estreno = fecha_estreno;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getModo_juego() {
        return modo_juego;
    }

    public void setModo_juego(String modo_juego) {
        this.modo_juego = modo_juego;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public int getCopias() {
        return copias;
    }

    public void setCopias(int copias) {
        this.copias = copias;
    }

    public boolean isNovedad() {
        return novedad;
    }

    public void setNovedad(boolean novedad) {
        this.novedad = novedad;
    }

    @Override //Sobreescribir
    public String toString() {
        return "Videojuego{" + "id=" + id + ", nombre=" + nombre + ", fecha_estreno=" + fecha_estreno + ", genero=" + genero + ", descripcion=" + descripcion + ", modo_juego=" + modo_juego + ", clasificacion=" + clasificacion + ", idioma=" + idioma + ", copias=" + copias + ", novedad=" + novedad + '}';
    }    

}
