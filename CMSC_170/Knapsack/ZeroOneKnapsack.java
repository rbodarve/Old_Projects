class Item{
	public String itemName;
	public int weight;
	public double price;
	
	public Item(String itemName, int weight, double price){
		this.itemName = itemName;
		this.weight = weight;
		this.price = price;
	}
}

public class ZeroOneKnapsack {
	
	private Item[] items = null;
	
    public ZeroOneKnapsack(Item[] items) {
    	this.items = items;
    }
    
    public boolean[] takeItems(int maxWeightAllowed){
    	double[][] values = new double[this.items.length+1][maxWeightAllowed+1];
    	boolean[][] taken = new boolean[this.items.length+1][maxWeightAllowed+1];
    	
    	for(int w=0; w<=maxWeightAllowed; w++){
    		values[0][w] = 0.0;
    		taken[0][w] = false;
    	}
    	
    	for(int i=1; i<=this.items.length; i++){
    		values[i][0] = 0.0;
    		taken[i][0] = false;
    	}
    	
    	for(int i=1; i<=this.items.length; i++){
    		for(int w=1; w<=maxWeightAllowed; w++){
    			if(this.items[i-1].weight <= w){
    				double prev = values[i-1][w];
    				double current = this.items[i-1].price + values[i-1][w - this.items[i-1].weight];
    				
    				if(prev > current){
    					values[i][w] = prev;
    					taken[i][w] = false;
    				}
    				else{
    					values[i][w] = current;
    					taken[i][w] = true;
    				}
    			}
    			else{
    				values[i][w] = values[i-1][w];
    				taken[i][w] = false;
    			}
    		}
    	}
    	
    	//construct 0-1 (boolean) return array indicating which item is taken
    	//backtrack from the last item at full capacity, decrementing the
    	//remaining weight each time an item is actually taken
    	boolean[] ret = new boolean[this.items.length];
    	int w = maxWeightAllowed;
    	for(int i=this.items.length; i>=1; i--){
    		if(values[i][w] != values[i-1][w]){
    			ret[i-1] = true;
    			w -= this.items[i-1].weight;
    		}
    	}
    	return ret;
    }
    
    //main method
    //test Continuous Knapsack implementation
    public static void main (String[] args) {
    	//setup items
    	//Item(Item_Name, Item_Weight, Item_Price)
    	Item[] items = new Item[]{
    		new Item("Iron", 5, 10.0),
    		new Item("Silver", 2, 40.0),
    		new Item("Coppur", 5, 30.0),
    		new Item("Gold", 10, 50.0)		
    	};

    	//maximum qauntity of the container
    	int maxWeight = 16;
    	
    	ZeroOneKnapsack ks = new ZeroOneKnapsack(items);
    	boolean[] taken = ks.takeItems(maxWeight);
    	
    	System.out.println ("Item taken:");
    	for(int i=0; i<taken.length; i++){
    		if(taken[i])
    			System.out.println (items[i].itemName + " - " + items[i].price);
    	}
	}
}