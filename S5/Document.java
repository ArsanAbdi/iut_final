package searchEngine;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.TreeMap;


public class Document implements Serializable, Comparable<Document> {

    private Integer id;

    private static final long serialVersionUID = 1L;
    private String text;
    private String title;
    private String date;
    private TreeMap<String,Integer> occurrences;
    private TreeMap<String,Double> frequences;
    private TreeMap<String,Double> TFIDFfrequences;
    private TreeMap<String,Double> frequencesProb;

    public Document(Integer id) {

        this.id = id;
        this.occurrences = new TreeMap<String,Integer>();
        this.frequences = new TreeMap<String,Double>();
        this.TFIDFfrequences = new TreeMap<String,Double>();
        this.frequencesProb = new TreeMap<String,Double>();
    }

    /**Getter and Setter for Id*/
    public Integer getId() {

        return this.id;
    }

    public void setId(Integer id) {

        this.id = id;
    }

    /**Getter and Setter for Hotel*/
    public String getText() {

        return this.text;
    }

    public void setText(String texte) {

        this.text = texte;
    }

    /**Getter and Setter for Titre*/
    public String getTitle() {

        return this.title;
    }

    public void setTitle(String titre) {

        this.title = titre;
    }

    /**Getter and Setter for Date*/
    public String getDate() {

        return this.date;
    }

    public void setDate(String date) {

        this.date = date;
    }

    public void add1Occur(String mot, Integer occurr) {

        this.occurrences.put(mot,occurr);
    }

    public Integer get1Occur(String mot) {

        return this.occurrences.get(mot);
    }

    public boolean existsOccur(String mot) {

        return this.occurrences.containsKey(mot);
    }

    public void add1Freq(String mot, Double frequence) {

        this.frequences.put(mot,frequence);
    }

    public Double get1Freq(String mot) {

        return this.frequences.get(mot);
    }

    public boolean existsFreq(String mot) {

        return this.frequences.containsKey(mot);
    }

    public void add1TFIDFFreq(String mot, Double frequence) {

        this.TFIDFfrequences.put(mot, frequence);
    }

    public Double get1TFIDFFreq(String mot) {

        return this.TFIDFfrequences.get(mot);
    }

    public boolean existsTFIDFFreq(String mot) {

        return this.TFIDFfrequences.containsKey(mot);
    }

    public void add1TFreqProb(String mot, Double frequence) {

        this.frequencesProb.put(mot, frequence);
    }

    public Double get1FreqProb(String mot) {

        return this.frequencesProb.get(mot);
    }

    public boolean existsFreqProb(String mot) {

        return this.frequencesProb.containsKey(mot);
    }

    public TreeMap<String, Double> getFrequences() {

        return this.frequences;
    }

    public TreeMap<String, Integer> getOccurrences() {

        return this.occurrences;
    }

    public TreeMap<String, Double> getTFIDFFrequences() {

        return this.TFIDFfrequences;
    }

    public TreeMap<String, Double> getFrequencesProb() {

        return this.frequencesProb;
    }

    @Override
    public int compareTo(Document other) {

        return this.id.compareTo(other.getId());
    }
}
