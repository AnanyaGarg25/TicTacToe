<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
    String[] board = (String[]) session.getAttribute("board");
    if (board == null) {
        board = new String[9];
        session.setAttribute("board", board);
        session.setAttribute("player", "X");
    }

    String winner = null;
    String[][] winCombos = {
        {board[0], board[1], board[2]},
        {board[3], board[4], board[5]},
        {board[6], board[7], board[8]},
        {board[0], board[3], board[6]},
        {board[1], board[4], board[7]},
        {board[2], board[5], board[8]},
        {board[0], board[4], board[8]},
        {board[2], board[4], board[6]}
    };

    for (String[] combo : winCombos) {
        if (combo[0] != null && combo[0].equals(combo[1]) && combo[0].equals(combo[2])) {
            winner = combo[0];
            break;
        }
    }

    boolean draw = winner == null && Arrays.stream(board).noneMatch(Objects::isNull);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tic Tac Toe</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(to right, #f6d365, #fda085);
            text-align: center;
            padding: 40px;
        }

        h1 {
            font-size: 48px;
            color: #2f3e46;
            margin-bottom: 10px;
            text-shadow: 2px 2px #ffefba;
        }

        h2 {
            color: #264653;
            font-size: 24px;
            margin-bottom: 30px;
        }

        table {
            margin: 0 auto;
            border-spacing: 10px;
        }

        td {
            width: 100px;
            height: 100px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            vertical-align: middle;
        }

        .cell-btn {
            width: 100%;
            height: 100%;
            border: none;
            background: transparent;
            font-size: 40px;
            font-weight: bold;
            color: #2a9d8f;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .cell-btn:hover {
            transform: scale(1.1);
            color: #e76f51;
        }

        .filled-cell {
            font-size: 40px;
            font-weight: bold;
            color: #264653;
        }

        .restart-btn {
            margin-top: 30px;
            padding: 12px 28px;
            font-size: 18px;
            background-color: #e76f51;
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .restart-btn:hover {
            background-color: #d65a3c;
        }
    </style>
</head>
<body>
    <h1>🎮 Let's Play Tic-Tac-Toe!</h1>

    <% if (winner != null) { %>
        <h2>🎉 <%= winner %> wins the game!</h2>
    <% } else if (draw) { %>
        <h2>🤝 It's a draw! Try again.</h2>
    <% } else { %>
        <h2>➡️ Your move: <%= session.getAttribute("player") %></h2>
    <% } %>

    <form method="post" action="game">
        <table>
            <% for (int i = 0; i < 9; i++) { %>
                <% if (i % 3 == 0) out.println("<tr>"); %>
                <td>
                    <% if (board[i] != null && !board[i].isEmpty()) { %>
                        <div class="filled-cell"><%= board[i] %></div>
                    <% } else if (winner == null && !draw) { %>
                        <button name="move" value="<%= i %>" class="cell-btn">+</button>
                    <% } %>
                </td>
                <% if (i % 3 == 2) out.println("</tr>"); %>
            <% } %>
        </table>
    </form>

    <form action="game" method="get">
        <button type="submit" class="restart-btn">🔁 Start New Game</button>
    </form>
</body>
</html>
