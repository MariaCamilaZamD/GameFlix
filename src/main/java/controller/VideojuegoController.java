package controller;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import beans.Videojuegos;
import connection.DBConnection;
import java.sql.Timestamp;

public class VideojuegoController implements IVideojuegoController{

    @Override
    public String listar(boolean ordenar, String orden) {
        Gson gson = new Gson();

        DBConnection con = new DBConnection();
        String sql = "Select * from videojuego"; //pilas que from videojuego debe quedar el mismo nombre de la tabla película

        if (ordenar == true) {
            sql += " order by genero " + orden;
        }

        List<String> videojuegos = new ArrayList<String>();

        try {

            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

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

                Videojuegos videojuego = new Videojuegos(id, nombre, (java.sql.Date) fecha_estreno, genero, descripcion, modo_juego, clasificacion, idioma, copias, novedad);

                videojuegos.add(gson.toJson(videojuego));

            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            con.desconectar();
        }

        return gson.toJson(videojuegos);

    }
    
    @Override
      public String devolver(int id, String username) {

          DBConnection con = new DBConnection();
          String sql = "Delete from alquiler where id= " + id + " and username = '" 
                  + username + "' limit 1";

          try {
              Statement st = con.getConnection().createStatement();
              st.executeQuery(sql);

              this.sumarCantidad(id);

              return "true";
          } catch (Exception ex) {
              System.out.println(ex.toString());
          } finally {
              con.desconectar();
          }

          return "false";
      }
      @Override
    public String sumarCantidad(int id) {

        DBConnection con = new DBConnection();

        String sql = "Update videojuego set copias = (Select copias from videojuego where id = " 
                + id + ") + 1 where id = " + id;

        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);

            return "true";
        } catch (Exception ex) {
            System.out.println(ex.toString());
        } finally {
            con.desconectar();
        }

        return "false";
    }
    
    @Override
    public String alquilar(int id, String username) {

        Timestamp fecha = new Timestamp(new Date().getTime());
        DBConnection con = new DBConnection();
        String sql = "Insert into alquiler values ('" + id + "', '" + username + "', '" + fecha + "')";

        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);

            String modificar = modificar(id);

            if (modificar.equals("true")) {
                return "true";
            }

        } catch (Exception ex) {
            System.out.println(ex.toString());
        } finally {
            con.desconectar();
        }
        return "false";
    }
    
    @Override
    public String modificar(int id) {

        DBConnection con = new DBConnection();
        String sql = "Update videojuego set copias = (copias - 1) where id = " + id;

        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);

            return "true";
        } catch (Exception ex) {
            System.out.println(ex.toString());
        } finally {
            con.desconectar();
        }

        return "false";

    }
}

   