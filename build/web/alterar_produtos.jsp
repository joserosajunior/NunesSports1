<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produtos</title>
        
    </head>
    <body>
        <%
            //receber formulario do carregaprod.jsp
            int c;
            String n, d;
            double p;

            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            d = request.getParameter("descricao");
            p = Double.parseDouble(request.getParameter("preco"));
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jose5050");
            //alterar os dados dos produtos no banco de dados
            st = conecta.prepareStatement("UPDATE produto SET nome = ?, descricao = ?, preco = ? WHERE codigo = ?");
            st.setString(1, n);
            st.setString(2, d);
            st.setDouble(3, p);
            st.setInt(4, c);
            st.executeUpdate(); //Executa o Updade
            out.print("Os dados do produto" + c + "Foi Alterado com Seucesso");
        %>
    </body>
</html>
