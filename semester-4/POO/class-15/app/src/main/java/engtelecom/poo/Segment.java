package engtelecom.poo;

import edu.princeton.cs.algs4.*;

public class Segment {

  private Draw desenho = new Draw();

  public void desenhaTriangulo() {

    this.desenho.setPenColor(Draw.BLUE);

    double[] coordenadaX = { 100, 400, 700 };
    double[] coordenadaY = { 100, 700, 100 };

    this.desenho.filledPolygon(coordenadaX, coordenadaY);
  }

}
