package es.ucm.immutablecollections;


import org.javimmutable.collections.IMaps;

public class MapTest {
  public static void main(String[] args) {
    var d = IMaps.hashed().assign("Pepe", 32).assign("Maria", 25);
    System.out.println(d.get("Pepe"));
    System.out.println(d.getValueOr("NoExiste", -1));
  }}
