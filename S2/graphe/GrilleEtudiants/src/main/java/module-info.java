module com.grille.grilleetudiants {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires graphe;

    opens com.grille.appliatrous to javafx.fxml;
    exports com.grille.appliatrous;
}