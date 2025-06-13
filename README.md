# 🎮 Tic Tac Toe Game (Java Servlet + JSP)

A fun and interactive Tic-Tac-Toe game built using **Java Servlets** and **JSP**. This web-based game supports two players taking turns, with real-time UI updates and session-based game state management.

---

## Features

✅ Two-player turn-based game (X and O)  
✅ Win and Draw detection 
✅ Game restart functionality (Start a new game)  
✅ Beautiful and playful UI using HTML/CSS
✅ Session-based board tracking (no database needed)

---

## ⚙️ How It Works

- `GET /game` – Starts a new game session.
- `POST /game` – Handles a move, switches the player, and checks for win/draw.
- Game data (board + current player) is stored in the HTTP session.
- JSP dynamically updates the board view based on the session data.

---

## 🛠️ Requirements

- Java 11+
- Apache Tomcat or any Jakarta EE Servlet container
- NetBeans or any Java IDE
- Maven (optional for builds)

---

## ▶️ How to Run

1. Clone this repository

```bash
git clone https://github.com/AnanyaGarg25/TicTacToe.git
cd TicTacToeServletProject
```

2. Open in NetBeans or your preferred IDE.

3. Run on Apache Tomcat or compatible servlet container.

4. Visit http://localhost:8080/TicTacToeServletProject/ to start playing!

---

## 🛠️ Tech Stack

| Technology | Purpose                          |
|------------|----------------------------------|
| Java       | Core backend logic               |
| JSP        | Dynamic HTML rendering           |
| Servlet    | Handles user moves & game logic  |
| HTML/CSS   | Frontend design and layout       |
| Tomcat     | Servlet container/server         |

---

## 🔄 Game Logic Overview

  - The board is maintained in session memory as a String[]
  - Each button press posts a move to /game
  - Servlet validates the move and switches the player
  - Win/draw conditions are checked on each update
  - Game restarts via GET request to /game
