package searchEngine;

import java.io.Serializable;
import java.util.Comparator;
import java.util.TreeMap;


public class Keyword  implements Serializable, Comparable<Keyword> {

    private static final long serialVersionUID = 1L;
    private String term;
    private final TreeMap<Integer,Integer> occurrences;
    private final TreeMap<Integer,Double> frequences;
    private final TreeMap<Integer,Double> TFIDFfrequences;
    private final TreeMap<Integer,Double> frequencesProb;


    public Keyword(String mot) {

        this.occurrences = new TreeMap<Integer,Integer>();
        this.frequences = new TreeMap<Integer,Double>();
        this.TFIDFfrequences = new TreeMap<Integer,Double>();
        this.frequencesProb = new TreeMap<Integer,Double>();
        this.term = mot;
    }

    /**Getter and Setter for term*/
    public String getTerm() {

        return this.term;
    }

    public void setTerm(String term) {

        this.term = term;
    }

    public Integer get1Occur(Integer  idDoc) {

        return this.occurrences.get(idDoc);
    }

    public boolean existsOccur(Integer  idDoc) {

        return this.occurrences.containsKey(idDoc);
    }

    public void add1Occur(Integer idDoc, Integer occur){

        this.occurrences.put(idDoc,occur);
    }

    public Double get1Freq(Integer  idDoc) {

        return this.frequences.get(idDoc);
    }

    public void add1Freq(Integer idDoc, Double freq) {

        this.frequences.put(idDoc,freq);
    }

    public boolean existsFreq(Integer  idDoc) {

        return this.occurrences.containsKey(idDoc);
    }

    public Double get1TFIDFFreq(Integer  idDoc) {

        return this.TFIDFfrequences.get(idDoc);
    }

    public void add1TFIDFFreq(Integer idDoc, Double freq){

        this.TFIDFfrequences.put(idDoc,freq);
    }

    public boolean existsTFIDFreq(Integer  idDoc) {

        return this.TFIDFfrequences.containsKey(idDoc);
    }

    public Double get1FreqProb(Integer  idDoc) {

        return this.frequencesProb.get(idDoc);
    }

    public void add1FreqProb(Integer idDoc, Double freq){

        this.frequencesProb.put(idDoc,freq);
    }

    public boolean existsFreqProb(Integer  idDoc) {

        return this.frequencesProb.containsKey(idDoc);
    }

    public TreeMap<Integer, Double> getFrequences() {

        return this.frequences;
    }

    public TreeMap<Integer, Integer> getOccurrences() {

        return this.occurrences;
    }

    public TreeMap<Integer, Double> getTFIDFFrequences() {

        return this.TFIDFfrequences;
    }

    public TreeMap<Integer, Double> getFrequencesProb() {

        return this.frequencesProb;
    }

    @Override
    public int compareTo(Keyword other) {

        return this.term.compareTo(other.getTerm());
    }
}
