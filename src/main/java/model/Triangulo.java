/*  
    APP 06: CALCULOS EQUILATERO JSP
    AUTORA: Maria Tchijov Cruz
    FECHA: 10/02/22
    Archivo JAVA para calcular base y altura de un triángulo

 */

package model;

public class Triangulo 
{
    //ATRIBUTOS DE LA CLASE
    private String nombre;
    private int base;
    private int altura;
    private int perimetro;
    private int area;
    
    //CONSTRUCTOR QUE CONVIERTE EL TEXTO INGRESADO EN INT
    public Triangulo(String base, String altura) 
    {
        this.setBase(Integer.parseInt(base));
        this.setAltura(Integer.parseInt(altura));
    }
    
    //CONSTRUCTOR PARA UTILIZAR ÚNICAMENTE LOS MÉTODOS DE LA CLASE
    public Triangulo() {}
    
       
    //MÉTODOS GET Y SET PARA ATRIBUTOS PRIVADOS
    public String getNombre() {return nombre;}
    public void setNombre(String nombre) {this.nombre = nombre;}       
    public int getBase() {return base;}
    public void setBase(int base) {this.base = base;}
    public int getAltura() {return altura;}
    public void setAltura(int altura) {this.altura = altura;}
    public int getPerimetro() {return perimetro;}
    public void setPerimetro(int perimetro) {this.perimetro = perimetro;}
    public int getArea() {return area;}
    public void setArea(int area) {this.area = area;}
    
    //MÉTODOS PRINCIPALES DE LA CLASE
    //perimetro : CALCULA EL PERÍMETRO
    public void perimetro()
    {
        //Se calcula el perímetro con la fórmula P = 3base
        int perimetro = 3 * base;
        //Se guarda el resultado
        this.setPerimetro(perimetro);
    }
    
    //area : CALCULA EL ÁREA
    public void area()
    {
        //Se calcula el área con la fórmula A = (base * altura) / 2
        int area = (base * altura) / 2;
        //Se guarda el resultado
        this.setArea(area);
    }
    
}
