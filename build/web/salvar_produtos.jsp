<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            int c;
            String n, d;
            double p;

            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            d = request.getParameter("descricao");
            p = Double.parseDouble(request.getParameter("preco"));
            try {
                //fazer a conexão com o banco de dados 
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jose5050");
                //Inserir dados na tabela do bancos de dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("INSERT INTO produto VALUES(? ,? ,?,?)");
                st.setInt(1, c);
                st.setString(2, n);
                st.setString(3, d);
                st.setDouble(4, p);
                st.executeUpdate();
                out.print("Produto Cadastrado com Sucesso");
            } catch (Exception x) {
                out.print("Mensagem de erro:" + x.getMessage());
            }
        %>
    </body>
</html>
