//declaracion de bibliotecas
import processing.video.*;
import processing.serial.*;
//inicializacion de variables globales
Capture video;
Serial port;

void setup()
{
  //tamaño de la pantalla
  size(640,480);
  //inicializacion de video
  video = new Capture(this,640,480,30);
  video.start();
  //inicialización del puerto series
  //port = new Serial(this, "COM13", 9600);
}

void mousePressed()
{
  //obtener un frame por click
  video.read();
}

void draw()
{
  //inicializacion del fondo en blanco
  background(0);
  //obtencion de la imagen
  image(video,0,0);
  //carga de los pixeles
  loadPixels();
  //colocación de los pixeles en el centro
  int loc1 = 320/2+480/2;
  //obtencion de los 3 colores
  float r1= red(video.pixels[loc1]);
  float g1= green(video.pixels[loc1]);
  float b1= blue(video.pixels[loc1]);
  //coordenadas 100,220
  int loc2 = 100/2+220/2;
  //obtencion de los colores
  float r2= red(video.pixels[loc2]);
  float g2= green(video.pixels[loc2]);
  float b2= blue(video.pixels[loc2]);
  //coordenadas 220,400
  int loc3 = 220/2+400/2;
  //obtencion de los colores
  float r3= red(video.pixels[loc3]);
  float g3= green(video.pixels[loc3]);
  float b3= blue(video.pixels[loc3]);
  
  int r = (int)(r1+r2+r3)/3;//promedio del rojo
  int g = (int)(g1+g2+g3)/3;//promedio del verde
  int b = (int)(b1+b2+b3)/3;//promedio del azul
  //impresion en pantalla del promedio de los colores
  print("r:", r, "g: ", g, "b: ", b, "\n");
  /*port.write(r);//envio del rojo
  port.write(g);//envio del verde
  port.write(b);//envio del azul*/

}
// Esta parte es ejecutada al momento de ser recibida
// la información en arduino
void serialEvent(Serial p) 
{
  try 
  {
    // Obtencon del mensaje (ASCII > 13)
    String message = p.readStringUntil(13);
    // Solamente si hay información
    if (message != null) 
    {
      println("Mensaje recibido: "+trim(message));
    }
  }
  catch (Exception e) 
  {
  }
}
