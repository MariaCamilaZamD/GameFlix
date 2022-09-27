package test;
import beans.Videojuegos;
import connection.DBConnection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

public class OperacionesBD {
    public static void main(String[] args) {
        //actualizarVideojuego(1,"Acción/Aventura");
       listarVideojuego();
    }
    
    public static void actualizarVideojuego(int id, String genero){
        DBConnection con = new DBConnection();//Creación del objeto 'con' 
        String sql = "UPDATE videojuego SET genero =' "+genero+" 'WHERE id="+id;//Actualizar
        try {
           Statement st = con.getConnection().createStatement();
           st.executeUpdate(sql);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally{
            con.desconectar();
        } 
    }
    
    public static void listarVideojuego(){
        DBConnection con = new DBConnection();
        String sql = "SELECT * FROM videojuego";
        try {
           Statement st = con.getConnection().createStatement();
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
               int id = rs.getInt("id");
               String nombre = rs.getString("nombre");
               Date fecha_estreno = rs.getDate("fecha_estreno");
               String genero = rs.getString("genero");
               String descripcion = rs.getString("descripcion");
               String modo_juego = rs.getString("modo_juego");
               String clasificacion = rs.getString("clasificacion");
               String idioma = rs.getString("idioma");
               int copias = rs.getInt("copias");
               boolean novedad = rs.getBoolean("novedad");
               
               Videojuegos videojuegos = new Videojuegos(id, nombre, fecha_estreno, genero, descripcion, modo_juego, clasificacion, idioma, copias, novedad);//Creación de objeto de la clase videojuego
               System.out.println(videojuegos.toString());
             }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally{
            con.desconectar();
        } 
    }
}
