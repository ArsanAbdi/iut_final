


import edu.uci.ics.jung.algorithms.shortestpath.DijkstraShortestPath;
import edu.uci.ics.jung.graph.*;


import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

/**
 * Created by cataldi on 09/09/15.
 */
public class Main {

    static DirectedGraph<String,String> graphAirports = new DirectedSparseGraph<String, String>();
    static String filePathAirports = "data/airports.dat";
    static String filePathRoutes= "data/routes.dat";

    public static void main(String [] args) {

        parseFiles();
        algoPlusCourtChemin("CUZ", "LIM");
    }

    public static void parseFiles() {
        HashMap<String,String> codeName = new HashMap<String,String>();
        HashMap<String,String> codeCountry = new HashMap<String,String>();
        HashMap<String,String> routesAirports = new HashMap<String,String>();
        HashMap<String,String> routesCountries = new HashMap<String,String>();

        try {

            //Scan airport file
            Scanner scan = new Scanner(new File(filePathAirports));
            while (scan.hasNext()) {
                String name = new String();
                String code = new String();
                String country = new String();


                String line = scan.nextLine();
                Scanner champ = new Scanner(line);
                champ.useDelimiter(",");
                int counter = 1;
                while (champ.hasNext()) {
                    String x = champ.next();

                    //Airport name extraction
                    if (counter == 2) {
                        name = x.substring(1,x.length()-1);
                    }

                    //Airport country  extraction
                    if (counter == 4) {
                        country = name = x.substring(1,x.length()-1);

                    }

                    //Airport code extraction
                    if (counter == 5) {
                        code = name = x.substring(1,x.length()-1);
                    }

                    counter = counter + 1;
                    if (!code.equals("")){
                         codeName.put(code, name);
                         codeCountry.put(code, country);
                         graphAirports.addVertex(code);
                    }
                }
            }

            //Scan Route file
            scan = new Scanner(new File(filePathRoutes));
            while (scan.hasNext()){
                String depart = new String();
                String destination = new String();

                String line = scan.nextLine();
                Scanner champ = new Scanner(line);
                champ.useDelimiter(",");
                int counter = 1;
                while (champ.hasNext()) {
                    String x = champ.next();

                    if (counter == 3) {
                        depart= x.trim();
                    }
                    if (counter == 5) {
                        destination=x.trim();
                    }
                    counter=counter+1;
                }
                if (!depart.equals("") && !destination.equals("")){
           ;
                    routesAirports.put(depart,destination);
                    routesCountries.put(codeCountry.get(depart),codeCountry.get(destination));
                    if (graphAirports.containsEdge(depart+" "+destination)){
                        //TODO: do something if you want to count how many flights there are for each route
                    }
                    graphAirports.addEdge(depart+" "+destination,depart, destination);
                }
            }

            System.out.println("Vertex counts : "+graphAirports.getVertexCount());
            System.out.println("Edges counts : "+graphAirports.getEdgeCount());



            //exemple d'utilisation avec Algo JUNG
            DijkstraShortestPath alg = new DijkstraShortestPath(graphAirports);
            List<String> l = alg.getPath("CUZ", "BDS");
             System.out.println(l.toString());



        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void algoPlusCourtChemin(String departure, String arrivals) {

        System.out.println(graphAirports.getInEdges(arrivals));
        System.out.println(graphAirports.getOutEdges(departure));

    }
}
