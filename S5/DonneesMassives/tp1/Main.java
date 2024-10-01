package searchEngine;

import javax.print.Doc;
import java.io.*;
import java.util.*;

import static java.lang.Double.NaN;

public class Main {
    public static void main(String[] args) throws IOException {

        /** initialisation scanner + chargements des datas **/
        Scanner sc = new Scanner(System.in);
        Index index = new Index();
        TreeMap<Integer, Document> documents = Index.loadDocuments();
        TreeMap<String, Keyword> vocabularies = Index.loadVocabulary();

        /** début de la recherche et son parsing **/
        System.out.print("Your research: ");
        String research = sc.nextLine();

        /** parsing **/
        List<String> parse_research = new ArrayList<>();
        Collections.addAll(parse_research, research.split(" "));

        /** mise en place d'une liste avec les stop words **/
        BufferedReader br = new BufferedReader(new FileReader(new File("src/searchEngine/stopwords.txt")));
        List<String> stopWordsList = new ArrayList<>();
        String word = br.readLine();
        while (word != null) {

            stopWordsList.add(word);
            word = br.readLine();
        }

        /** filtrate **/
        Iterator<String> it = parse_research.iterator();
        while (it.hasNext()) {
            String st = it.next();
            for (String stopWord : stopWordsList) {
                if (st.equals(stopWord)) {
                    it.remove();
                }
            }
        }

        TreeMap<Keyword, Float> research_coef = new TreeMap<>();
        for (String word_parse_research: parse_research) {

            if (index.getKeyword(word_parse_research) != null) {

                research_coef.put(index.getKeyword(word_parse_research), (float) (1.0 / (parse_research.size())));
            }
        }



        for (Map.Entry<Keyword, Float> entry : research_coef.entrySet()) {
            System.out.println("Keyword: " + entry.getKey().getTerm() + ", Coefficient: " + entry.getValue());
        }

        TreeMap<Document, Double> result_par_doc = new TreeMap<>();
        for (int i = 0; i < documents.size(); i++) {

            if (index.getDocument(i) == null || index.getDocument(i).getText() == null) {

            }
            else {

                double numerator = 0;
                Document doc = index.getDocument(i);
                //System.out.println(doc.getText());
                //System.out.println(doc.getFrequences());
                for (Keyword keyword : research_coef.keySet()) {

                    String next = keyword.getTerm();
                    if (doc.existsFreq(next)) {

                        numerator = numerator + (doc.get1Freq(next) * research_coef.get(index.getKeyword(next)));
                        //System.out.println(doc.get1Freq(next));
                        //System.out.println(research_coef.get(index.getKeyword(next)));
                    }
                }
                System.out.println("numerator: " + numerator);

                if (numerator != 0) {

                    double denominator = 0;
                    double first_part = 0;
                    double second_part = 0;

                    TreeMap<String, Double> frequences_doc_un = doc.getFrequences();
                    for (String word_doc_un: frequences_doc_un.keySet()) {


                        first_part = first_part + (frequences_doc_un.get(word_doc_un) * frequences_doc_un.get(word_doc_un));
                    }
                    first_part = Math.sqrt(first_part);
                    System.out.println("first part: " + first_part);
                    for (Keyword key: research_coef.keySet()) {

                        String next = key.getTerm();
                        second_part = second_part + Math.pow(research_coef.get(index.getKeyword(next)), 2);
                    }
                    second_part = Math.sqrt(second_part);
                    System.out.println("second part: " + second_part);
                    denominator = first_part * second_part;
                    System.out.println("denominator: " + denominator);
                    double result = numerator / denominator;
                    System.out.println("result: " + result);

                    result_par_doc.put(doc, result);
                }
            }
        }
        System.out.println(result_par_doc.size());
        /*for (Document un_doc : result_par_doc.keySet()) {

            if (result_par_doc.get(d) != 0.0) {

                System.out.println("Le document " + d.getId() + " a une valeur de " + result_par_doc.get(d));
            }
        }*/


        result_par_doc.entrySet()
                .stream()
                .filter(entry -> !Double.isNaN(entry.getValue()))
                .sorted(Map.Entry.<Document, Double>comparingByValue().reversed())
                .limit(10)
                .forEach(entry -> {
                    System.out.println("Document: " + entry.getKey().getText() + ", Value: " + entry.getValue());
                });

    }
}