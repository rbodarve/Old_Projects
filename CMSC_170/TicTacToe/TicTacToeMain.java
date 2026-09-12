/* Programmers: Renaire Odarve, Jon Daniel Palmares
Laboratory Exercise 2: Tic-Tac-Toe, Date Due: August 1, 2012 */


//package odarve;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class TicTacToeMain extends JFrame implements ActionListener {

    private JButton[][] buttons = new JButton[3][3];
    private JButton playButton = new JButton("Play");
    private JLabel statusLabel = new JLabel("");
    private TicTacToeAI game = null;
    private int human = 0;
    private int computer = 0;
    private boolean isPlay = false;
    private String[] chars = new String[]{"CANCEL", "X", "O"};

    private void setStatus(String s) {
        statusLabel.setText(s);
    }

    private void setButtonsEnabled(boolean enabled) {
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++) {
                buttons[i][j].setEnabled(enabled);
                if (enabled)
                    buttons[i][j].setText(" ");
            }
    }
    
    public TicTacToeMain() {
        setTitle("Tic Tac Toe");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setResizable(true);
        JPanel centerPanel = new JPanel(new GridLayout(3, 3));
        Font font = new Font("Arial", Font.BOLD, 32);
        for (int i = 0; i < 3; i++) 
            for (int j = 0; j < 3; j++) {
                buttons[i][j] = new JButton(" ");
                buttons[i][j].setFont(font);
                buttons[i][j].addActionListener(this);
                buttons[i][j].setFocusable(false);
                centerPanel.add(buttons[i][j]);
            }
        playButton.addActionListener(this);
        JPanel northPanel = new JPanel();
        northPanel.add(statusLabel);
        JPanel southPanel = new JPanel();
        southPanel.add(playButton);
        setStatus("Click 'Play' To Start");
        setButtonsEnabled(false);
        add(northPanel, "North");
        add(centerPanel, "Center");
        add(southPanel, "South");
        setSize(300, 300);
        setLocationRelativeTo(null);
    }

    public static void main(String[] args) {
        new TicTacToeMain().setVisible(true);
    }

    private void computerTurn() {
        if (!isPlay)
            return;
        int[] pos = game.nextMove(computer);
        if (pos != null) {
            int i = pos[0];
            int j = pos[1];
            buttons[i][j].setText(chars[computer]);
            game.setBoardValue(i, j, computer);
            buttons[i][j].setEnabled(false);
            System.out.println(pos[0]+" "+pos[1]);
        }
        checkState();
    }

    private void checkState() {
        if (game.nextMove(human) == null && game.nextMove(computer) == null){
            playButton.setEnabled(true);
            gameOver("Draw. Click 'Play' For Rematch!");
        }
        if (game.isWin(human)) {
            playButton.setEnabled(true);
            gameOver("Congratulations, You've Won!");
        }
        if (game.isWin(computer)) {
            playButton.setEnabled(true);
            gameOver("Sorry, You Lose!");
        }
    }

    private void gameOver(String s) {
        setStatus(s);
        setButtonsEnabled(false);
        isPlay = false;
    }

    private void click(int i, int j) {
        if (game.getBoardValue(i, j) == TicTacToeAI.EMPTY) {
            buttons[i][j].setText(chars[human]);
            game.setBoardValue(i, j, human);
            buttons[i][j].setEnabled(false);
            checkState();
            computerTurn();
        }
    }

    public void actionPerformed(ActionEvent event) {
        if (event.getSource() == playButton) {
            int confirm = JOptionPane.showConfirmDialog(null, "Do you want to go first?");
            int choice = 0;
            switch (confirm) {
                case 0:
                    int sure2 = 1;
                    while (sure2 == 1 || choice == 0) {
                        choice = JOptionPane.showOptionDialog(null, "Choose your Icon : ", "Icon Select", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, chars, chars[2] + "");
                        sure2 = JOptionPane.showConfirmDialog(null, "Are you sure?");
                    }
                    playButton.setEnabled(false);
                    play(choice, confirm);
                    break;
                case 1:
                    int sure3 = 1;
                    while (sure3 == 1 || choice == 0) {
                        choice = JOptionPane.showOptionDialog(null, "Choose your Icon : ", "Icon Select", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, chars, chars[2] + "");
                        sure3 = JOptionPane.showConfirmDialog(null, "Are you just sure?");
                    }
                    playButton.setEnabled(false);
                    play(choice, confirm);
                    break;
                default:
                    break;
            }
        } else {
            for (int i = 0; i < 3; i++) 
                for (int j = 0; j < 3; j++) 
                    if (event.getSource() == buttons[i][j]) {
                        int sure3 = JOptionPane.showConfirmDialog(null, "Are you sure?");
                        if (sure3 == 0)
                            click(i, j);
                    }
        }
    }
    
    private void play(int choice, int confirm) {
        game = new TicTacToeAI();
        isPlay = true;
        setStatus("Your Turn");
        setButtonsEnabled(true);
        if (confirm == 1) {
            if (choice == 1) {
                human = TicTacToeAI.ONE;
                computer = TicTacToeAI.TWO;
            } else {
                human = TicTacToeAI.TWO;
                computer = TicTacToeAI.ONE;
            }
            int temp = new java.util.Random().nextInt(3);
            int temp2 = new java.util.Random().nextInt(3);
            buttons[temp][temp2].setText(chars[computer]);
            game.setBoardValue(temp, temp2, computer);
            buttons[temp][temp2].setEnabled(false);
        } else {
            if (choice == 1) {
                human = TicTacToeAI.ONE;
                computer = TicTacToeAI.TWO;
            } else {
                human = TicTacToeAI.TWO;
                computer = TicTacToeAI.ONE;
            }
        }
    }
    //package odarve;

public class TicTacToeAI {

    /* the board */
    private int board[][];
    /* empty */
    public static final int EMPTY = 0;
    /* player one */
    public static final int ONE = 1;
    /* player two */
    public static final int TWO = 2;

    public TicTacToeAI() {
        board = new int[3][3];
    }

    /* get the board value for position (i,j) */
    public int getBoardValue(int i, int j) {
        if (i < 0 || i >= 3) 
            return EMPTY;
        if (j < 0 || j >= 3) 
            return EMPTY;
        return board[i][j];
    }

    /* set the board value for position (i,j) */
    public void setBoardValue(int i, int j, int token) {
        if (i < 0 || i >= 3) 
            return;
        if (j < 0 || j >= 3) 
            return;
        board[i][j] = token;
    }

    /* calculate the winning move for current token */
    public int[] nextWinningMove(int token) {
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
                if (getBoardValue(i, j) == EMPTY) {
                    board[i][j] = token;
                    boolean win = isWin(token);
                    board[i][j] = EMPTY;
                    if (win) 
                        return new int[]{i, j};
                }
        return null;
    }

    /* to get the opposite player */
    public int inverse(int token) {
        if (token == ONE) 
            return TWO;
        else 
            return ONE;
    }

    /* calculate the best move for current token */
    public int[] nextMove(int token) {
        /* if we can win move on the next turn */
        int winMove[] = nextWinningMove(token);
        if (winMove != null){ 
            System.out.println("qwe");
            return winMove;
        }
        /* choose the move that prevent enemy to win */
        int winMove2[] = nextWinningMove(inverse(token));
        if (winMove2 != null){ 
            System.out.println("asd");
            return winMove2;
        }
        /* choose the move that creates a fork */
        if (isFork(inverse(token)) != null){
            System.out.println("zxc");
            return isFork(inverse(token));
        }
        /* block fork move of opponent */
        if (isFork(token) != null){
            if((getBoardValue(0, 0) == inverse(token) && getBoardValue(2, 2) == inverse(token))||
                (getBoardValue(0, 2) == inverse(token) && getBoardValue(2, 0) == inverse(token)))
                return new int []{0,1};
            System.out.println("wer");
            return isFork(token);
        }
        /* play center */
        if(getBoardValue(1, 1) == EMPTY){
            System.out.println("sdf");
            return new int[]{1,1};
        }
        /* play opposite corner */
        if(getBoardValue(0, 0) == inverse(token) && getBoardValue(2, 2) == EMPTY){
            System.out.println("xcv");
            return new int[]{2,2};
        }
        if(getBoardValue(0, 2) == inverse(token) && getBoardValue(2, 0) == EMPTY){
            System.out.println("ert");
            return new int[]{2,0};
        }
        if(getBoardValue(2, 0) == inverse(token) && getBoardValue(0, 2) == EMPTY){
            System.out.println("dfg");
            return new int[]{0,2};
        }
        if(getBoardValue(2, 2) == inverse(token)&& getBoardValue(0, 0) == EMPTY){
            System.out.println("cvb");
            return new int[]{0,0};
        }
        /* play empty corner */
        int corner[] = {0,2};
        int temp = new java.util.Random().nextInt(2);
        int temp2 = new java.util.Random().nextInt(2);
        if(getBoardValue(corner[temp],corner[temp2])==EMPTY){
            System.out.println("rty");
            return new int[]{corner[temp],corner[temp2]};
        }
        /* play empty side */
        for (int a = 0; a < 3; a++)
            for (int b = 0; b < 3; b++)
                if (getBoardValue(a, b) == EMPTY)
                    return new int []{a,b};
        
        /* no possible moves */
        System.out.println("fgh");
        return null;
    }
    
    /* determine for fork move*/
    public int[] isFork(int token) {
        int count = 0;
        for (int i = 0; i < 3; i++) 
            for (int j = 0; j < 3; j++) 
                if (getBoardValue(i, j) == EMPTY) {
                    board[i][j] = inverse(token);
                    for (int a = 0; a < 3; a++)
                        for (int b = 0; b < 3; b++)
                            if (getBoardValue(a, b) == EMPTY) {
                                board[a][b] = inverse(token);
                                boolean jay = isWin(inverse(token));
                                board[a][b] = EMPTY;
                                if (jay)
                                    count++;
                            }
                    board[i][j] = EMPTY;
                    if (count == 2){    
                        board[i][j] = token;
                        for (int a = 0; a < 3; a++)
                            for (int b = 0; b < 3; b++)
                                if (getBoardValue(a, b) == EMPTY) {
                                    board[a][b] = token;
                                    boolean jay = isWin(token);
                                    board[a][b] = EMPTY;
                                    if (jay){
                                        board[i][j] = EMPTY;
                                        return new int[]{i, j};
                                    }
                                }
                        board[i][j] = EMPTY;
                    }
                    count = 0;
                }
        return null;
    }

    /* determine if current token is win or not win */
    public boolean isWin(int token) {
        final int DI[] = {-1, 0, 1, 1};
        final int DJ[] = {1, 1, 1, 0};
        for (int i = 0; i < 3; i++) 
            for (int j = 0; j < 3; j++) {
                /* we skip if the token in position(i,j) not equal current token */
                if (getBoardValue(i, j) != token)
                    continue;
                for (int k = 0; k < 4; k++) {
                    int ctr = 0;
                    while (getBoardValue(i + DI[k] * ctr, j + DJ[k] * ctr) == token)
                        ctr++;
                    if (ctr == 3)
                        return true;
                }
            }
        return false;
    }
}
}