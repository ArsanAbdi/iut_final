package com.grille.appliatrous;

import com.grille.appliatrous.algos.AEtoile;
import com.grille.appliatrous.algos.BFS;
import com.grille.appliatrous.algos.Dijkstra;
import modele.Grille;
import modele.Param;
import modele.Sommet;
import javafx.animation.Animation.Status;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Platform;
import javafx.collections.ListChangeListener;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.util.Duration;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class ControllerGrille implements Initializable {

	@FXML
	private StackPane stack;
	@FXML
	private Pane tuiles;
	@FXML
	private Label labelNotice;
	@FXML
	private Button boutonLancerBFS;
	@FXML
	private Button boutonLancerDijkstra;

	private Grille g;
	private int pourcentObstacle = 20;
	private int pourcentCoutant = 50;
	private Sommet source, cible;
	private BFS bfs;
	private Dijkstra dij;
	private Timeline tmBFS = new Timeline();
	private Timeline tmDij = new Timeline();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		g = new Grille(Param.W, Param.H);
		System.out.println("Graphe construit");
		labelNotice.setText(Param.NOTICE);
		g.poseObstacles(pourcentObstacle);
		g.donnePoids(pourcentCoutant, Param.POIDS);
		g.getObstacles().addListener(new ListChangeListener<Sommet>() {
			@Override
			public void onChanged(Change<? extends Sommet> c) {
				while (c.next()) {
					c.getAddedSubList().forEach(s -> getRectangle(s).setFill(Param.OBSTACLE));
					for (Sommet s : c.getRemoved()) {
						if (s.getPoids() > 1)
							getRectangle(s).setFill(Param.COUTANT);
						else
							getRectangle(s).setFill(Param.BASE);
					}
				}
				bfs.setG(g);
				dij.setG(g);
			}
		});
		source = g.getSommet(0, 0);
		cible = g.getSommet(Param.W - 1, Param.H - 1);

		bfs = new BFS(g, source);
		dij = new Dijkstra(g, source);
		initAnimationBFS();
		initAnimationDij();
		initDessin();
		redessine();
		System.out.println("UI faite");
	}

	private void initDessin() {
		for (int j = 0; j < Param.H; j++) {
			for (int i = 0; i < Param.W; i++) {
				Rectangle c = new Rectangle(i * Param.TUILE, j * Param.TUILE, Param.TUILE, Param.TUILE);
				c.setStroke(Color.BLACK);
				c.setStrokeWidth(0.2);
				c.setOnMouseClicked(e -> clicCase(e));
				tuiles.getChildren().add(c);
			}
		}
		coloreSourceCible();
	}

	private Rectangle getRectangle(Sommet s) {
		return (Rectangle) tuiles.getChildren().get(s.getX() + s.getY() * Param.W);
	}

	private void clicCase(MouseEvent e) {
		int x = (int) (e.getX() / Param.TUILE);
		int y = (int) (e.getY() / Param.TUILE);
		Sommet s = g.getSommet(x, y);
		if (e.getButton().equals(MouseButton.PRIMARY)) {
			System.out.println("clic gauche case (" + x + ", " + y + ")");
			if (g.estDeconnecte(s)) {
				g.reconnecte(s);
			} else {
				g.deconnecte(s);

			}
		} else if (e.getButton().equals(MouseButton.SECONDARY)) {
			System.out.println("clic droit case (" + x + ", " + y + ")");
			if (!g.estDeconnecte(s)) {
				cible = source;
				source = s;
				redessine();
				bfs.setSource(source);
				dij.setSource(source);
				coloreSourceCible();
			}
		}
	}

	@FXML
	private void actionBFS(ActionEvent event) {
		System.out.println("Bouton BFS");
		redessine();
		coloreSommetsAnime(bfs.getParcours());
	}

	@FXML
	private void actionDijkstra(ActionEvent event) {
		System.out.println("Bouton Dijkstra");
		redessine();
		coloreSommetsAnime(dij.getParcours());
	}

	@FXML
	void actionCheminBFS(ActionEvent event) {
		System.out.println("Bouton chemin BFS");
		redessine();
		try {
			coloreSommets(bfs.cheminVersSource(cible));
		} catch (NullPointerException e) {
			System.err.println("\n*****\n" + Param.ERREUR_BFS + "\n*****");
			new Alert(AlertType.ERROR, Param.ERREUR_BFS, ButtonType.CLOSE).showAndWait();
		}
	}

	@FXML
	void actionCheminAEtoile(ActionEvent event) {
		System.out.println("Bouton chemin A*");
		redessine();
		AEtoile a = new AEtoile(g, source, cible);
		try {
			coloreSommets(a.cheminVersSource());
		} catch (NullPointerException e) {
			System.err.println("\n*****\n" + Param.ERREUR_AETOILE + "\n*****");
			new Alert(AlertType.ERROR, Param.ERREUR_AETOILE, ButtonType.CLOSE).showAndWait();
		}
	}

	@FXML
	private void actionLancerBFS() {
		System.out.println("Bouton Lancer BFS");
		if (tmBFS.getStatus() == Status.RUNNING) {
			tmBFS.stop();
			boutonLancerBFS.setText("Lancer BFS");
		} else {
			tmBFS.play();
			boutonLancerBFS.setText("Stop");
		}
	}

	@FXML
	private void actionLancerDijkstra() {
		System.out.println("Bouton Lancer Dijkstra");
		if (tmDij.getStatus() == Status.RUNNING) {
			tmDij.stop();
			boutonLancerDijkstra.setText("Lancer Dijkstra");
		} else {
			tmDij.play();
			boutonLancerDijkstra.setText("Stop");
		}
	}

	@FXML
	void actionEfface(ActionEvent event) {
		System.out.println("Bouton Effacer");
		redessine();
	}

	@FXML
	void actionQuitter(ActionEvent event) {
		System.out.println("Bouton Quitter");
		Platform.exit();
	}

	@FXML
	void actionReinitialise(ActionEvent event) {
		System.out.println("Bouton nouveau");
		g = new Grille(Param.W, Param.H);
		g.poseObstacles(pourcentObstacle);
		g.donnePoids(pourcentCoutant, Param.POIDS);
		g.getObstacles().addListener(new ListChangeListener<Sommet>() {
			@Override
			public void onChanged(Change<? extends Sommet> c) {
				while (c.next()) {
					c.getAddedSubList().forEach(s -> getRectangle(s).setFill(Param.OBSTACLE));
					for (Sommet s : c.getRemoved()) {
						if (s.getPoids() > 1)
							getRectangle(s).setFill(Param.COUTANT);
						else
							getRectangle(s).setFill(Param.BASE);
					}
				}
				bfs.setG(g);
				dij.setG(g);
			}
		});
		source = g.getSommet(0, 0);
		cible = g.getSommet(Param.W - 1, Param.H - 1);
		bfs = new BFS(g, source);
		dij = new Dijkstra(g, source);
		redessine();
	}

	private void redessine() {
		tuiles.getChildren().stream().forEach(c -> ((Rectangle) c).setFill(Param.BASE));
		g.getSommets().stream().filter(s -> s.getPoids() != 1).forEach(s -> getRectangle(s).setFill(Param.COUTANT));
		g.getSommets().stream().filter(s -> g.estDeconnecte(s)).forEach(s -> getRectangle(s).setFill(Param.OBSTACLE));
		coloreSourceCible();
	}

	private void coloreSommets(ArrayList<Sommet> sommets) {
		sommets.stream().filter(s -> !g.estDeconnecte(s)).forEach(s -> getRectangle(s).setFill(Param.CHEMIN));
		coloreSourceCible();
	}

	private void coloreSommetsAnime(ArrayList<Sommet> sommets) {
		Timeline tmTmp = new Timeline();
		tmTmp.setCycleCount(sommets.size());
		KeyFrame kf = new KeyFrame(Duration.seconds(0.002), new EventHandler<ActionEvent>() {
			int i = 0;
			Sommet s;

			public void handle(ActionEvent ae) {
				if (!sommets.isEmpty()) {
					s = sommets.get(i);
					i++;
					if (!g.estDeconnecte(s))
						getRectangle(s).setFill(Param.CHEMIN);
				}
			}
		});

		tmTmp.getKeyFrames().add(kf);
		tmTmp.play();
		tmTmp.setOnFinished(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				coloreSourceCible();
			}
		});
	}

	private void coloreSourceCible() {
		getRectangle(source).setFill(Param.SOURCE);
		getRectangle(cible).setFill(Param.CIBLE);
	}

	private void initAnimationBFS() {
		tmBFS.setCycleCount(Timeline.INDEFINITE);
		ArrayList<Sommet> alea = listeSommetsAlea();
		KeyFrame kf = new KeyFrame(Duration.seconds(0.15), new EventHandler<ActionEvent>() {
			public void handle(ActionEvent ae) {
				redessine();
				alea.add(sommetAlea());
				for (int i = 0; i < alea.size(); i++) {
					getRectangle(alea.get(i)).setFill(Param.CHEMIN);
				}
				alea.replaceAll(s -> bfs.getPredecesseurs().get(s));
				alea.removeIf(s -> s == null || s.equals(source));

			}
		});

		tmBFS.getKeyFrames().add(kf);
	}

	private void initAnimationDij() {
		tmDij.setCycleCount(Timeline.INDEFINITE);
		ArrayList<Sommet> alea = listeSommetsAlea();
		KeyFrame kf = new KeyFrame(Duration.seconds(0.15), new EventHandler<ActionEvent>() {
			public void handle(ActionEvent ae) {
				redessine();
				alea.add(sommetAlea());
				for (int i = 0; i < alea.size(); i++) {
					getRectangle(alea.get(i)).setFill(Param.CHEMIN);
				}
				alea.replaceAll(s -> dij.getPredecesseurs().get(s));
				alea.removeIf(s -> s == null || s.equals(source));
			}
		});

		tmDij.getKeyFrames().add(kf);
	}

	private ArrayList<Sommet> listeSommetsAlea() {
		ArrayList<Sommet> liste = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			liste.add(sommetAlea());
		}
		return liste;
	}

	private Sommet sommetAlea() {
		Sommet s = source;
		while (s.equals(source) || s.equals(cible) || g.estDeconnecte(s)) {
			int x = (int) (Math.random() * Param.W);
			int y = (int) (Math.random() * Param.H);
			s = g.getSommet(x, y);
		}
		return s;
	}

}
