package controller;

public interface IUsuarioController {
    
    public String login(String username, String contrasena);
    
    public String register(String username, String contrasena, String nombre, String apellidos, String email, String celular, String direccion, double saldo, boolean premium);
    
}
