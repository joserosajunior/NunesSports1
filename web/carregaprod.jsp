<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Editar Produtos</title>
         <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

        input[type="submit"] {
            background-color: #4298f5;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0047ab;
        }
    </style>
    </head>
    <body>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));
            //conectar ao banco de dados 
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jose5050");
            //Buscar o produto pelo codigo recebido
            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
            st.setInt(1, c);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {//se nao encontrou o produto
                out.print("Este Produto não foi encontrado");
            } else {
        %>
        <form method="post" action="alterar_produtos.jsp">
            <label for="codigo">Código:</label> <!-- Texto alterado e adicionado label -->
            <input type="text" id="codigo" name="codigo" required value="<%= resultado.getString("codigo") %>">

            <label for="nome">Nome do Produto:</label>
            <input type="text" id="nome" name="nome" required value="<%= resultado.getString("nome") %>">

            <label for="descricao">Descrição do Produto:</label>
            <textarea id="descricao" name="descricao" required value="<%= resultado.getString("descricao") %>" ></textarea>

            <label for="preco">Preço do Produto:</label>
            <input type="number" id="preco" name="preco" required value="<%= resultado.getString("preco") %>">

            <input type="submit" value="Salvar Alterações">
        </form>     
        <%
            }
        %>
    </body>
</html>
