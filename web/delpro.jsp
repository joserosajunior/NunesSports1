<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar Produtos</title>
    </head>
    <body>
        <%
           //Recebe o codigo Digitado no Formulario
            int cod;
          
            cod = Integer.parseInt(request.getParameter("codigo"));
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jose5050");
            PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
            st.setInt(1, cod);
            int resultado = st.executeUpdate();
            if(resultado == 0){
              out.print("Este Produto não esta Cadastrado");
            } else{
            out.print("O Produto de código" + cod + " foi excluido com sucesso");
            }
            
            
            %>
    </body>
</html>
