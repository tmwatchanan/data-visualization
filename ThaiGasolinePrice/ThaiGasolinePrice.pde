String [] lines;
String[] prices;
float[] Y;
int idx = 0;
float max = 0;

void setup()
{
  frameRate(60);
  size(1920, 1080);
  load_data();
}

void load_data()
{
  lines = loadStrings("data/EC_RL_008.csv");
  prices = split(lines[4], ',');
  Y = new float[prices.length-1];
}

void draw()
{
  if (idx < Y.length) {
  background(0);
  
  noStroke();
  fill(255);
  
  Y[idx] = float(prices[idx+1]);
  if (Y[idx] > max)
  {
    max = Y[idx];
  }
  
  for (int i = 0; i <= idx; i++)
  {
    float x_pos = float(i)*width/idx - 10;
    float y_pos = height - (Y[i] * height / max);
    ellipse(x_pos, y_pos, 5, 5);
  }
  
  textSize(30);
  text(Y[idx], 50, 30);
  
  idx++;
  System.out.println(idx);
  //if (idx >= Y.length)
  //{
  //  idx = 0;
  //  max = Y[0];
  //}
  }
  
}
