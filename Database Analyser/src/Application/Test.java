package Application;


import Parser.Category;
import Parser.Query;
import Parser.Token;
import Parser.ParserException;

public class Test
{
  /**
   * @param args
   */
  public static void main(String[] args)
  {
    try
    {
      Query query = new Query("ALTER TABLE tname DROP COLUMN cname");     
      for (Token tok : query.getTokens())
      {
        System.out.println(tok.token +" : "+ tok.toString());
      }
      System.out.println("\n"+query.getCategoty()+" | "+query.toString());
    }
    catch (ParserException e)
    {
      System.out.println(e.getMessage());
    }
  }
}
