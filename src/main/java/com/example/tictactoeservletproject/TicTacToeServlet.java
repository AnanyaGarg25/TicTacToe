package com.example.tictactoeservletproject;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

//@WebServlet("/game")
public class TicTacToeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String[] board = (String[]) session.getAttribute("board");
        String currentPlayer = (String) session.getAttribute("player");

        if (board == null) {
            board = new String[9];
            currentPlayer = "X";
        }

        int move = Integer.parseInt(request.getParameter("move"));
        if (board[move] == null || board[move].isEmpty()) {
            board[move] = currentPlayer;
            currentPlayer = currentPlayer.equals("X") ? "O" : "X";
        }

        session.setAttribute("board", board);
        session.setAttribute("player", currentPlayer);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("board", new String[9]);
        session.setAttribute("player", "X");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
