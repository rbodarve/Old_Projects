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
}
