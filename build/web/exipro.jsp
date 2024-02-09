<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4298f5;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
    <body>
        <%
            try {
                //fazer a conexão com o banco de dados 
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jose5050");
                //Inserir dados na tabela do bancos de dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("SELECT * FROM produto");
                ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>Código</th><th>Nome</th><th>Descrição</th><th>Preço</th><th>Excluir</th><th>Editar</th>
            </tr>

            <%
                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("descricao")%></td>
                <td><%= rs.getString("preco")%></td>
                <td><a href="delpro.jsp?codigo=<%= rs.getString("codigo")%>">Excluir</a></td>
                <td><a href="carregaprod.jsp?codigo=<%= rs.getString("codigo")%>">Editar</a></td>
            </tr>

            <%
                    }

                } catch (Exception x) {
                    out.print("Mensagem de erro:" + x.getMessage());
                }
            %>
    </body>
</html>
