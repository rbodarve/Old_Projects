package knapsack;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.*;
import java.util.*;
import javax.swing.JTextArea;
import static java.lang.System.out;

public class Knapsack {
    public static class GUI {
        JFrame frame;   //variable declaration
        JLabel Lresult, Lstatus, Lsoln, Lvisited, Lnulls;
        JButton solveIt, getFile;
        JPanel x, p1_read, p1_solve, p1_inputtbox, p1_solntbox, p1_outputtbox, panel2;
        JPanel p2_upper, p2_last, panel3, p3_upper, lastPanel;
        JTextArea inputTBox, solnTbox, outputTbox;
        JScrollPane scroll;
        File file;

        public GUI(String title){   //function that defines the GUI of the program
            Lresult = new JLabel("Results:");   //initial state
            Lstatus = new JLabel("STATUS: No results yet.");
            Lsoln = new JLabel(".txt");
            Lvisited = new JLabel(".txt");
            Lnulls = new JLabel(" ");

            solveIt = new JButton("Solve Knapsack with DFS");//events to handle when activated
            getFile = new JButton("Read File");

            x = new JPanel();   //panel for the whole interface
            p1_read = new JPanel();//panel for reading file
            p1_solve = new JPanel();//panel for solving the problem
            p1_inputtbox = new JPanel();//panel for the inputbox
            p1_solntbox = new JPanel();//panel for the solutions box
            p1_outputtbox = new JPanel();//panel for the output box

            panel2 = new JPanel();
            p2_upper = new JPanel();
            p2_last = new JPanel();
            panel3 = new JPanel();
            p3_upper = new JPanel();

            lastPanel = new JPanel();
            inputTBox = new JTextArea(15,10);//textbox for the input file
            solnTbox = new JTextArea(15,10);//textbox for the solutions
            outputTbox = new JTextArea(15,10);//textbox for the outputs

            frame = new JFrame(title);//launch frame
        }

        public void loadGUI(){
            getFile.addActionListener(new ReadFile());//function ReadFile is implemented when clicked
            solveIt.addActionListener(new solveKnapsack());//function solveKnapsack is implemented when clicked
            frame.addWindowListener(new WindowHandler());

            p1_read.setLayout(new FlowLayout());
            p1_read.add(getFile);
            p1_solve.setLayout(new FlowLayout());
            p1_solve.add(solveIt);
            p1_inputtbox.setLayout(new FlowLayout());
            p1_inputtbox.add(inputTBox);
            p1_solntbox.setLayout(new FlowLayout());
            p1_solntbox.add(solnTbox);
            p1_outputtbox.setLayout(new FlowLayout());
            p1_outputtbox.add(outputTbox);

            x.setLayout(new BorderLayout());
            x.add(p1_read, BorderLayout.NORTH);
            x.add(p1_inputtbox, BorderLayout.CENTER);
            x.add(p1_solve, BorderLayout.SOUTH);

            p2_upper.setLayout(new BorderLayout());
            p2_upper.add(Lresult, BorderLayout.NORTH);
            p2_upper.add(Lsoln, BorderLayout.CENTER);
            panel2.setLayout(new BorderLayout());
            panel2.add(p2_upper, BorderLayout.NORTH);
            panel2.add(p1_solntbox, BorderLayout.WEST);

            p3_upper.setLayout(new GridLayout(2,1));
            p3_upper.add(Lnulls);
            p3_upper.add(Lvisited);
            panel3.setLayout(new BorderLayout());
            panel3.add(p3_upper, BorderLayout.NORTH);
            panel3.add(p1_outputtbox, BorderLayout.WEST);

            p2_last.setLayout(new BorderLayout());
            p2_last.add(panel2, BorderLayout.WEST);
            p2_last.add(panel3, BorderLayout.CENTER);
            p2_last.add(Lstatus, BorderLayout.SOUTH);

            frame.setLayout(new FlowLayout());
            lastPanel.setLayout(new FlowLayout());
            lastPanel.add(x);
            lastPanel.add(p2_last);
            
            scroll = new JScrollPane(lastPanel);
            frame.add(scroll);
            frame.setVisible(true);
            frame.setSize(465, 380);
            frame.setLocation(100,100);
            frame.setResizable(true);
        }

        class ReadFile implements ActionListener{   //class for reading and solving the problem
            public void actionPerformed(ActionEvent e) {
                JFileChooser choose = new JFileChooser ();//for opening files
                int getData = choose.showDialog(choose, "Open");//for choosing what file to be opened
                String newline = "\n";

                if(JFileChooser.APPROVE_OPTION == getData){
                    file = choose.getSelectedFile();
                    if(inputTBox.getText().isEmpty()){
                        try{
                            FileReader frame = new FileReader(file);
                            BufferedReader br = new BufferedReader(frame);

                            String data;
                            while ((data=br.readLine())!=null) {    //read file
                                inputTBox.append(data);
                                inputTBox.append(newline);
                            }
                            
                            frame.close();
                        }catch (FileNotFoundException a){ a.printStackTrace();
                        }catch (IOException a){ a.printStackTrace(); }
                    }
                    else{
                        inputTBox.setText(" ");
                        try{
                            FileReader frame = new FileReader(choose.getSelectedFile());
                            BufferedReader br = new BufferedReader(frame);

                            String data;
                            while ((data=br.readLine())!=null) {
                                inputTBox.append(data);
                                inputTBox.append(newline);
                            }

                            frame.close();
                        }catch (FileNotFoundException a){ a.printStackTrace();
                        }catch (IOException a){ a.printStackTrace(); }
                    }
                }
                else{ choose.setSelectedFile(null); }
            }
        }

        class solveKnapsack implements ActionListener{  //class for solving knapsack
            JOptionPane pane = new JOptionPane();

            public void actionPerformed(ActionEvent e) {
                if(inputTBox.getText().isEmpty()){//if there is no opened file
                    JOptionPane.showMessageDialog(pane, "Please Select a File", "Warning", JOptionPane.ERROR_MESSAGE);
                }
                else{//solving the knapsack problem
                    read readtheFile = new read();//create object for read
                    readtheFile.reading(file,inputTBox, solnTbox, outputTbox);//starts solving
                    Lstatus.setText("STATUS: Done");    //after getting all the solutions and
                    Lsoln.setText("solution.txt");      //the nodes visited, output boxes will be
                    Lvisited.setText("visited.txt");    //initialized and saved in another files
               }
            }
        }

        class WindowHandler implements WindowListener{
            public void windowClosing(WindowEvent e){ System.exit(0); }
            public void windowActivated(WindowEvent e){}
            public void windowClosed(WindowEvent e){}
            public void windowDeactivated(WindowEvent e){}
            public void windowDeiconified(WindowEvent e){}
            public void windowIconified(WindowEvent e){}
            public void windowOpened(WindowEvent e){}
        }
    }

    public static class read {//implements computation for knapsack problem
        String token, byLine;   //variable declaration
	FileReader fr;
	BufferedReader br2;
	StringTokenizer st;
	Vector<Integer> saveProf, saveWeight;
	Integer n;
	int i, maxCap;

        public read(){}//constructor

        public void reading(File file, JTextArea inputTBox, JTextArea solnTbox, JTextArea outputTbox){
            token = "";
            maxCap = 0;
            saveProf = new Vector<Integer>();   //saves profit of each item
            saveWeight = new Vector<Integer>(); //saves weight of each item
            inputTBox.setText("");solnTbox.setText("");outputTbox.setText("");
            
            try{
                fr = new FileReader(file);  //reader
                br2 = new BufferedReader(fr);

                while((byLine = br2.readLine()) != null){   //reads the line
                    st = new StringTokenizer(byLine);

                    if(st.countTokens() == 2){//if the line contains two strings of numbers
                        token = st.nextToken();//saves the first string
                        try{
                            i = Integer.parseInt(token);//converts the string into integer
                            n = new Integer(i);//object integer
                            saveProf.addElement(n);//saved in a vector for profit
                        }catch(NumberFormatException e){ out.println("Invalid."); }

                   	token = st.nextToken();//saves the second string
               		try{
                            i = Integer.parseInt(token);//converts the string into integer
                            n = new Integer(i);//object integer
                            saveWeight.addElement(n);//saved in a vector for weight
               		}catch(NumberFormatException e){ out.println("Invalid."); }
                    }
                    else if(st.countTokens() == 1){//if there is only one string in the line
                        token = st.nextToken();//saves the capacity of knapsack
               		try{ maxCap = Integer.parseInt(token); }//saved as an intger type
               		catch(NumberFormatException e){ out.println("Invalid."); }
                    }
                }
           
                sort sorting = new sort(maxCap, saveProf.size());//object sort
                sorting.sortAll(saveProf, saveWeight, inputTBox,solnTbox,outputTbox);//call for sorting
            }catch(IOException e){
                e.printStackTrace();
                out.println("File not found.");
            }
        }

        public class sort {//class sort
            int maxCap, size;

            public sort(int c, int s) {//constructor
                this.maxCap = c;
                this.size = s;
            }
            //function that sorts the items based in descending order based on the density
            public void sortAll(Vector saveProf, Vector saveWeight, JTextArea inputTBox, JTextArea solnTbox, JTextArea outputTbox){
                inputTBox.setText("");//sets the input box to nothing for showing the sorted one
                String[] sprofit, sweight;//temporary variables
                int i, a, bou, c;
                int[] x, y, z;
    	
                x = new int[size];
                y = new int[size];
                z = new int[size];
                sprofit = new String[size];
                sweight = new String[size];
    	
                for(i = 0; i<size; i++){
                    sprofit[i] = saveProf.elementAt(i).toString();//saves profit in String type
                    sweight[i] = saveWeight.elementAt(i).toString();//saves weight in String type
                }
    	
                for(i = 0; i<size; i++){
                    try{
    			x[i] = Integer.parseInt(sprofit[i]);//saves profit in integer type
    			y[i] = Integer.parseInt(sweight[i]);//saves profit in integer type
                    }
                    catch(NumberFormatException e){ out.println("Parsed object isn't an integer."); }
                }
    	
                for(i = 0; i<size; i++){ z[i] = x[i]/y[i]; }//compute for each density
    	
                for(i = 0; i<size; i++){//outer loop for sorting starts with the first element
                    for(int choose = i+1; choose<size; choose++){ //starts with the next element
    			if(z[i] < z[choose]){//check if the elements are ascending
                            a = z[i];       //for density interchange
                            z[i] = z[choose];
                            z[choose] = a;

                            bou = x[i]; //for profit interchange
                            x[i] = x[choose];
                            x[choose] = bou;
    	
                            c = y[i];   //for weight interchange
                            y[i] = y[choose];
                            y[choose] = c;
    			}
                    }
                }
                String hehe = new String();
                hehe = String.valueOf(maxCap);
                for(int j=0; j<size; j++){
                    inputTBox.append(x[j]+" "+y[j]+"\n");//displays the sorted items in descending order
                }
                inputTBox.append(hehe);//appending the capacity of knapsack

                solve solve = new solve(maxCap, size);//object solve
                solve.dfs(x, y, z, inputTBox,solnTbox,outputTbox);//solves knapsack problem by dfs
            }
        }

        public class solve {
            //ATTRIBUTES
            private int i, last_lev, last_pos, temp_pos, temp_lev, ex_index, k_capacity, k, mp, size;
            private int profit, weight, bound, temp_profit, temp_weight, temp_bound;
            private int[] nclude, xclude;
            private Stack<Integer> max_profit, lev_index_stack;
            private Vector<Integer> lev, pos, pro, wt, b;
            private boolean promising, started, stop;

            //CONSTRUCTOR
            public solve(int c, int s) {
                this.k_capacity = c;            //knapsack capacity
                this.size = s;                  //number of items
                max_profit = new Stack<Integer>();  //stack for possible max profits
                lev_index_stack = new Stack<Integer>();
                lev = new Vector<Integer>();    //vector for LEVEL of a node
                pos = new Vector<Integer>();    //vector for POSITION of a node
                pro = new Vector<Integer>();    //vector for possible max profits generated
                wt = new Vector<Integer>();     //vector for weight
                b = new Vector<Integer>();      //vector for bound
                last_lev = 0;               //initial is zero
                last_pos = 0;               //initial is zero
                k = -1;
                mp = 0;                     //initially zero
                temp_profit = 0;            //set to zero
                temp_weight = 0;            //set to zero
                temp_bound = 0;             //set to zero
                profit = 0;                     //running profit
                weight = 0;                     //running weight
                bound = 0;                      //running bound
                started = false;
                stop = false;
                xclude = new int[s];    //array for items that are impossible to yield max profit
                nclude = new int[s];    //array for items that may have the max profit
                
                for(i=0; i<s; i++){ //initialize array elements to false/0
                    xclude[i] = 0;
                    nclude[i] = 0;
                }
            }

            //Function that solves the kanpsack problem using DFS
            public void dfs(int p[], int w[], int pw[], JTextArea textInput, JTextArea textSolution, JTextArea textOutput) {
                int temp, temp_p, temp_w, temp_count=0, j, k=0;//temporary variables
                boolean trigger = false;
                Integer n;
                String newline1 = "\n";

                if(started == false){   //initially empty
                    lev.addElement(0);  //at first level,
                    pos.addElement(0);  //node is from (0,0)
                    get_bound(p, w, pw);//call for function get_bound
                    started = true; //sets the variable to true to continue traversing
                }
                else{
                    if(if_promising() == true){     //Check if node is promising
    			go_left(p, w, pw);          //if true, traverse left child node
                    }
                    else{   //if false, backtrack
    			if((last_lev == 1) && (last_pos == 2)){//if not promising & node is (1,2)
    				stop = true;        //stopper
                        }
    			else{   //backtrack
                            if(last_pos%2 == 1){
                                last_pos += 1;
    				try{
                                    temp_p = p[last_lev-1];
                                    temp_w = w[last_lev-1];
                                    profit -= temp_p;
                                    weight -= temp_w;
    				}
    				catch(NumberFormatException e){
                                    out.println("Error in parsing object.");
    				}
                            }
                            else{
    				for(i = (pos.size()-1); i>0; i--){
                                    try{
                                        temp_pos = Integer.parseInt(pos.elementAt(i).toString());
    					if(temp_pos%2 == 0){
                                            for(k=size; k>=1; k--){
                                                for(j=1; j<pos.size(); j++){
                                                    temp = Integer.parseInt(lev.elementAt(j).toString());
                                                    if(temp == k) temp_count++;
    						}

                                                if(temp_count%2 == 1){
                                                    trigger = true;
                                                    break;
    						}
                                            }
    					}

                                        if(trigger == true){
                                            n = new Integer(k);
                                            temp = lev.lastIndexOf(n);	//index of lev
                                            last_pos = Integer.parseInt(pos.elementAt(temp).toString());
                                            last_pos += 1;
                                            last_lev = k;
                                            temp_p = p[last_lev-1];
                                            temp_w = w[last_lev-1];
                                            profit -= temp_p;
                                            weight -= temp_w;
                                            break;
    					}
                                    }catch(NumberFormatException e){
                                        out.println("Error in parsing object.");
                                    }
    				}
                            }

                            lev.addElement(last_lev);
                            pos.addElement(last_pos);
    
                            exclude();//call to function exclude to reject the node

                            get_bound(p, w, pw);//call to calculate bound
    			}
                    }
                }
        
                if(stop == true){   //BASE CASE
                    try{
                        int[] store_pro = new int[lev.size()];
                        int[] store_wt = new int[lev.size()];
                        int[] store_lev = new int[lev.size()];
                        int[] store_pos = new int[lev.size()];
                        int the_max = 0, index = 0;

                        for(int bilang=0; bilang<lev.size(); bilang++){
                            store_pro[bilang] = Integer.parseInt(pro.elementAt(bilang).toString());
                            store_wt[bilang] = Integer.parseInt(wt.elementAt(bilang).toString());
                            store_lev[bilang] = Integer.parseInt(lev.elementAt(bilang).toString());
                            store_pos[bilang] = Integer.parseInt(pos.elementAt(bilang).toString());
                        }

                        for(int maxi=0; maxi<lev.size(); maxi++){
                            if(store_wt[maxi] <= mp){
                                if(the_max < store_pro[maxi]){
                                    the_max = store_pro[maxi];
                                    index = maxi;
                                }
                            }
                        }

    			mp = Integer.parseInt(max_profit.peek().toString());
                        get_items(mp, p, w, pw);


                        for(i=0; i<size; i++){
                            if(nclude[i] == 1) textSolution.setText(" ");
                            textSolution.append("Item " + (i+1) + "<" + p[i] + "," + w[i] + ">" + newline1);
    			}
                      
    			textSolution.append("Max Profit: " + mp);
                    }catch(NumberFormatException e){ out.println("Error in parsing object."); }
                }
                else{   //RECURSIVE CASE
                    textOutput.append("(" + last_lev + "," + last_pos + ")" + newline1);//output to JTextArea
                    dfs(p, w, pw, textInput, textSolution, textOutput);//call to calculate dfs
                }

                write output_write = new write();
                output_write.outputNodes(textOutput.getText()); //output to file
                output_write.outputSoln(textSolution.getText());
            }

            public boolean if_promising(){//function to examine if a node is promising or not
                if(weight <= k_capacity){   //if current weight is less than the capacity of knapsack
                    try{
    			if(max_profit.isEmpty() == true){ //if initially empty
                            max_profit.push(0);
    			}
    			mp = Integer.parseInt(max_profit.peek().toString());
    			if(profit > mp){    //if the current profit is greater than the max profit
                            max_profit.push(profit); //update max profit
                            mp = Integer.parseInt(max_profit.peek().toString());
    			}
                    }
                    catch(NumberFormatException e){ out.println("Error in parsing object."); }
                    
                    if(bound > mp){ promising = true; } //check if current bound is greater than the
                    else promising = false;            //max profit
                }
                else{
                    promising = false; //current weight cannot be accomodated
                }
                return promising;//return result
            }
    
            public void get_bound(int p[], int w[], int pw[]){  //function to COMPUTE FOR BOUND
                for(i=0; i<pw.length ; i++){
                    if(xclude[i] == 1){ continue; } //exclude an item if item is set to 1
                    else{
    			if((temp_weight+w[i]) > k_capacity){
                            k = i;
                            break;
    			}
    			else{
                            temp_weight += w[i];
                            temp_profit += p[i];
    			}
                    }
                }
                if(k != -1){  //bound can be calculated since current weight is less than max profit
                    temp_bound = temp_profit + ((k_capacity-temp_weight)*pw[k]);//if there is an item
                }                                           //which is partially added to the knapsack
                else temp_bound = temp_profit + ((k_capacity-temp_weight)*0);//no items is partially placed

                bound = temp_bound; //current bound
                pro.addElement(profit); //save to vector for future reference
                wt.addElement(weight);
                b.addElement(bound);
                temp_profit = 0;
                temp_weight = 0;	//RESET TO
                temp_bound = 0;		//ZERO (FOR THE NEXT USAGE)
                k = -1;
                for(i=0; i<size; i++)	//initialize array elements to false/0
                    xclude[i] = 0;
            }

            public void go_left(int p[], int w[], int pw[]){
                try{    //add new level
                    last_lev = Integer.parseInt(lev.lastElement().toString());
                    last_lev += 1; //go deeper by one level
                    lev.addElement(last_lev);
                }
                catch(NumberFormatException e){ out.println("Error in parsing object."); }

                try{    //add new position
                    temp_pos = Integer.parseInt(lev.lastElement().toString());//last level
                    last_pos = count_lev();
                    pos.addElement(last_pos);
                }
                catch(NumberFormatException e){ out.println("Error in parsing object."); }

   		profit += p[last_lev-1];    //update running profit
   		weight += w[last_lev-1];    //update running weight
    		pro.addElement(profit);     //add the profit to the current node
    		wt.addElement(weight);      //add the weight to the current node
    		b.addElement(bound);        //add the bound to the current node
            }

            public boolean search_pls(){    //helper function 1
                int temp_lev2, temp_pos2;
                boolean pwede = false;
                try{
                    temp_lev = Integer.parseInt(lev.elementAt(ex_index).toString());
                    for(i=0; i<pos.size(); i++){
                        try{
                            temp_lev2 = Integer.parseInt(lev.elementAt(i).toString());
                            if(temp_lev2 == temp_lev)
                                lev_index_stack.push(i);
 			}
                        catch(NumberFormatException e){ out.println("Error in parsing object."); }
                    }
                }
                catch(NumberFormatException e){ out.println("Error in parsing object."); }

                for(i=0; i<lev_index_stack.size(); i++){
                    try{
    			temp_lev2 = Integer.parseInt(lev_index_stack.pop().toString());
    			temp_pos2 = Integer.parseInt(pos.elementAt(temp_lev2).toString());
    			if(temp_pos2 >= (temp_pos+1)){
                            pwede = false;
                            continue;
    			}
    			else{
                            last_lev = Integer.parseInt(lev.elementAt(temp_lev2).toString());
                            pwede = true;
                            break;
    			}
                    }
                    catch(NumberFormatException e){ out.println("Error in parsing object."); }
                }
                return pwede;
            }

            public int count_lev(){ //helper function 2
                int temp_lev3, cc=0;

                for(i=0; i<lev.size(); i++){
                    try{
    			temp_lev3 = Integer.parseInt(lev.elementAt(i).toString());
                        if(temp_pos == temp_lev3)
                            cc++;
                    }
                    catch(NumberFormatException e){ out.println("Error in parsing object."); }
                }

                return cc;
            }

            public void exclude(){  //determines which items to exclude
                int temp_last_lev=0, temp_last_pos, l_l, l_p;
                temp_last_pos = last_pos;

                if((temp_last_pos != 0) && (temp_last_pos%2 == 0)){
                    try{
    			temp_last_lev = Integer.parseInt(lev.lastElement().toString());
    			xclude[temp_last_lev-1] = 1;
                    }
                    catch(NumberFormatException e){ out.println("Error in parsing object."); }

                    for(i=pos.size()-2; i>=0; i--){
    			try{
                            l_l = Integer.parseInt(lev.elementAt(i).toString());
                            l_p = Integer.parseInt(pos.elementAt(i).toString());
                            if((l_p!= 0) && (l_p%2 == 0)){
                                if((l_l<temp_last_lev) && (l_p<=temp_last_pos)){
                                    xclude[l_l-1] = 1;
                                    temp_last_lev = l_l;
                                    temp_last_pos = l_p;
    				}
                            }
    			}
    			catch(NumberFormatException e){ out.println("Error in parsing object."); }
                    }
                }
            }

            public void get_items(int mp, int p[], int w[], int pw[]){  //get the items that generate
                int target_level_index, level, level2, position, level_count=0, j;  //max profit
                Integer t = new Integer(mp);

                try{
                    target_level_index = pro.indexOf(t);
                    //check nodes starting from current to previous nodes
                    for(i=target_level_index; i>0; i--){
                        if((position = Integer.parseInt(pos.elementAt(i).toString())%2) == 1){
                            level = Integer.parseInt(lev.elementAt(i).toString());
                            for(j=target_level_index; j>0; j--){
                                level2 = Integer.parseInt(lev.elementAt(j).toString());
                                if(level2 == level)
                                    level_count++;
                            }
                            if(level_count%2 == 1){
                                nclude[level-1] = 1;
                                level_count=0;
                            }
                        }
                    }
                }
                catch(NumberFormatException e){ out.println("Error in parsing object."); }
            }
        }

        public class write {
            File result_knap = new File("result.txt");
            File solution_knap = new File("solution.txt");

            public write(){}
    
            public void outputNodes(String getText) {
                try{
                    FileWriter r = new FileWriter(result_knap);
                    r.write(getText);
                    r.close();
                }catch(IOException e){ e.printStackTrace(); }
            }

            public void outputSoln(String getText2){
                try{
                    FileWriter r1 = new FileWriter(solution_knap);
                    r1.write(getText2);
                    r1.close();
                }catch(IOException e){ e.printStackTrace(); }
            }
        }
    }

    public static void main(String[] args) {//main function of the program
        //initialize object of GUI
        GUI knapsack_gui = new GUI("Solving the Knapsack Problem Using Depth First Search Method");
        //call to function that loads the gui
        knapsack_gui.loadGUI();
    }
}