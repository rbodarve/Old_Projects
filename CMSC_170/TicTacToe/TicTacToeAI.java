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