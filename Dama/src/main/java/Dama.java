//package odarve;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
//import java.util.ArrayList;
import java.sql.*;
import java.util.*;

// final removes the constructor 'this'-escape warning (this class is never subclassed).
public final class Dama extends JPanel{

	// This Swing UI is never serialized (persistence is via SQLite/JDBC); the id and the
	// transient markers below simply satisfy the Serializable contract JPanel brings in.
	private static final long serialVersionUID = 1L;

	public static void main(String[] args){
		// Build and show all Swing components on the Event Dispatch Thread, as Swing requires.
		SwingUtilities.invokeLater(() -> {
			JFrame window = new JFrame("Dama");
			Dama content = new Dama();
			window.setContentPane(content);
			window.pack();
			Dimension screensize = Toolkit.getDefaultToolkit().getScreenSize();
			window.setLocation( (screensize.width - window.getWidth())/2, (screensize.height - window.getHeight())/2 );
			window.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
			window.setResizable(false);
			window.setVisible(true);
			// Connect to the DB only after the window exists, so a fatal-error dialog has a
			// real parent to center on and the app can exit cleanly instead of limping on.
			content.databaseConnect();
		});
	}
	//jdbc variables
	public static String dbDir = System.getProperty("user.home") + java.io.File.separator + ".dama";
	public static String url = "jdbc:sqlite:" + dbDir + java.io.File.separator + "dama.db";
	public static Connection con;     // java.sql.  (one app-wide connection)
	public static Statement stmt;   	// java.sql.
	public String queryString = "select * from playerstats";
	// Board geometry, derived from a single cell size so the grid, pieces, hit-testing,
	// and the board panel's bounds all stay in sync.
	private static final int CELL = 24;                     // pixel size of one square
	private static final int BMARGIN = 2;                   // inset of the grid inside the panel
	private static final int BOARDPX = BMARGIN*2 + 8*CELL;  // full board panel size
        //GUI variables
        private JButton newGameButton;
	private JButton resignButton;
	private JButton drawButton;
	private JLabel message;
	private JMenuBar gameMenuBar;
	private JMenu gameMenu, highScoreMenu, statisticsMenu;
	private JMenuItem newGameItem, quitItem, byMovesMenu, byPointsMenu, playerProfileMenu;
        // The prompts render inside the main window (see overlay*) instead of as separate
        // top-level windows, because the WSLg/Wayland compositor won't reliably place/size dialogs.
        public JPanel f = new JPanel(new BorderLayout());
	public JPanel highFrame = new JPanel();
	public JButton back = new JButton("Back");
	public JButton backToGame = new JButton("Back To Game");
	public LinkedList<String> word = new LinkedList<String>();
	public Vector<String> highScoreVector = new Vector<String>(1);
        public Vector<String> playerList = new Vector<String>();
	private JComboBox<String> box = new JComboBox<String>(playerList);
	private JComboBox<String> box2 = new JComboBox<String>(highScoreVector);
	public String select = new String();
	public String select2 = new String();
	public String player1;
	public String player2;
	public JPanel P1 = new JPanel(null);
	public JButton newPlayer = new JButton("New Player");
	public JButton playerProfOk = new JButton("OK");
	public int P1points = 0;
	public int P1moves = 0;
	public int P2points = 0;
	public int P2moves = 0;
	public LinkedList<String> scores = new LinkedList<String>();
	public JPanel pointScoreFrame = new JPanel(new BorderLayout());
	public JButton pointScoreBack = new JButton("Back");
	public JPanel moveScoreFrame = new JPanel(new BorderLayout());
	public JButton moveScoreBack = new JButton("Back");
	public LinkedList<String> playerData = new LinkedList<String>();
	public int gamesPlayed, totalPoints, gamesWin, gamesLose, gamesDraw, highestPoint, fewestMoves, gamesPlayed2, totalPoints2, gamesWin2, gamesLose2, gamesDraw2, highestPoint2, fewestMoves2;
	public String opponentPoint, opponentMoves, opponentPoint2, opponentMoves2;
	public JButton chooseP1 = new JButton("Player 1");
	public JButton chooseP2 = new JButton("Player 2");
	public JPanel playerListFrame = new JPanel();
	public JButton playerListBack = new JButton("OK");
	public boolean player1Flag = true;
        public JButton startGameButton = new JButton("Start Game");
	// In-window overlay that hosts whichever prompt is active, replacing the old modal dialogs.
	private JPanel overlay;
	private JLabel overlayTitle;
	private JComponent overlayContent;
	private Board boardRef;   // so the overlay's close button can check gameInProgress
	// New-player prompt shown as an in-window overlay instead of a JOptionPane input dialog.
	private JPanel newPlayerFrame;
	private JTextField newPlayerField;
	private JLabel newPlayerStatus;
	private JButton newPlayerOk = new JButton("OK");
	private JButton newPlayerCancel = new JButton("Cancel");
	// Inline validation line on the player-list overlay (replaces JOptionPane popups).
	private JLabel playerListStatus = new JLabel(" ");
	// Reusable simple message overlay for load errors, matching the in-window prompt style.
	private JPanel messageFrame;
	private JLabel messageFrameText;
	private JButton messageFrameOk = new JButton("OK");
	private transient Runnable messageOnOk;   // what the message overlay's OK button does (dismiss, or exit)
	// Live scoreboard shown at the bottom of the game window (Player 1 left, Player 2 right).
	private JLabel p1Score = new JLabel(" ", JLabel.CENTER);
	private JLabel p2Score = new JLabel(" ", JLabel.CENTER);
	// Two-step draw-offer prompt; each player may offer a draw once per game.
	private JPanel confirmFrame;
	private JLabel confirmText;
	private JButton confirmYes = new JButton("Yes");
	private JButton confirmNo = new JButton("No");
	private transient Runnable confirmOnYes, confirmOnNo;
	private boolean p1DrawSpent, p2DrawSpent;
	// Inline status line on the players-select prompt (e.g. "need two players").
	private JLabel p1Status = new JLabel(" ");
	// Reference to the overlay's ✕ button so the selection flow can lock it.
	private JButton overlayCloseButton;

	public Dama(){
		setLayout(null);
		setPreferredSize( new Dimension(450,350) );
		setBackground(new Color(69,0,0));
		Board board = new Board();
		boardRef = board;
		add(gameMenuBar);
		add(board);
		add(newGameButton);
		add(resignButton);
		add(drawButton);
		add(message);
		gameMenuBar.setBounds(0, 0, 450, 30);
		board.setBounds(60, 70, BOARDPX, BOARDPX);   // size derived from CELL; keep clear of the buttons at x=275
		newGameButton.setBounds(275, 70, 120, 30);
		resignButton.setBounds(275, 120, 120, 30);
                resignButton.setEnabled(false);
		drawButton.setBounds(275, 170, 120, 30);
                drawButton.setEnabled(false);
		message.setBounds(0, 275, 450, 30);
		add(p1Score);
		add(p2Score);
		p1Score.setBounds(0, 305, 225, 25);
		p2Score.setBounds(225, 305, 225, 25);
		p1Score.setForeground(new Color(255,180,180));   // RED = Player 1 (lightened for contrast on dark red)
		p2Score.setForeground(Color.WHITE);              // BLACK = Player 2
		buildOverlay();
		add(overlay);
		// Build the "Players Select" prompt once; its button states drive the new-game flow.
		P1.add(startGameButton);
		P1.add(newPlayer);
		P1.add(chooseP1);
		P1.add(chooseP2);
		startGameButton.setBounds(10, 10, 120, 30);
		newPlayer.setBounds(170, 10, 120, 30);
		chooseP1.setBounds(10, 70, 120, 30);
		chooseP2.setBounds(170, 70, 120, 30);
		p1Status.setBounds(10, 110, 300, 30);
		p1Status.setForeground(Color.RED);
		P1.add(p1Status);
                playerListStatus.setForeground(Color.RED);
                buildNewPlayerPrompt();
	}

	// Build the in-window overlay that hosts the active prompt.  It covers the whole
	// content area so it reads like a modal panel, and its position/size are handled by
	// Swing layout inside the window (never by the window manager).
	private void buildOverlay(){
		overlay = new JPanel(new BorderLayout());
		overlay.setBounds(0, 0, 450, 350);
		overlay.setBackground(new Color(69,0,0));
		overlay.setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY));
		JPanel titleBar = new JPanel(new BorderLayout());
		titleBar.setBackground(Color.LIGHT_GRAY);
		overlayTitle = new JLabel("", JLabel.CENTER);
		overlayTitle.setFont(new Font("SansSerif", Font.BOLD, 13));
		overlayTitle.setBorder(BorderFactory.createEmptyBorder(4,4,4,4));
		titleBar.add(overlayTitle, BorderLayout.CENTER);
		overlayCloseButton = new JButton("✕");   // ✕: back out of any prompt
		overlayCloseButton.setMargin(new Insets(0,6,0,6));
		overlayCloseButton.addActionListener(e -> {
			hideOverlay();
			// If the user bailed out before a game actually started, make New Game usable again.
			if(boardRef == null || !boardRef.gameInProgress){
				newGameButton.setEnabled(true);
				newGameItem.setEnabled(true);
			}
		});
		titleBar.add(overlayCloseButton, BorderLayout.EAST);
		overlay.add(titleBar, BorderLayout.NORTH);
		overlay.setVisible(false);
	}

	// Show/hide the game widgets.  We toggle visibility rather than rely on z-order because
	// overlapping lightweight siblings in a null layout let opaque buttons repaint over the overlay.
	private void setGameVisible(boolean v){
		boardRef.setVisible(v);
		newGameButton.setVisible(v);
		resignButton.setVisible(v);
		drawButton.setVisible(v);
		message.setVisible(v);
		gameMenuBar.setVisible(v);
		p1Score.setVisible(v);
		p2Score.setVisible(v);
	}

	// Show a prompt panel inside the window in place of the board.
	private void showOverlay(JComponent prompt, String title){
		overlayCloseButton.setEnabled(true);   // ✕ cancels any prompt; only fatalError locks it
		overlayTitle.setText(title);
		if(overlayContent != null)
			overlay.remove(overlayContent);
		overlayContent = prompt;
		overlay.add(prompt, BorderLayout.CENTER);
		setGameVisible(false);
		overlay.setVisible(true);
		setComponentZOrder(overlay, 0);
		overlay.revalidate();
		overlay.repaint();
	}

	// Dismiss the prompt and return to the game.
	private void hideOverlay(){
		if(overlayContent != null){
			overlay.remove(overlayContent);
			overlayContent = null;
		}
		overlay.setVisible(false);
		setGameVisible(true);
		repaint();
	}

	// Build the New Player prompt once; it replaces the old JOptionPane name dialog so the
	// prompt renders reliably inside the window like every other prompt.
	private void buildNewPlayerPrompt(){
		newPlayerFrame = new JPanel(new BorderLayout());
		JPanel center = new JPanel();
		center.add(new JLabel("Player name:"));
		newPlayerField = new JTextField(12);
		center.add(newPlayerField);
		newPlayerStatus = new JLabel(" ", JLabel.CENTER);
		newPlayerStatus.setForeground(Color.RED);
		JPanel south = new JPanel();
		south.add(newPlayerOk);
		south.add(newPlayerCancel);
		newPlayerFrame.add(newPlayerStatus, BorderLayout.NORTH);
		newPlayerFrame.add(center, BorderLayout.CENTER);
		newPlayerFrame.add(south, BorderLayout.SOUTH);
		newPlayerOk.addActionListener(e -> addNewPlayer());
		newPlayerCancel.addActionListener(e -> playerName());
	}

	// Insert the typed player, showing inline validation instead of popups; on success
	// return to the players-select prompt.
	private void addNewPlayer(){
		String name = newPlayerField.getText().trim();
		if(name.isEmpty()){
			newPlayerStatus.setText("Player name cannot be empty.");
			return;
		}
		String sql = "insert into playerstats values (?,0,0,0,0,0,0,'n/a',0,'n/a')";
		try(PreparedStatement ps = con.prepareStatement(sql)){
			ps.setString(1, name);
			ps.executeUpdate();
		}
		catch(java.sql.SQLException ex){
			// A duplicate name violates the PRIMARY KEY; report it inline.
			newPlayerStatus.setText("\"" + name + "\" already exists or could not be added.");
			return;
		}
		playerName();
	}

	// A simple message overlay for load errors, matching the in-window prompt style so
	// notices don't rely on a separately-placed dialog.  OK dismisses back to the game.
	private void overlayMessage(String title, String msg){
		overlayMessage(title, msg, this::hideOverlay);
	}

	// Same overlay, but with a custom OK action (e.g. exiting on a fatal startup error).
	private void overlayMessage(String title, String msg, Runnable onOk){
		if(messageFrame == null){
			messageFrame = new JPanel(new BorderLayout());
			messageFrameText = new JLabel("", JLabel.CENTER);
			messageFrameText.setBorder(BorderFactory.createEmptyBorder(20,10,20,10));
			JPanel south = new JPanel();
			south.add(messageFrameOk);
			messageFrame.add(messageFrameText, BorderLayout.CENTER);
			messageFrame.add(south, BorderLayout.SOUTH);
			messageFrameOk.addActionListener(e -> messageOnOk.run());
		}
		messageOnOk = onOk;
		messageFrameText.setText("<html><div style='text-align:center;'>" + msg + "</div></html>");
		showOverlay(messageFrame, title);
	}

	// A Yes/No prompt rendered in the same in-window overlay style; used for the draw offer.
	private void overlayConfirm(String title, String msg, Runnable onYes, Runnable onNo){
		if(confirmFrame == null){
			confirmFrame = new JPanel(new BorderLayout());
			confirmText = new JLabel("", JLabel.CENTER);
			confirmText.setBorder(BorderFactory.createEmptyBorder(20,10,20,10));
			JPanel south = new JPanel();
			south.add(confirmYes);
			south.add(confirmNo);
			confirmFrame.add(confirmText, BorderLayout.CENTER);
			confirmFrame.add(south, BorderLayout.SOUTH);
			// Capture the handler before running it, since Yes may re-show this same prompt.
			confirmYes.addActionListener(e -> { Runnable r = confirmOnYes; r.run(); });
			confirmNo.addActionListener(e -> { Runnable r = confirmOnNo; r.run(); });
		}
		confirmOnYes = onYes;
		confirmOnNo = onNo;
		confirmText.setText("<html><div style='text-align:center;'>" + msg + "</div></html>");
		showOverlay(confirmFrame, title);
		// Force an explicit Yes/No: without this, the title-bar ✕ would consume the
		// (already-spent) draw offer without accepting or declining it.  "No" is the way out.
		overlayCloseButton.setEnabled(false);
	}

	// Number of player profiles in the database; used to require two before a game can start.
	private int playerCount(){
		int n = 0;
		try{
			ResultSet rs = stmt.executeQuery("select count(*) from playerstats");
			if(rs.next())
				n = rs.getInt(1);
			rs.close();
		}
		catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not count players: " + ex.getMessage());
		}
		return n;
	}

	// Refresh the bottom scoreboard with each player's running points and moves.
	private void updateScore(){
		if(player1 == null || player2 == null){
			p1Score.setText(" ");
			p2Score.setText(" ");
			return;
		}
		p1Score.setText(player1 + ":  " + P1points + " pts / " + P1moves + " moves");
		p2Score.setText(player2 + ":  " + P2points + " pts / " + P2moves + " moves");
	}

	private static class DamaMove{
		int fromRow, fromCol;
		int toRow, toCol;
		boolean jump;
		int captureRow, captureCol;   // square of the piece taken by this move (-1 if not a capture)
		DamaMove(int r1, int c1, int r2, int c2) {          // a quiet (non-capturing) move
			fromRow = r1;
			fromCol = c1;
			toRow = r2;
			toCol = c2;
			jump = false;
			captureRow = -1;
			captureCol = -1;
		}
		DamaMove(int r1, int c1, int r2, int c2, int capR, int capC) {   // a capturing move
			fromRow = r1;
			fromCol = c1;
			toRow = r2;
			toCol = c2;
			jump = true;
			captureRow = capR;
			captureCol = capC;
		}
		boolean isJump(){
			return jump;
		}
	}

	private class Board extends JPanel implements ActionListener, MouseListener{
		private static final long serialVersionUID = 1L;   // never serialized; UI state only
		transient DamaData board;
		boolean gameInProgress;
		boolean boardVisible;   // draw pieces only once a game has started (blank board before then)
		int currentPlayer;
		int selectedRow, selectedCol;
		transient DamaMove[] legalMoves;

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
			drawButton = new JButton("Draw");
			drawButton.addActionListener(this);
			newGameButton = new JButton("New Game");
			newGameButton.addActionListener(this);
			message = new JLabel("",JLabel.CENTER);
			message.setFont(new  Font("Serif", Font.BOLD, 14));
			message.setForeground(new Color(150,255,150));   // lightened green for contrast on dark red
			board = new DamaData();
			back.addActionListener(this);
			backToGame.addActionListener(this);
			newPlayer.addActionListener(this);
			playerProfOk.addActionListener(this);
			pointScoreBack.addActionListener(this);
			moveScoreBack.addActionListener(this);
			chooseP1.addActionListener(this);
			chooseP2.addActionListener(this);
                        playerListBack.addActionListener(this);
                        startGameButton.addActionListener(this);
		}

		public void actionPerformed(ActionEvent evt){
			Object src = evt.getSource();
			if(src == newGameButton || src == newGameItem)
				doNewGame();
			else if(src == resignButton)
				doResign();
			else if(src == drawButton)
				doDraw();
			else if(src == quitItem)
				System.exit(0);
			else if(src == byPointsMenu){
				byPointsScores();
			}
                        else if(src == byMovesMenu){
				byMovesScores();
			}
			else if(src == playerProfileMenu)
				showProfilePicker();
			else if(src == back){
				word.clear();
				highScoreVector.clear();
				showProfilePicker();   // swaps the profile prompt back to the player picker
			}
			else if(src == backToGame){
				word.clear();
				highScoreVector.clear();
				hideOverlay();
			}
			else if(src == newPlayer){
				newPlayerStatus.setText(" ");
				newPlayerField.setText("");
				showOverlay(newPlayerFrame, "New Player");
			}
			else if(src == playerProfOk){
				playerProfile();
			}
			else if(src == pointScoreBack){
				scores.clear();
				hideOverlay();
			}
			else if(src == moveScoreBack){
				scores.clear();
				hideOverlay();
			}
			else if(src == chooseP1){
                                chooseP1.setEnabled(false);
                                showPlayerList();   // rebuilds the list from the DB every time
				chooseP2.setEnabled(true);
			}
			else if(src == chooseP2){
                                showPlayerList();
			}
			else if(src == playerListBack){
                                if(select == null || select.isEmpty() || select.equals("null")){
                                    playerListStatus.setText("No player selected.  Create one with \"New Player\".");
                                    return;
                                }
                                if(player1Flag==true){
                                    player1 = select;
                                    player1Flag=false;
                                    chooseP1.setEnabled(false);
                                    showOverlay(P1, "Players Select");   // back to the picker to choose Player 2
                                }
                                else{
                                    if(select.equals(player1)){
                                        playerListStatus.setText("Player 2 must be different from Player 1.");
                                        return;
                                    }
                                    player2 = select;
                                    if(!playerQuery())   // don't start a game on stale stats
                                        return;
                                    player1Flag=true;
                                    hideOverlay();
                                    resignButton.setEnabled(true);
                                    drawButton.setEnabled(true);
                                    gameInProgress = true;
                                    boardVisible = true;   // reveal the pieces now that play has begun
                                    updateScore();
                                    message.setText(player1 + ":  Make your move.");
                                    repaint();   // show the movable-piece highlights immediately
                                }
			}
                        else if(src == startGameButton){
                                if(playerCount() < 2){
                                    p1Status.setText("Create at least two players before starting.");
                                    return;
                                }
                                startGameButton.setEnabled(false);
                                chooseP1.setEnabled(true);
                                newPlayer.setEnabled(false);
                        }
		}

		void doNewGame(){
			player1Flag = true;   // selecting the next game always starts with Player 1
			playerName();
			board.setUpGame();
			boardVisible = false;   // hide pieces until this game actually starts, even after a prior game
			P1points = 0;
			P1moves = 0;
			P2points = 0;
			P2moves = 0;
			p1DrawSpent = false;   // each player gets a fresh draw offer every game
			p2DrawSpent = false;
			currentPlayer = DamaData.RED;
			legalMoves = board.getLegalMoves(DamaData.RED);
			selectedRow = -1;
			newGameButton.setEnabled(false);
			newGameItem.setEnabled(false);
			updateScore();
			repaint();
		}

		void doResign(){
			if(gameInProgress == false){
				message.setText("There is no game in progress!");
				return;
			}
			// Resign ends the game with no undo, so (like Draw) require an explicit confirm
			// from the player to move before it takes effect -- a stray click no longer loses.
			String resigner = (currentPlayer == DamaData.RED) ? player1 : player2;
			overlayConfirm("Resign", resigner + ", are you sure you want to resign?",
				() -> { hideOverlay(); finishResign(); },
				() -> hideOverlay());   // backs out: the game continues
		}

		void finishResign(){
			if(currentPlayer == DamaData.RED){
				P2points+=10;
				gameOver(player1 + " resigns.  " + player2 + " wins.");
				player2win();
			}
			else{
				P1points+=10;
				gameOver(player2 + " resigns.  " + player1 + " wins.");
				player1win();
			}
			// Tallies are left on the scoreboard and reset by the next doNewGame().
		}

		void doDraw(){
			if(gameInProgress == false){
				message.setText("There is no game in progress!");
				return;
			}
			boolean offererIsP1 = (currentPlayer == DamaData.RED);
			String offerer  = offererIsP1 ? player1 : player2;
			String opponent = offererIsP1 ? player2 : player1;
			if(offererIsP1 ? p1DrawSpent : p2DrawSpent){
				message.setText(offerer + " has already used their draw offer.");
				return;
			}
			// Step 1: confirm the offering player actually wants to offer a draw.
			overlayConfirm("Draw Offer", offerer + ", do you want to offer a draw?",
				() -> {
					// The offer is now spent whether or not the opponent accepts.
					if(offererIsP1) p1DrawSpent = true; else p2DrawSpent = true;
					// Step 2: ask the opponent to accept or decline.
					overlayConfirm("Draw Offer",
						offerer + " offers a draw.<br>" + opponent + ", do you agree?",
						() -> { hideOverlay(); finishDraw(); },
						() -> {
							hideOverlay();
							message.setText(opponent + " declined the draw.");
							if(p1DrawSpent && p2DrawSpent)
								drawButton.setEnabled(false);
						});
				},
				() -> hideOverlay());   // offerer backs out: nothing is spent
		}

		void finishDraw(){
			gameOver(player1 + " and " + player2 + " agree to a draw.");
			gameDraw();
			// Tallies are left on the scoreboard and reset by the next doNewGame().
		}

		void gameOver(String str){
			message.setText(str);
			newGameButton.setEnabled(true);
			newGameItem.setEnabled(true);
			resignButton.setEnabled(false);
			drawButton.setEnabled(false);
			gameInProgress = false;
			updateScore();   // leave the final points/moves on screen
		}

		void doClickSquare(int row, int col){
			for(int i = 0; i < legalMoves.length; i++)
				if(legalMoves[i].fromRow == row && legalMoves[i].fromCol == col){
					selectedRow = row;
					selectedCol = col;
					if(currentPlayer == DamaData.RED)
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

		void doMakeMove(DamaMove move){
			// Promotion ends the turn: a man crowned by this move may NOT keep capturing as a king.
			// makeMove crowns (and returns true) only when the man had no further capture, so if it
			// fired we must stop here rather than re-evaluating (now flying-king) jumps from that square.
			boolean justPromoted = board.makeMove(move);
			if(move.isJump() && !justPromoted){
				legalMoves = board.getLegalJumpsFrom(currentPlayer,move.toRow,move.toCol);
				if(legalMoves != null){
					// A multi-jump chain is still a single move: don't score mid-chain,
					// the move point and king bonus are awarded once when the turn ends.
					if(currentPlayer == DamaData.RED)
						message.setText(player1 + ":  You must continue jumping.");
					else
						message.setText(player2 + ":  You must continue jumping.");
					selectedRow = move.toRow;
					selectedCol = move.toCol;
					repaint();
					return;
				}
			}
			// The capture chain is over (or this was a quiet move): remove the jumped pieces that
			// were held on the board as blockers, so the opponent's turn sees a clean position.
			board.clearCaptured();
			if(currentPlayer == DamaData.RED){
				// RED (player1) just completed a turn: +1 for the move, +5 if promoted this turn, and count the move.
				P1points++;
				if(justPromoted)
					P1points+=5;
				P1moves++;
				currentPlayer = DamaData.BLACK;
				legalMoves = board.getLegalMoves(currentPlayer);
				if(legalMoves == null){
					gameOver(player2 + " has no moves.  " + player1 + " wins.");
					player1win();
				}
				else if(legalMoves[0].isJump())
					message.setText(player2 + ":  Make your move.  You must jump.");
				else
					message.setText(player2 + ":  Make your move.");
			}
			else{
				// BLACK (player2) just completed a turn: +1 for the move, +5 if promoted this turn, and count the move.
				P2points++;
				if(justPromoted)
					P2points+=5;
				P2moves++;
				currentPlayer = DamaData.RED;
				legalMoves = board.getLegalMoves(currentPlayer);
				if(legalMoves == null){
					gameOver(player1 + " has no moves.  " + player2 +" wins.");
					player2win();
				}
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
			updateScore();
			repaint();
		}

		public void paintComponent(Graphics g){
                        super.paintComponent(g);   // honor the opaque JPanel contract before custom drawing
                        g.setColor(Color.black);
			g.drawRect(0,0,getSize().width-1,getSize().height-1);
			g.drawRect(1,1,getSize().width-3,getSize().height-3);
			int piece = CELL - 6;          // piece diameter, leaving a small margin in the cell
			Font kingFont = g.getFont().deriveFont(Font.BOLD, CELL*0.6f);
                        for(int row = 0; row < 8; row++){
				for(int col = 0; col < 8; col++){
					if( row % 2 == col % 2 )
						g.setColor(new Color(238,221,180));  // playable squares (pieces sit here): light, so RED and BLACK both stand out
					else
						g.setColor(new Color(120,80,50));    // non-playable squares: dark
					int x = BMARGIN + col*CELL, y = BMARGIN + row*CELL;
					g.fillRect(x, y, CELL, CELL);
					if(boardVisible)
					switch(board.pieceAt(row,col)){
						case DamaData.RED:
							g.setColor(Color.RED);
							g.fillOval(x+3, y+3, piece, piece);
							break;
						case DamaData.BLACK:
							g.setColor(Color.BLACK);
							g.fillOval(x+3, y+3, piece, piece);
							break;
						case DamaData.RED_KING:
							g.setColor(Color.RED);
							g.fillOval(x+3, y+3, piece, piece);
							g.setColor(Color.WHITE);
							g.setFont(kingFont);
							g.drawString("K", x + CELL/2 - 4, y + CELL/2 + 6);
							break;
						case DamaData.BLACK_KING:
							g.setColor(Color.BLACK);
							g.fillOval(x+3, y+3, piece, piece);
							g.setColor(Color.WHITE);
							g.setFont(kingFont);
							g.drawString("K", x + CELL/2 - 4, y + CELL/2 + 6);
							break;
					}
				}
			}
			if(gameInProgress){
				g.setColor(Color.cyan);
				for(int i = 0; i < legalMoves.length; i++)
					highlight(g, legalMoves[i].fromRow, legalMoves[i].fromCol);
				if(selectedRow >= 0){
					g.setColor(Color.white);
					highlight(g, selectedRow, selectedCol);
					g.setColor(Color.green);
					for(int i = 0; i < legalMoves.length; i++)
						if(legalMoves[i].fromCol == selectedCol && legalMoves[i].fromRow == selectedRow)
							highlight(g, legalMoves[i].toRow, legalMoves[i].toCol);
				}
			}

		}

		// Draw a 2px-thick outline around the square at (row,col) in the current color.
		private void highlight(Graphics g, int row, int col){
			int x = BMARGIN + col*CELL, y = BMARGIN + row*CELL;
			g.drawRect(x, y, CELL-1, CELL-1);
			g.drawRect(x+1, y+1, CELL-3, CELL-3);
		}

		public void mousePressed(MouseEvent evt){
			if(gameInProgress == false)
				message.setText("Click \"New Game\" to start a new game.");
			else{
				int x = evt.getX() - BMARGIN;
				int y = evt.getY() - BMARGIN;
				// Guard the margin explicitly: a negative x/y truncates to column/row 0 otherwise.
				if(x >= 0 && y >= 0){
					int col = x / CELL;
					int row = y / CELL;
					if (col < 8 && row < 8)
						doClickSquare(row,col);
				}
			}
		}

		public void mouseReleased(MouseEvent evt) { }
		public void mouseClicked(MouseEvent evt) { }
		public void mouseEntered(MouseEvent evt) { }
		public void mouseExited(MouseEvent evt) { }
	}

	private static class DamaData{
		static final int EMPTY = 0, RED = 1, RED_KING = 2, BLACK = 3, BLACK_KING = 4;
		// A piece already jumped in the current capture chain: it stays on the board as a blocker
		// (can't be re-jumped, can't be flown over or landed on) until the whole turn ends, then
		// clearCaptured() sweeps every marker back to EMPTY.  Never rendered (paint ignores it).
		static final int CAPTURED = 5;
		int[][] board;

		DamaData(){
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

		// The four diagonal directions, shared by every move/capture scan.
		private static final int[][] DIRS = {{-1,-1},{-1,1},{1,-1},{1,1}};

		// Apply the move; returns true if it crowned a man this turn (so the caller can award
		// the king bonus and end the turn).
		boolean makeMove(DamaMove move){
			board[move.toRow][move.toCol] = board[move.fromRow][move.fromCol];
			board[move.fromRow][move.fromCol] = EMPTY;
			if(move.jump)
				// Mark, don't remove: the taken piece blocks the rest of this chain and is
				// only cleared (clearCaptured) once the turn ends.
				board[move.captureRow][move.captureCol] = CAPTURED;
			// A man that STOPS on the far row is crowned (dama).  If this was a capture and the
			// same man can immediately keep capturing, it stays a man and jumps on, crowning only
			// when it finally comes to rest on the far row.
			if(move.toRow == 0 && board[move.toRow][move.toCol] == RED){
				if(!(move.jump && getLegalJumpsFrom(RED, move.toRow, move.toCol) != null)){
					board[move.toRow][move.toCol] = RED_KING;
					return true;
				}
			}
			if(move.toRow == 7 && board[move.toRow][move.toCol] == BLACK){
				if(!(move.jump && getLegalJumpsFrom(BLACK, move.toRow, move.toCol) != null)){
					board[move.toRow][move.toCol] = BLACK_KING;
					return true;
				}
			}
			return false;
		}

		// Filipino Dama, turn start.  Captures are mandatory and the MAXIMUM-capture rule applies:
		// if any capture exists, only the first steps of the longest capture sequence(s) are legal.
		DamaMove[] getLegalMoves(int player){
			if(player != RED && player != BLACK)
				return null;
			ArrayList<DamaMove> caps = new ArrayList<DamaMove>();
			ArrayList<Integer> lens = new ArrayList<Integer>();
			int globalMax = 0;
			for(int row = 0; row < 8; row++){
				for(int col = 0; col < 8; col++){
					if(isOwn(board[row][col], player)){
						boolean king = isKing(board[row][col]);
						for(DamaMove m : immediateCaptures(board, player, king, row, col)){
							int len = 1 + maxCaptures(afterCapture(board, m), player, king, m.toRow, m.toCol);
							caps.add(m);
							lens.add(len);
							if(len > globalMax)
								globalMax = len;
						}
					}
				}
			}
			if(globalMax > 0){
				ArrayList<DamaMove> best = new ArrayList<DamaMove>();
				for(int i = 0; i < caps.size(); i++)
					if(lens.get(i) == globalMax)
						best.add(caps.get(i));
				return best.toArray(new DamaMove[0]);
			}
			ArrayList<DamaMove> moves = new ArrayList<DamaMove>();
			for(int row = 0; row < 8; row++)
				for(int col = 0; col < 8; col++)
					if(isOwn(board[row][col], player)){
						boolean king = isKing(board[row][col]);
						moves.addAll(immediateMoves(board, player, king, row, col));
					}
			if(moves.isEmpty())
				return null;
			return moves.toArray(new DamaMove[0]);
		}

		// Continuation of a multi-capture from (row,col); the maximum-capture rule applies here too.
		DamaMove[] getLegalJumpsFrom(int player, int row, int col){
			if(player != RED && player != BLACK)
				return null;
			if(!isOwn(board[row][col], player))
				return null;
			boolean king = isKing(board[row][col]);
			ArrayList<DamaMove> caps = immediateCaptures(board, player, king, row, col);
			if(caps.isEmpty())
				return null;
			ArrayList<Integer> lens = new ArrayList<Integer>();
			int max = 0;
			for(DamaMove m : caps){
				int len = 1 + maxCaptures(afterCapture(board, m), player, king, m.toRow, m.toCol);
				lens.add(len);
				if(len > max)
					max = len;
			}
			ArrayList<DamaMove> best = new ArrayList<DamaMove>();
			for(int i = 0; i < caps.size(); i++)
				if(lens.get(i) == max)
					best.add(caps.get(i));
			return best.toArray(new DamaMove[0]);
		}

		// Longest chain of captures reachable from (r,c) on board b, treating the piece as fixed
		// (a man stays a man, a king stays a king) since promotion only happens when the turn ends.
		private int maxCaptures(int[][] b, int player, boolean king, int r, int c){
			int best = 0;
			for(DamaMove m : immediateCaptures(b, player, king, r, c)){
				int len = 1 + maxCaptures(afterCapture(b, m), player, king, m.toRow, m.toCol);
				if(len > best)
					best = len;
			}
			return best;
		}

		// All single captures available right now to a piece at (r,c): a man takes an adjacent enemy
		// in any diagonal direction; a king flies over the first enemy on a diagonal and lands on any
		// empty square beyond it.
		private ArrayList<DamaMove> immediateCaptures(int[][] b, int player, boolean king, int r, int c){
			ArrayList<DamaMove> caps = new ArrayList<DamaMove>();
			for(int[] d : DIRS){
				int dr = d[0], dc = d[1];
				if(!king){
					int mr = r + dr, mc = c + dc, lr = r + 2*dr, lc = c + 2*dc;
					if(inBounds(lr, lc) && isEnemy(b[mr][mc], player) && b[lr][lc] == EMPTY)
						caps.add(new DamaMove(r, c, lr, lc, mr, mc));
				}
				else{
					int i = 1;
					while(inBounds(r + i*dr, c + i*dc) && b[r + i*dr][c + i*dc] == EMPTY)
						i++;
					if(!inBounds(r + i*dr, c + i*dc))
						continue;                         // ran off the board with nothing to take
					int pr = r + i*dr, pc = c + i*dc;
					if(!isEnemy(b[pr][pc], player))
						continue;                         // first piece met is our own: blocked
					for(int j = i + 1; inBounds(r + j*dr, c + j*dc) && b[r + j*dr][c + j*dc] == EMPTY; j++)
						caps.add(new DamaMove(r, c, r + j*dr, c + j*dc, pr, pc));
				}
			}
			return caps;
		}

		// All quiet moves for a piece at (r,c): a man steps one square diagonally forward; a king
		// slides any number of empty squares along a diagonal.
		private ArrayList<DamaMove> immediateMoves(int[][] b, int player, boolean king, int r, int c){
			ArrayList<DamaMove> mv = new ArrayList<DamaMove>();
			if(!king){
				int dr = (player == RED) ? -1 : 1;        // men move forward only
				for(int dc = -1; dc <= 1; dc += 2)
					if(inBounds(r + dr, c + dc) && b[r + dr][c + dc] == EMPTY)
						mv.add(new DamaMove(r, c, r + dr, c + dc));
			}
			else{
				for(int[] d : DIRS)
					for(int i = 1; inBounds(r + i*d[0], c + i*d[1]) && b[r + i*d[0]][c + i*d[1]] == EMPTY; i++)
						mv.add(new DamaMove(r, c, r + i*d[0], c + i*d[1]));
			}
			return mv;
		}

		// A copy of b with a capture applied for lookahead.  The taken piece is left as a CAPTURED
		// blocker (not removed), so chain-length lookahead honors the same "can't re-cross a jumped
		// piece" rule the real board does.
		private int[][] afterCapture(int[][] b, DamaMove m){
			int[][] n = new int[8][8];
			for(int r = 0; r < 8; r++)
				System.arraycopy(b[r], 0, n[r], 0, 8);
			n[m.toRow][m.toCol] = n[m.fromRow][m.fromCol];
			n[m.fromRow][m.fromCol] = EMPTY;
			n[m.captureRow][m.captureCol] = CAPTURED;
			return n;
		}

		// Sweep every CAPTURED blocker back to EMPTY: called once the capture chain (the turn) ends.
		void clearCaptured(){
			for(int r = 0; r < 8; r++)
				for(int c = 0; c < 8; c++)
					if(board[r][c] == CAPTURED)
						board[r][c] = EMPTY;
		}

		private boolean isKing(int piece){
			return piece == RED_KING || piece == BLACK_KING;
		}

		private boolean isOwn(int piece, int player){
			if(player == RED)
				return piece == RED || piece == RED_KING;
			return piece == BLACK || piece == BLACK_KING;
		}

		private boolean isEnemy(int piece, int player){
			if(player == RED)
				return piece == BLACK || piece == BLACK_KING;
			return piece == RED || piece == RED_KING;
		}

		private boolean inBounds(int r, int c){
			return r >= 0 && r < 8 && c >= 0 && c < 8;
		}
	}

	// Opens the player picker for the Statistics > Player Profile view (choose a name, then OK).
	public void showProfilePicker(){
		highScoreVector.clear();     // rebuild the name list from the DB every time
		try{
			ResultSet rs = stmt.executeQuery(queryString);
			while(rs.next()){
				String temp = rs.getString("name");
				highScoreVector.add(temp);
			}
			rs.close();
			// Build a fresh combo box each open so we don't stack duplicate ItemListeners.
			box2 = new JComboBox<String>(highScoreVector);
			if(highScoreVector.size() > 0)
				select2 = "" + box2.getItemAt(0);
			box2.addItemListener(
				new ItemListener(){
					public void itemStateChanged(ItemEvent event2){
						if(event2.getStateChange()==ItemEvent.SELECTED){
							select2 = "" + box2.getSelectedItem();
						}
					}
				}
			);
			highFrame.removeAll();
			highFrame.setLayout(new FlowLayout(FlowLayout.LEFT));
			highFrame.add(box2);
			highFrame.add(playerProfOk);
			showOverlay(highFrame, "Select Player");
		}
		catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not load high scores: " + ex.getMessage());
		}
	}
	
	public void playerProfile(){
		String newQuery = "select * from playerstats where name = ?";
		try(PreparedStatement ps = con.prepareStatement(newQuery)){
			ps.setString(1, select2);
			ResultSet rs = ps.executeQuery();
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
			rs.close();
			String rows[][] = new String[word.size()/10][10];
			int comp = word.size()/10;
			for(int k = 0; k < comp; k++){
				for(int count = 0; count<10; count++){
					rows[k][count] = String.valueOf(word.pop());
				}
			}
			String columns[] = { "Name","Games Played", "Total Points" , "Games Win", "Games Lose", "Games Draw", "Highest Point", "Opponent (Pts)", "Fewest Moves", "Opponent (Moves)"};
			JTable table3 = new JTable(rows,columns);
			table3.revalidate();
			table3.setAutoCreateRowSorter(true);
			table3.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
			JScrollPane scrollPane = new JScrollPane(table3);
			f.removeAll();   // avoid stacking a new table on each open
			f.setLayout(new BorderLayout());
			f.add(scrollPane, BorderLayout.CENTER);
			JPanel backPanel = new JPanel();
			backPanel.setLayout(new GridLayout(1,2));
			backPanel.add(back);
			backPanel.add(backToGame);
			f.add(backPanel, BorderLayout.SOUTH);
			showOverlay(f, "Player Profile");
		}
		catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not load player profile: " + ex.getMessage());
		}
	}

	public void playerName(){
                // Open the picker in the same state every time: you can add players (repeatedly)
                // and must click "Start Game" to begin choosing Player 1 then Player 2.
                startGameButton.setEnabled(true);
                newPlayer.setEnabled(true);
                chooseP1.setEnabled(false);
                chooseP2.setEnabled(false);
                p1Status.setText(" ");
		showOverlay(P1, "Players Select");
	}
	
	public void databaseConnect(){
		try{
			// Step 1: Load the embedded SQLite JDBC driver and make sure the data directory exists.
			new java.io.File(dbDir).mkdirs();
			Class.forName("org.sqlite.JDBC");
			// Step 2: Establish the connection to the local database file (created on first run).
			con = DriverManager.getConnection(url);
			stmt = con.createStatement();
			// Step 3: Create the stats table on first run if it does not exist yet.
			stmt.executeUpdate(
				"CREATE TABLE IF NOT EXISTS playerstats (" +
				"name TEXT PRIMARY KEY, gamesplayed INTEGER, totalpoints INTEGER, " +
				"gameswin INTEGER, gameslose INTEGER, gamesdraw INTEGER, " +
				"highestpoint INTEGER, opponentpoint TEXT, fewestmoves INTEGER, opponentmoves TEXT)");
		}
		catch(java.sql.SQLException ex){
			// Without a database the app cannot store or read any stats: show the error
			// in-window and exit on OK, rather than leaving con/stmt null and NPE-ing later.
			fatalError("Could not open the database:<br>" + ex.getMessage());
		}
		catch(ClassNotFoundException cnfe){
			fatalError("SQLite driver not found on the classpath:<br>" + cnfe.getMessage());
		}
	}

	// Show a fatal error in the overlay; the only action (OK) quits, and ✕ is locked so the
	// app can't be left running without a database.
	private void fatalError(String msg){
		overlayMessage("Fatal error", msg, () -> System.exit(1));
		overlayCloseButton.setEnabled(false);
	}
	
	public void byPointsScores(){
		int i = 0;
		String descQuery = "select name, highestpoint, opponentpoint from playerstats where highestpoint > 0 order by highestpoint DESC";
		try{
			ResultSet rs = stmt.executeQuery(descQuery);
			while(rs.next()&&i<3){
				String temp = rs.getString("name");
				scores.add(temp);
				temp = rs.getString("highestpoint");
				scores.add(temp);
				temp = rs.getString("opponentpoint");
				scores.add(temp);
				i++;
			}
			rs.close();
		}
		catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not load high scores: " + ex.getMessage());
			return;
		}
		String rows[][] = new String[scores.size()/3][3];
		int comp = scores.size()/3;
		for(int k = 0; k < comp; k++){
			for(int count = 0; count<3; count++){
				rows[k][count] = String.valueOf(scores.pop());
			}
		}
		String columns[] = { "Name","Highest Point", "Opponent (Pts)"};
		JTable table2 = new JTable(rows,columns);
		table2.revalidate();
		table2.setAutoCreateRowSorter(true);
		table2.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
		JScrollPane scrollPane = new JScrollPane(table2);
		pointScoreFrame.removeAll();
		pointScoreFrame.setLayout(new BorderLayout());
		pointScoreFrame.add(scrollPane, BorderLayout.CENTER);
		pointScoreFrame.add(pointScoreBack,BorderLayout.SOUTH);
		showOverlay(pointScoreFrame, "Top 3 by Points");
	}
	
	public void byMovesScores(){
		int i = 0;
		String descQuery = "select name, fewestmoves, opponentmoves from playerstats where fewestmoves > 0 order by fewestmoves ASC";
		try{
			ResultSet rs = stmt.executeQuery(descQuery);
			while(rs.next()&&i<3){
				String temp = rs.getString("name");
				scores.add(temp);
				temp = rs.getString("fewestmoves");
				scores.add(temp);
				temp = rs.getString("opponentmoves");
				scores.add(temp);
				i++;
			}
			rs.close();
		}
		catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not load high scores: " + ex.getMessage());
			return;
		}
		String rows[][] = new String[scores.size()/3][3];
		int comp = scores.size()/3;
		for(int k = 0; k < comp; k++){
			for(int count = 0; count<3; count++){
				rows[k][count] = String.valueOf(scores.pop());
			}
		}
		String columns[] = { "Name","Fewest Moves", "Opponent (Moves)"};
		JTable table = new JTable(rows,columns);
		table.setAutoCreateRowSorter(true);
		table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
		JScrollPane scrollPane = new JScrollPane(table);
		moveScoreFrame.removeAll();
		moveScoreFrame.setLayout(new BorderLayout());
		moveScoreFrame.add(scrollPane, BorderLayout.CENTER);
		moveScoreFrame.add(moveScoreBack,BorderLayout.SOUTH);
		showOverlay(moveScoreFrame, "Top 3 by Moves");
	}
	
	public boolean playerQuery(){
		String newQuery = "select * from playerstats where name = ?";
		String temp2 = new String();
		try(PreparedStatement ps = con.prepareStatement(newQuery)){
			ps.setString(1, player1);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String temp = rs.getString("name");
				playerData.add(temp);
				temp = rs.getString("gamesplayed");
				playerData.add(temp);
				temp = rs.getString("totalpoints");
				playerData.add(temp);
				temp = rs.getString("gameswin");
				playerData.add(temp);
				temp = rs.getString("gameslose");
				playerData.add(temp);
				temp = rs.getString("gamesdraw");
				playerData.add(temp);
				temp = rs.getString("highestpoint");
				playerData.add(temp);
				temp = rs.getString("opponentpoint");
				playerData.add(temp);
				temp = rs.getString("fewestmoves");
				playerData.add(temp);
				temp = rs.getString("opponentmoves");
				playerData.add(temp);
			}
			rs.close();
			ps.setString(1, player2);
			rs = ps.executeQuery();
			while(rs.next()){
				String temp = rs.getString("name");
				playerData.add(temp);
				temp = rs.getString("gamesplayed");
				playerData.add(temp);
				temp = rs.getString("totalpoints");
				playerData.add(temp);
				temp = rs.getString("gameswin");
				playerData.add(temp);
				temp = rs.getString("gameslose");
				playerData.add(temp);
				temp = rs.getString("gamesdraw");
				playerData.add(temp);
				temp = rs.getString("highestpoint");
				playerData.add(temp);
				temp = rs.getString("opponentpoint");
				playerData.add(temp);
				temp = rs.getString("fewestmoves");
				playerData.add(temp);
				temp = rs.getString("opponentmoves");
				playerData.add(temp);
			}
			rs.close();
		}
		catch(java.sql.SQLException ex){
			// A failed load leaves the stat fields stale, so refuse to start the game
			// rather than later writing corrupted totals back to the database.
			overlayMessage("Error", "Could not load player stats: " + ex.getMessage());
			return false;
		}
		for(int ctr = 0; ctr<playerData.size(); ctr++){
			switch(ctr){
				case 1:	temp2 = String.valueOf(playerData.get(ctr));
						gamesPlayed = Integer.parseInt(temp2);
						break;
				case 2:	temp2 = String.valueOf(playerData.get(ctr));
						totalPoints = Integer.parseInt(temp2);
						break;
				case 3:	temp2 = String.valueOf(playerData.get(ctr));
						gamesWin = Integer.parseInt(temp2);
						break;
				case 4:	temp2 = String.valueOf(playerData.get(ctr));
						gamesLose = Integer.parseInt(temp2);
						break;
				case 5:	temp2 = String.valueOf(playerData.get(ctr));
						gamesDraw = Integer.parseInt(temp2);
						break;
				case 6:	temp2 = String.valueOf(playerData.get(ctr));
						highestPoint = Integer.parseInt(temp2);
						break;
				case 7: opponentPoint = String.valueOf(playerData.get(ctr));
						break;
				case 8:	temp2 = String.valueOf(playerData.get(ctr));
						fewestMoves = Integer.parseInt(temp2);
						break;
				case 9: opponentMoves = String.valueOf(playerData.get(ctr));
						break;
				case 11:temp2 = String.valueOf(playerData.get(ctr));
						gamesPlayed2 = Integer.parseInt(temp2);
						break;
				case 12:temp2 = String.valueOf(playerData.get(ctr));
						totalPoints2 = Integer.parseInt(temp2);
						break;
				case 13:temp2 = String.valueOf(playerData.get(ctr));
						gamesWin2 = Integer.parseInt(temp2);
						break;
				case 14:temp2 = String.valueOf(playerData.get(ctr));
						gamesLose2 = Integer.parseInt(temp2);
						break;
				case 15:temp2 = String.valueOf(playerData.get(ctr));
						gamesDraw2 = Integer.parseInt(temp2);
						break;
				case 16:temp2 = String.valueOf(playerData.get(ctr));
						highestPoint2 = Integer.parseInt(temp2);
						break;
				case 17:opponentPoint2 = String.valueOf(playerData.get(17));
						break;
				case 18:temp2 = String.valueOf(playerData.get(ctr));
						fewestMoves2 = Integer.parseInt(temp2);
						break;
				case 19:opponentMoves2 = String.valueOf(playerData.get(19));
						break;
			}
		}
		return true;
	}

	public void player1win(){
		gamesPlayed++;
		gamesPlayed2++;
		totalPoints = totalPoints + P1points;
		totalPoints2 = totalPoints2 + P2points;
		gamesWin++;
		gamesLose2++;
		if(P1points>highestPoint){
			highestPoint = P1points;
			opponentPoint = String.valueOf(playerData.get(10));
		}
		if(P2points>highestPoint2){
			highestPoint2 = P2points;
			opponentPoint2 = String.valueOf(playerData.get(0));
		}
		// "Fewest moves to win": only the winner (player1) records it, and 0 means "no record yet".
		// Require P1moves>0 so a 0-move win (opponent resigned before the winner moved) never writes
		// the 0 sentinel as a real record -- which would then be hidden by the fewestmoves>0 filter.
		if(P1moves>0 && (fewestMoves==0 || P1moves<fewestMoves)){
			fewestMoves = P1moves;
			opponentMoves = String.valueOf(playerData.get(10));
		}
		String winnerSql = "UPDATE playerstats SET gamesplayed=?, totalpoints=?, gameswin=?, highestpoint=?, opponentpoint=?, fewestmoves=?, opponentmoves=? WHERE name=?";
		String loserSql  = "UPDATE playerstats SET gamesplayed=?, totalpoints=?, gameslose=?, highestpoint=?, opponentpoint=?, fewestmoves=?, opponentmoves=? WHERE name=?";
		try(PreparedStatement w = con.prepareStatement(winnerSql);
		    PreparedStatement l = con.prepareStatement(loserSql)){
			w.setInt(1, gamesPlayed); w.setInt(2, totalPoints); w.setInt(3, gamesWin);
			w.setInt(4, highestPoint); w.setString(5, opponentPoint); w.setInt(6, fewestMoves);
			w.setString(7, opponentMoves); w.setString(8, player1);
			w.executeUpdate();
			l.setInt(1, gamesPlayed2); l.setInt(2, totalPoints2); l.setInt(3, gamesLose2);
			l.setInt(4, highestPoint2); l.setString(5, opponentPoint2); l.setInt(6, fewestMoves2);
			l.setString(7, opponentMoves2); l.setString(8, player2);
			l.executeUpdate();
		}catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not save game result: " + ex.getMessage());
		}
                purge();
	}
	
	public void player2win(){
		gamesPlayed2++;
		gamesPlayed++;
		totalPoints2 = totalPoints2 + P2points;
		totalPoints = totalPoints + P1points;
		gamesWin2++;
		gamesLose++;
		if(P2points>highestPoint2){
			highestPoint2 = P2points;
			opponentPoint2 = String.valueOf(playerData.get(0));
		}
		// "Fewest moves to win": only the winner (player2) records it, and 0 means "no record yet".
		// Require P2moves>0 so a 0-move win (opponent resigned before the winner moved) never writes
		// the 0 sentinel as a real record -- which would then be hidden by the fewestmoves>0 filter.
		if(P2moves>0 && (fewestMoves2==0 || P2moves<fewestMoves2)){
			fewestMoves2 = P2moves;
			opponentMoves2 = String.valueOf(playerData.get(0));
		}
		if(P1points>highestPoint){
			highestPoint = P1points;
			opponentPoint = String.valueOf(playerData.get(10));
		}
		// player1 lost this game, so it sets no "fewest moves to win" record for them.
		String winnerSql = "UPDATE playerstats SET gamesplayed=?, totalpoints=?, gameswin=?, highestpoint=?, opponentpoint=?, fewestmoves=?, opponentmoves=? WHERE name=?";
		String loserSql  = "UPDATE playerstats SET gamesplayed=?, totalpoints=?, gameslose=?, highestpoint=?, opponentpoint=?, fewestmoves=?, opponentmoves=? WHERE name=?";
		try(PreparedStatement w = con.prepareStatement(winnerSql);
		    PreparedStatement l = con.prepareStatement(loserSql)){
			w.setInt(1, gamesPlayed2); w.setInt(2, totalPoints2); w.setInt(3, gamesWin2);
			w.setInt(4, highestPoint2); w.setString(5, opponentPoint2); w.setInt(6, fewestMoves2);
			w.setString(7, opponentMoves2); w.setString(8, player2);
			w.executeUpdate();
			l.setInt(1, gamesPlayed); l.setInt(2, totalPoints); l.setInt(3, gamesLose);
			l.setInt(4, highestPoint); l.setString(5, opponentPoint); l.setInt(6, fewestMoves);
			l.setString(7, opponentMoves); l.setString(8, player1);
			l.executeUpdate();
		}catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not save game result: " + ex.getMessage());
		}
                purge();
	}
	
	public void gameDraw(){
		gamesPlayed++;
		gamesPlayed2++;
		totalPoints = totalPoints + P1points;
		totalPoints2 = totalPoints2 + P2points;
		gamesDraw++;
		gamesDraw2++;
		if(P1points>highestPoint){
			highestPoint = P1points;
			opponentPoint = String.valueOf(playerData.get(10));
		}
		if(P2points>highestPoint2){
			highestPoint2 = P2points;
			opponentPoint2 = String.valueOf(playerData.get(0));
		}
		// A draw is not a win, so it sets no "fewest moves to win" record for either player.
		String drawSql = "UPDATE playerstats SET gamesplayed=?, totalpoints=?, gamesdraw=?, highestpoint=?, opponentpoint=?, fewestmoves=?, opponentmoves=? WHERE name=?";
		try(PreparedStatement p1 = con.prepareStatement(drawSql);
		    PreparedStatement p2 = con.prepareStatement(drawSql)){
			p1.setInt(1, gamesPlayed); p1.setInt(2, totalPoints); p1.setInt(3, gamesDraw);
			p1.setInt(4, highestPoint); p1.setString(5, opponentPoint); p1.setInt(6, fewestMoves);
			p1.setString(7, opponentMoves); p1.setString(8, player1);
			p1.executeUpdate();
			p2.setInt(1, gamesPlayed2); p2.setInt(2, totalPoints2); p2.setInt(3, gamesDraw2);
			p2.setInt(4, highestPoint2); p2.setString(5, opponentPoint2); p2.setInt(6, fewestMoves2);
			p2.setString(7, opponentMoves2); p2.setString(8, player2);
			p2.executeUpdate();
		}catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not save game result: " + ex.getMessage());
		}
                purge();
	}

	public void showPlayerList(){
		String newQuery = "select name from playerstats";
		playerList.clear();          // rebuild from the DB so newly added players appear
		try{
			ResultSet rs = stmt.executeQuery(newQuery);
			while(rs.next()){
				String temp = rs.getString("name");
				playerList.add(temp);
			}
			rs.close();
			box = new JComboBox<String>(playerList);
			if(playerList.size() > 0){
				box.setSelectedIndex(0);
				select = "" + box.getSelectedItem();
			}
                        box.addItemListener(
				new ItemListener(){
					public void itemStateChanged(ItemEvent event){
						if(event.getStateChange()==ItemEvent.SELECTED){
							select = "" + box.getSelectedItem();
						}
					}
				}
			);
			// Rebuild the contents each time so a refreshed combo box replaces the old one
			// instead of stacking duplicates.
			playerListFrame.removeAll();
			playerListFrame.setLayout(new FlowLayout(FlowLayout.LEFT));
			playerListFrame.add(box);
			playerListFrame.add(playerListBack);
			playerListStatus.setText(" ");
			playerListFrame.add(playerListStatus);
			showOverlay(playerListFrame, "Player List");
		}
		catch(java.sql.SQLException ex){
			overlayMessage("Error", "Could not load player list: " + ex.getMessage());
		}
	}
        
        public void purge(){
            word.clear();
            scores.clear();
            playerData.clear();
        }
}