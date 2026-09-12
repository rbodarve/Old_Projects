import java.applet.Applet;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
//import java.util.ArrayList;
import java.sql.*;
import java.util.*;

public class Checkers extends Applet{

	public static void main(String[] args){
		JFrame window = new JFrame("Checkers");
		Checkers content = new Checkers();
		window.setContentPane(content);
		window.pack();
		Dimension screensize = Toolkit.getDefaultToolkit().getScreenSize();
		window.setLocation( (screensize.width - window.getWidth())/2, (screensize.height - window.getHeight())/2 );
		window.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
		window.setResizable(false);
		window.setVisible(true);
	}

	private JButton newGameButton;
	private JButton resignButton;
	private JLabel message;
	private JMenuBar gameMenuBar;
	private JMenu gameMenu, colourMenu, darkSquareMenu, lightSquareMenu, highScoreMenu, statisticsMenu;
	private JMenuItem newGameItem, quitItem, byMovesMenu, byPointsMenu, playerProfileMenu;

	//jdbc variables
	public static String serverIP = "127.0.0.1";
	public static String dbName = "checkers";
	public static String username = "root";
	public static String password = "";
	public static String url = "jdbc:mysql://"+serverIP+":3306/"+dbName;
	public static Connection con;     // java.sql.
	public static ResultSet rs; 		   // java.sql.
	public static Statement stmt;   	// java.sql.
	public static String insertString;
	public String updateString;
	public String queryString = "select * from playerstats";
    public JFrame f = new JFrame("Player Profile");
	public JFrame highFrame = new JFrame("Player Profile");
	public JButton back = new JButton("Back");
	public JButton backToGame = new JButton("Back To Game");
	public LinkedList word = new LinkedList();
    public Vector renaire = new Vector(1);
	public Vector highScoreVector = new Vector(1);
	public String[] players;
	private JComboBox box;
	private JComboBox box2 = new JComboBox(highScoreVector);
	public String select = new String();
	public String select2 = new String();
	public String player1;
	public String player2;
	public JFrame P1 = new JFrame("Players Select");
	public JButton P1ok = new JButton("OK");
	public int ctr = 0;
	public boolean newGameAddFlag = false;
	public boolean player1Flag = true;
    public boolean player2Flag = true;
	public JButton newPlayer = new JButton("New Player");
	public int i = 0;
	public JButton playerProfOk = new JButton("OK");
	public int highFrameAddFlag = 0;
	
	public Checkers(){
		setLayout(null);
		setPreferredSize( new Dimension(450,350) );
		setBackground(new Color(69,0,0));
		Board board = new Board();
		add(gameMenuBar);
		add(board);
		add(newGameButton);
		add(resignButton);
		add(message);
		gameMenuBar.setBounds(0, 0, 500, 30);
		board.setBounds(60,70,164,164); // Note:  SIZE  MUST be 164-by-164 !
                board.setEnabled(false);
		newGameButton.setBounds(275, 70, 120, 30);
		resignButton.setBounds(275, 120, 120, 30);
                resignButton.setEnabled(false);
		message.setBounds(0, 275, 350, 30);
		databaseConnect();
	}

	private static class CheckersMove{
		int fromRow, fromCol;
		int toRow, toCol;
		CheckersMove(int r1, int c1, int r2, int c2) {
			fromRow = r1;
			fromCol = c1;
			toRow = r2;
			toCol = c2;
		}
		boolean isJump(){
			return (fromRow - toRow >= 2 || fromRow - toRow <= -2);
		}
	}

	private class Board extends JPanel implements ActionListener, MouseListener{
		CheckersData board;
		boolean gameInProgress;
		int currentPlayer;
		int selectedRow, selectedCol;
		CheckersMove[] legalMoves;

		Board(){
			setBackground(Color.BLACK);
			addMouseListener(this);
			gameMenuBar = new JMenuBar();
			gameMenu = new JMenu("Game");
			newGameItem = new JMenuItem("New Game");
			newGameItem.addActionListener(this);
			quitItem = new JMenuItem("Quit");
			quitItem.addActionListener(this);
			gameMenu.add(newGameItem);
			gameMenu.add(quitItem);
			statisticsMenu = new JMenu("Statistics");
			highScoreMenu = new JMenu("High Score");
			playerProfileMenu = new JMenuItem("Player Profile");
			playerProfileMenu.addActionListener(this);
			byPointsMenu = new JMenuItem("By Points");
			byPointsMenu.addActionListener(this);
			byMovesMenu = new JMenuItem("By Moves");
			byMovesMenu.addActionListener(this);
			highScoreMenu.add(byPointsMenu);
			highScoreMenu.add(byMovesMenu);
			statisticsMenu.add(highScoreMenu);
			statisticsMenu.add(playerProfileMenu);
			gameMenuBar.add(gameMenu);
			gameMenuBar.add(statisticsMenu);
			resignButton = new JButton("Resign");
			resignButton.addActionListener(this);
			newGameButton = new JButton("New Game");
			newGameButton.addActionListener(this);
			message = new JLabel("",JLabel.CENTER);
			message.setFont(new  Font("Serif", Font.BOLD, 14));
			message.setForeground(Color.green);
			board = new CheckersData();
			back.addActionListener(this);
			backToGame.addActionListener(this);
			P1ok.addActionListener(this);
			newPlayer.addActionListener(this);
			playerProfOk.addActionListener(this);
		}

		public void actionPerformed(ActionEvent evt){
			Object src = evt.getSource();
			if(src == newGameButton || src == newGameItem)
				doNewGame();
			else if(src == resignButton)
				doResign();
			else if(src == quitItem)
				System.exit(0);
			else if(src == byPointsMenu){
				//setColour(Checkers.LIGHT, Color.pink);
			}
            else if(src == byMovesMenu){
				//setColour(Checkers.LIGHT, Color.pink);
			}
			else if(src == playerProfileMenu)
				highScores();
			else if(src == back){
				word.clear();
				highScoreVector.clear();
				f.dispose();
				highScores();
			}
			else if(src == backToGame){
				word.clear();
				highScoreVector.clear();
				f.dispose();
				highFrame.dispose();
			}
			else if(src == P1ok){
				if(player1Flag==true){
					player1Flag=false;
					player1 = "" + select;
					JOptionPane.showMessageDialog(null, "Player 1 is " + player1,"SUCCESS!",JOptionPane.INFORMATION_MESSAGE);
				}
				else{
					player1Flag=true;
                    System.out.println(select);
					player2 = "" + select;
					JOptionPane.showMessageDialog(null, "Player 2 is " + player2,"SUCCESS!",JOptionPane.INFORMATION_MESSAGE);
					P1.dispose();
					renaire.clear();
                    resignButton.setEnabled(true);
					newGameButton.setEnabled(true);
                    gameInProgress = true;
				}
			}
			else if(src == newPlayer){
				newPlayerMethod();
                P1.dispose();
                playerName();
			}
			else if(src == playerProfOk){
				playerProfile();
			}
		}

		void doNewGame(){
			playerName();
			board.setUpGame();
			currentPlayer = CheckersData.RED;
			legalMoves = board.getLegalMoves(CheckersData.RED);
			selectedRow = -1;
			//newGameButton.setEnabled(true);
			repaint();
		}

		void doResign(){
			if(gameInProgress == false){
				message.setText("There is no game in progress!");
				return;
			}
			if(currentPlayer == CheckersData.RED)
				gameOver(player1 + " resigns.  " + player2 + " wins.");
			else
				gameOver(player2 + " resigns.  " + player1 + " wins.");
		}

		void gameOver(String str){
			message.setText(str);
			newGameButton.setEnabled(true);
			resignButton.setEnabled(false);
			gameInProgress = false;
		}

		void doClickSquare(int row, int col){
			for(int i = 0; i < legalMoves.length; i++)
				if(legalMoves[i].fromRow == row && legalMoves[i].fromCol == col){
					selectedRow = row;
					selectedCol = col;
					if(currentPlayer == CheckersData.RED)
						message.setText(player1 + ":  Make your move.");
					else
						message.setText(player2 + ":  Make your move.");
					repaint();
					return;
				}
			if(selectedRow < 0){
				message.setText("Click the piece you want to move.");
				return;
			}
			for(int i = 0; i < legalMoves.length; i++)
				if(legalMoves[i].fromRow == selectedRow && legalMoves[i].fromCol == selectedCol && legalMoves[i].toRow == row && legalMoves[i].toCol == col){
					doMakeMove(legalMoves[i]);
					return;
				}
			message.setText("Click the square you want to move to.");
		}

		void doMakeMove(CheckersMove move){
			board.makeMove(move);
			if(move.isJump()){
				legalMoves = board.getLegalJumpsFrom(currentPlayer,move.toRow,move.toCol);
				if(legalMoves != null){
					if(currentPlayer == CheckersData.RED)
						message.setText(player1 + ":  You must continue jumping.");
					else
						message.setText(player2 + ":  You must continue jumping.");
					selectedRow = move.toRow;
					selectedCol = move.toCol;
					repaint();
					return;
				}
			}
			if(currentPlayer == CheckersData.RED){
				currentPlayer = CheckersData.BLACK;
				legalMoves = board.getLegalMoves(currentPlayer);
				if(legalMoves == null)
					gameOver(player2 + " has no moves.  " + player1 + " wins.");
				else if(legalMoves[0].isJump())
					message.setText(player2 + ":  Make your move.  You must jump.");
				else
					message.setText(player2 + ":  Make your move.");
			}
			else{
				currentPlayer = CheckersData.RED;
				legalMoves = board.getLegalMoves(currentPlayer);
				if(legalMoves == null)
					gameOver(player1 + " has no moves.  " + player2 +" wins.");
				else if(legalMoves[0].isJump())
					message.setText(player1 + ":  Make your move.  You must jump.");
				else
					message.setText(player1 + ":  Make your move.");
			}
			selectedRow = -1;
                if(legalMoves != null){
				boolean sameStartSquare = true;
				for(int i = 1; i < legalMoves.length; i++)
				if(legalMoves[i].fromRow != legalMoves[0].fromRow || legalMoves[i].fromCol != legalMoves[0].fromCol){
					sameStartSquare = false;
					break;
				}
				if(sameStartSquare){
					selectedRow = legalMoves[0].fromRow;
					selectedCol = legalMoves[0].fromCol;
				}
			}
			repaint();
		}

		public void paintComponent(Graphics g){
                        g.setColor(Color.black);
			g.drawRect(0,0,getSize().width-1,getSize().height-1);
			g.drawRect(1,1,getSize().width-3,getSize().height-3);
                        for(int row = 0; row < 8; row++){
				for(int col = 0; col < 8; col++){
					if( row % 2 == col % 2 )
						g.setColor(Color.LIGHT_GRAY);
					else
						g.setColor(Color.GRAY);
					g.fillRect(2 + col*20, 2 + row*20, 20, 20);
					switch(board.pieceAt(row,col)){
						case CheckersData.RED:
							g.setColor(Color.RED);
							g.fillOval(4 + col*20, 4 + row*20, 15, 15);
							break;
						case CheckersData.BLACK:
							g.setColor(Color.BLACK);
							g.fillOval(4 + col*20, 4 + row*20, 15, 15);
							break;
						case CheckersData.RED_KING:
							g.setColor(Color.RED);
							g.fillOval(4 + col*20, 4 + row*20, 15, 15);
							g.setColor(Color.WHITE);
							g.drawString("K", 7 + col*20, 16 + row*20);
							break;
						case CheckersData.BLACK_KING:
							g.setColor(Color.BLACK);
							g.fillOval(4 + col*20, 4 + row*20, 15, 15);
							g.setColor(Color.WHITE);
							g.drawString("K", 7 + col*20, 16 + row*20);
							break;
					}
				}
			}
			if(gameInProgress){
				g.setColor(Color.cyan);
				for(int i = 0; i < legalMoves.length; i++){
					g.drawRect(2 + legalMoves[i].fromCol*20, 2 + legalMoves[i].fromRow*20, 19, 19);
					g.drawRect(3 + legalMoves[i].fromCol*20, 3 + legalMoves[i].fromRow*20, 17, 17);
				}
				if(selectedRow >= 0){
					g.setColor(Color.white);
					g.drawRect(2 + selectedCol*20, 2 + selectedRow*20, 19, 19);
					g.drawRect(3 + selectedCol*20, 3 + selectedRow*20, 17, 17);
					g.setColor(Color.green);
					for(int i = 0; i < legalMoves.length; i++){
						if(legalMoves[i].fromCol == selectedCol && legalMoves[i].fromRow == selectedRow){
							g.drawRect(2 + legalMoves[i].toCol*20, 2 + legalMoves[i].toRow*20, 19, 19);
							g.drawRect(3 + legalMoves[i].toCol*20, 3 + legalMoves[i].toRow*20, 17, 17);
						}
					}
				}
			}

		}

		public void mousePressed(MouseEvent evt){
			if(gameInProgress == false)
				message.setText("Click \"New Game\" to start a new game.");
			else{
				int col = (evt.getX() - 2) / 20;
				int row = (evt.getY() - 2) / 20;
				if (col >= 0 && col < 8 && row >= 0 && row < 8)
					doClickSquare(row,col);
			}
		}

		public void mouseReleased(MouseEvent evt) { }
		public void mouseClicked(MouseEvent evt) { }
		public void mouseEntered(MouseEvent evt) { }
		public void mouseExited(MouseEvent evt) { }
	}

	private static class CheckersData{
		static final int EMPTY = 0, RED = 1, RED_KING = 2, BLACK = 3, BLACK_KING = 4;
		int[][] board;

		CheckersData(){
			board = new int[8][8];
			setUpGame();
		}

		void setUpGame(){
			for(int row = 0; row < 8; row++){
				for(int col = 0; col < 8; col++){
					if( row % 2 == col % 2 ){
						if(row < 3)
							board[row][col] = BLACK;
						else if(row > 4)
							board[row][col] = RED;
						else
							board[row][col] = EMPTY;
					}
					else{
						board[row][col] = EMPTY;
					}
				}
			}
		}

		int pieceAt(int row, int col){
			return board[row][col];
		}

		void makeMove(CheckersMove move){
			makeMove(move.fromRow, move.fromCol, move.toRow, move.toCol);
		}

		void makeMove(int fromRow, int fromCol, int toRow, int toCol){
			board[toRow][toCol] = board[fromRow][fromCol];
			board[fromRow][fromCol] = EMPTY;
			if(fromRow - toRow == 2 || fromRow - toRow == -2){
				int jumpRow = (fromRow + toRow) / 2;
				int jumpCol = (fromCol + toCol) / 2;
				board[jumpRow][jumpCol] = EMPTY;
			}
			if(toRow == 0 && board[toRow][toCol] == RED)
				board[toRow][toCol] = RED_KING;
			if(toRow == 7 && board[toRow][toCol] == BLACK)
				board[toRow][toCol] = BLACK_KING;
		}

		CheckersMove[] getLegalMoves(int player){
			if(player != RED && player != BLACK)
				return null;
			int playerKing;
			if(player == RED)
				playerKing = RED_KING;
			else
				playerKing = BLACK_KING;
			ArrayList<CheckersMove> moves = new ArrayList<CheckersMove>();
			for(int row = 0; row < 8; row++){
				for(int col = 0; col < 8; col++){
					if(board[row][col] == player || board[row][col] == playerKing){
						if(canJump(player, row, col, row+1, col+1, row+2, col+2))
							moves.add(new CheckersMove(row, col, row+2, col+2));
						if(canJump(player, row, col, row-1, col+1, row-2, col+2))
							moves.add(new CheckersMove(row, col, row-2, col+2));
						if(canJump(player, row, col, row+1, col-1, row+2, col-2))
							moves.add(new CheckersMove(row, col, row+2, col-2));
						if(canJump(player, row, col, row-1, col-1, row-2, col-2))
							moves.add(new CheckersMove(row, col, row-2, col-2));
					}
				}
			}
			if(moves.size() == 0){
				for(int row = 0; row < 8; row++){
					for(int col = 0; col < 8; col++){
						if(board[row][col] == player || board[row][col] == playerKing){
							if(canMove(player,row,col,row+1,col+1))
								moves.add(new CheckersMove(row,col,row+1,col+1));
							if(canMove(player,row,col,row-1,col+1))
								moves.add(new CheckersMove(row,col,row-1,col+1));
							if(canMove(player,row,col,row+1,col-1))
								moves.add(new CheckersMove(row,col,row+1,col-1));
							if(canMove(player,row,col,row-1,col-1))
								moves.add(new CheckersMove(row,col,row-1,col-1));
						}
					}
				}
			}
			if(moves.size() == 0)
				return null;
			else{
				CheckersMove[] moveArray = new CheckersMove[moves.size()];
				for(int i = 0; i < moves.size(); i++)
					moveArray[i] = moves.get(i);
				return moveArray;
			}
		}

		CheckersMove[] getLegalJumpsFrom(int player, int row, int col){
			if(player != RED && player != BLACK)
				return null;
			int playerKing;
			if(player == RED)
				playerKing = RED_KING;
			else
				playerKing = BLACK_KING;
			ArrayList<CheckersMove> moves = new ArrayList<CheckersMove>();
			if(board[row][col] == player || board[row][col] == playerKing){
				if(canJump(player, row, col, row+1, col+1, row+2, col+2))
					moves.add(new CheckersMove(row, col, row+2, col+2));
				if(canJump(player, row, col, row-1, col+1, row-2, col+2))
					moves.add(new CheckersMove(row, col, row-2, col+2));
				if(canJump(player, row, col, row+1, col-1, row+2, col-2))
					moves.add(new CheckersMove(row, col, row+2, col-2));
				if(canJump(player, row, col, row-1, col-1, row-2, col-2))
					moves.add(new CheckersMove(row, col, row-2, col-2));
			}
			if(moves.size() == 0)
				return null;
			else{
				CheckersMove[] moveArray = new CheckersMove[moves.size()];
				for(int i = 0; i < moves.size(); i++)
					moveArray[i] = moves.get(i);
				return moveArray;
			}
		}

		private boolean canJump(int player, int r1, int c1, int r2, int c2, int r3, int c3){
			if(r3 < 0 || r3 >= 8 || c3 < 0 || c3 >= 8)
				return false;
			if(board[r3][c3] != EMPTY)
				return false;
			if(player == RED){
				if(board[r2][c2] != BLACK && board[r2][c2] != BLACK_KING)
					return false;
				return true;
			}
			else{
				if(board[r2][c2] != RED && board[r2][c2] != RED_KING)
					return false;
				return true;
			}
		}

		private boolean canMove(int player, int r1, int c1, int r2, int c2){
			if(r2 < 0 || r2 >= 8 || c2 < 0 || c2 >= 8)
				return false;
			if(board[r2][c2] != EMPTY)
				return false;
			if(player == RED){
				if(board[r1][c1] == RED && r2 > r1)
					return false;
				return true;
			}
			else{
				if(board[r1][c1] == BLACK && r2 < r1)
					return false;
				return true;
			}
		}
	}

	public void highScores(){
		
		try{
			rs = stmt.executeQuery(queryString);
			while(rs.next()){
				String temp = rs.getString("name");
				highScoreVector.add(temp);
			}
			//box2 = new JComboBox(highScoreVector);
			box2.addItemListener(
				new ItemListener(){
					public void itemStateChanged(ItemEvent event2){
						if(event2.getStateChange()==ItemEvent.SELECTED){
							select2 = "" + box2.getSelectedItem();
							System.out.println("Select2: " + select2);
						}
					}
				}
			);
			highFrame.setDefaultCloseOperation(P1.EXIT_ON_CLOSE);
			FlowLayout FL = new FlowLayout();
			highFrame.setLayout(FL);
			FL.setAlignment(FlowLayout.LEFT);
			highFrame.add(box2);
			highFrame.add(playerProfOk);
			highFrame.setSize(350,75);
			highFrame.setResizable(false);
			highFrame.setVisible(true);
		}
		catch(java.sql.SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
		}
	}
	
	public void playerProfile(){
		String newQuery = "select * from playerstats where name = '"+select2+"'";
		try{
			rs = stmt.executeQuery(newQuery);
			while(rs.next()){
				String temp = rs.getString("name");
				word.add(temp);
				temp = rs.getString("gamesplayed");
				word.add(temp);
				temp = rs.getString("totalpoints");
				word.add(temp);
				temp = rs.getString("gameswin");
				word.add(temp);
				temp = rs.getString("gameslose");
				word.add(temp);
				temp = rs.getString("gamesdraw");
				word.add(temp);
				temp = rs.getString("highestpoint");
				word.add(temp);
				temp = rs.getString("opponentpoint");
				word.add(temp);
				temp = rs.getString("fewestmoves");
				word.add(temp);
				temp = rs.getString("opponentmoves");
				word.add(temp);
			}
			String rows[][] = new String[word.size()/10][10];
			int comp = word.size()/10;
			for(int k = 0; k < comp; k++){
				for(int count = 0; count<10; count++){
					rows[k][count] = String.valueOf(word.pop());
				}
			}
			String columns[] = { "Name","Games Played", "Total Points" , "Games Win", "Games Lose", "Games Draw", "Highest Point", "Opponent Point", "Fewest Moves", "Opponent Moves"};
			JTable table = new JTable(rows,columns);
			table.setAutoCreateRowSorter(true);
			table.setAutoResizeMode(5);
			JScrollPane scrollPane = new JScrollPane(table);
			f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			Container content = f.getContentPane();
			f.setLayout(new BorderLayout());
			f.add(scrollPane, BorderLayout.CENTER);
			JPanel backPanel = new JPanel();
			backPanel.setLayout(new GridLayout(1,2));
			backPanel.add(back);
			backPanel.add(backToGame);
			f.add(backPanel, BorderLayout.SOUTH);
			f.setSize(1000,100);
			f.setResizable(false);
			f.setVisible(true);
		}
		catch(java.sql.SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
		}
	}
	
	public void playerName(){
		try{
			rs = stmt.executeQuery(queryString);
			while(rs.next()){
				String temp = rs.getString("name");
				renaire.add(temp);
			}
		}
		catch(java.sql.SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
		}
		box = new JComboBox(renaire);
		box.addItemListener(
			new ItemListener(){
				public void itemStateChanged(ItemEvent event){
					if(event.getStateChange()==ItemEvent.SELECTED){
						select = "" + box.getSelectedItem();
					}
				}
			}
		);
		P1.setDefaultCloseOperation(P1.EXIT_ON_CLOSE);
		FlowLayout FL = new FlowLayout();
		P1.setLayout(FL);
		FL.setAlignment(FlowLayout.LEFT);
		if(newGameAddFlag==false){
			P1.add(box);
			newGameAddFlag=true;
		}
		P1.add(P1ok);
		P1.add(newPlayer);
		P1.setSize(350,75);
		P1.setResizable(false);
		P1.setVisible(true);
		
	}
	
	public void newPlayerMethod(){
		try{
			String name = JOptionPane.showInputDialog(null,"Input player name:");
			stmt.executeUpdate("insert into playerstats values ('"+name+"','0','0','0','0','0','0','n/a','0','n/a')");
			con.close();
			databaseConnect();
            renaire.clear();
		}
		catch(java.sql.SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
		}
	}
	
	public void databaseConnect(){
		try{
			System.out.println("Connecting to database...");
			// Step 1: Load the JDBC driver.
			// C:\Program Files\Java\jdk2\jre\lib\ext\mysql-connector-java-3.1.13-bin
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Establish the connection to the database.
			con = DriverManager.getConnection(url, username, password);
			// or  con = java.sql.DriverManager.getConnection(url, username, password);
			System.out.println("Driver connection established...");
			stmt = con.createStatement();
		}
		catch(java.sql.SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
		}
		catch(ClassNotFoundException cnfe){
			System.err.println(cnfe.getMessage());
		}
	}
}