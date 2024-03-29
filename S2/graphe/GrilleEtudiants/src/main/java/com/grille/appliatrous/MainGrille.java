package com.grille.appliatrous;

import com.grille.appliatrous.algos.BFS;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import modele.Sommet;

import java.util.ArrayList;

public class MainGrille extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {
			BorderPane root = FXMLLoader.load(getClass().getResource("grille.fxml"));
			Scene scene = new Scene(root, 930, 695);
			primaryStage.setTitle("Arbres couvrants et chemins dans un graphe");
			primaryStage.setResizable(false);
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

		launch(args);
	}
}
